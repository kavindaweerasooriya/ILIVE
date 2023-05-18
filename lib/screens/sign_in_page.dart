import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiv_tracker/screens/sign_up_page.dart';
import 'package:hiv_tracker/screens/welcome_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../authentication/auth.dart';
import '../common/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? errors = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      navigation();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errors = e.message;
      });
    }
  }

  void navigation() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Welcome(
                  email: _controllerEmail.text,
                )),
      );
    });
  }

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
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: headerWidth,
                height: 160,
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Text(
                      'Connect with the community that cares',
                      // textAlign: TextAlign.center,
                      style: headerStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 300,
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _controllerEmail,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: textFieldStyle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: textFieldStyle,
                            ),
                            hintText: 'Email',
                            hintStyle: textFieldColor,
                          ),
                          style: textFieldColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 300,
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _controllerPassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: textFieldStyle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: textFieldStyle,
                            ),
                            hintText: 'Password',
                            hintStyle: textFieldColor,
                          ),
                          style: textFieldColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 36,
                    child: Text('$errors',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: 60,
                      width: 200,
                      margin: const EdgeInsets.all(90),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          signInWithEmailAndPassword();
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                    child: SizedBox(
                      width: 160,
                      child: Row(
                        children: [
                          const Text('I’m a new user  ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal)),
                          InkWell(
                            child: const Text('Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
