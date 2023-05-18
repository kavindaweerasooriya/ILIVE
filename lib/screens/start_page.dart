import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiv_tracker/screens/sign_in_page.dart';
import 'package:hiv_tracker/screens/sign_up_page.dart';

import '../common/constants.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'ILIVE+',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
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
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Text(
                      'Empowering you with knowledge and emotional support!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: 60,
                      width: 240,
                      margin: const EdgeInsets.all(32),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()),
                          );
                        },
                        child: const Text(
                          'Get started',
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
                  Image.asset(
                    'assets/images/start_page.png',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
