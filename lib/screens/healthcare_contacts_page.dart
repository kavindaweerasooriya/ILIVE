import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';

class HealthcareContacts extends StatefulWidget {
  const HealthcareContacts({Key? key}) : super(key: key);

  @override
  State<HealthcareContacts> createState() => _HealthcareContactsState();
}

class _HealthcareContactsState extends State<HealthcareContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Healthcare Contacts',
          style: appBarText,
        ),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      height: 110,
                      width: 400,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Ellipse 2.png',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: const [
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Dr.Mark Robinson',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Infectious Disease Specialist',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Kandy Teaching Hospital',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 110,
                      width: 400,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Ellipse 3.png',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: const [
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Dr.Mark Robinson',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Infectious Disease Specialist',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Kandy Teaching Hospital',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 110,
                      width: 400,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Ellipse 4.png',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: const [
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Dr.Mark Robinson',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Infectious Disease Specialist',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Kandy Teaching Hospital',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 110,
                      width: 400,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Ellipse 5.png',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: const [
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Dr.Mark Robinson',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      'Infectious Disease Specialist',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: contactsBoxWidth,
                                    child: Text(
                                      'Kandy Teaching Hospital',
                                      style: contactsBoxText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
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



//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../common/constants.dart';
//
// class HealthcareContacts extends StatefulWidget {
//   const HealthcareContacts({Key? key}) : super(key: key);
//
//   @override
//   State<HealthcareContacts> createState() => _HealthcareContactsState();
// }
//
// class _HealthcareContactsState extends State<HealthcareContacts> {
//   CollectionReference contactsCollection =
//   FirebaseFirestore.instance.collection('contacts');
//
//   List<Contact> contacts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadContacts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ... rest of the code
//
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           child: ListView.builder(
//             itemCount: contacts.length,
//             itemBuilder: (context, index) {
//               final contact = contacts[index];
//               return _buildContactItem(contact);
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContactItem(Contact contact) {
//     return Center(
//       child: Container(
//         height: 110,
//         width: 400,
//         margin: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: contactsBoxWidth,
//                 child: Text(
//                   contact.name,
//                   style: contactsBoxText,
//                 ),
//               ),
//               SizedBox(
//                 width: contactsBoxWidth,
//                 child: Text(
//                   contact.specialization,
//                   style: contactsBoxText,
//                 ),
//               ),
//               SizedBox(
//                 width: contactsBoxWidth,
//                 child: Text(
//                   contact.hospital,
//                   style: contactsBoxText,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _loadContacts() async {
//     final snapshot = await contactsCollection.get();
//
//     setState(() {
//       contacts = snapshot.docs
//           .map((doc) => Contact.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();
//     });
//   }
//
//   void _addContact(Contact newContact) async {
//     final contactData = newContact.toJson();
//
//     await contactsCollection.add(contactData);
//
//     setState(() {
//       contacts.add(newContact);
//     });
//   }
// }
//
// class Contact {
//   final String name;
//   final String specialization;
//   final String hospital;
//
//   const Contact({
//     required this.name,
//     required this.specialization,
//     required this.hospital,
//   });
//
//   factory Contact.fromJson(Map<String, dynamic> json) {
//     return Contact(
//       name: json['name'],
//       specialization: json['specialization'],
//       hospital: json['hospital'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'specialization': specialization,
//       'hospital': hospital,
//     };
//   }
// }
