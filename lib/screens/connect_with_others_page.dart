import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../common/constants.dart';
import '../common/message.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


// import 'package:perspectiveapi/perspectiveapi.dart';

class ConnectWithOthers extends StatefulWidget {
  String email;
  ConnectWithOthers({super.key, required this.email});

  @override
  State<ConnectWithOthers> createState() =>
      _ConnectWithOthersState(email: email);
}

class _ConnectWithOthersState extends State<ConnectWithOthers> {
  String email;
  _ConnectWithOthersState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();













  Future<void> analyzeMessage(String messageText) async {
    final url = Uri.parse('https://commentanalyzer.googleapis.com/v1alpha1/comments:analyze?key=AIzaSyBFBO43lMRZDTMLCYRSoySCSblkoOwR5jk');
    final response = await http.post(
      url,
      body: jsonEncode({
        'comment': {
          'text': messageText,
        },
        'requestedAttributes': {
          'TOXICITY': {},
        },
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final toxicityScore = responseBody['attributeScores']['TOXICITY']['summaryScore']['value'];

      if (toxicityScore >= 0.5) {
        // The message is considered toxic, do not send it
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cannot send this message'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      } else {
        // not a toxic message can send to firestore
        fs.collection('Messages').doc().set({
          'message': messageText.trim(),
          'time': DateTime.now(),
          'email': email,
        });
      }
    } else {
      // Error occurred during analysis, handle accordingly
      //error handling in the api


    }
  }





















  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Connect with Others',
          style: appBarText,
        ),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.77,
                  child: Message(
                    email: email,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: message,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'message',
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: const Color.fromARGB(
                                          255, 60, 60, 60)),
                                  borderRadius: new BorderRadius.circular(10),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.purple),
                                  borderRadius: new BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {},
                              onSaved: (value) {
                                message.text = value!;
                              },
                            ),
                          ),
                          IconButton(
                            // onPressed: () {
                            //   if (message.text.isNotEmpty) {
                            //     fs.collection('Messages').doc().set({
                            //       'message': message.text.trim(),
                            //       'time': DateTime.now(),
                            //       'email': email,
                            //     });
                            //     message.clear();
                            //   }
                            // },

                            onPressed: () async {
                              if (message.text.isNotEmpty) {
                                await analyzeMessage(message.text);
                                message.clear();
                              }
                            },

                            icon: const Icon(Icons.send_sharp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
