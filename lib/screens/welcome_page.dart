import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiv_tracker/common/constants.dart';
import 'package:hiv_tracker/screens/connect_with_others_page.dart';
import 'package:hiv_tracker/screens/explore_articles_page.dart';
import 'package:hiv_tracker/screens/healthcare_contacts_page.dart';

class Welcome extends StatefulWidget {
  String email;
  Welcome({Key? key, required this.email}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState(email: email);
}

class _WelcomeState extends State<Welcome> {
  String email;
  _WelcomeState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'ILIVE+',
          style: appBarText,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: headerWidth,
                height: 110,
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Text(
                      'Welcome to Our Community',
                      // textAlign: TextAlign.center,
                      style: headerStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: boxHeight,
                      width: boxWidth,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConnectWithOthers(
                                      email: email,
                                    )),
                          );
                        },
                        child: const Text(
                          'Join the Conversation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: boxHeight,
                      width: boxWidth,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ExploreArticles()),
                          );
                        },
                        child: const Text(
                          'Read articles!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: boxHeight,
                      width: boxWidth,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthcareContacts()),
                          );
                        },
                        child: const Text(
                          'Help is One Tap Away',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
