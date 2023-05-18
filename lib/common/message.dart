import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  String email;
  Message({super.key, required this.email});

  @override
  State<Message> createState() => _MessageState(email: email);
}

class _MessageState extends State<Message> {
  String email;
  _MessageState({required this.email});

  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot queryDocumentSnapshot = snapshot.data!.docs[index];
            Timestamp timestamp = queryDocumentSnapshot['time'];
            DateTime dateTime = timestamp.toDate();
            print(dateTime.toString());
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
              child: Column(
                crossAxisAlignment: email == queryDocumentSnapshot['email']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          queryDocumentSnapshot['email'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              queryDocumentSnapshot['message'],
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Text(
                            "${dateTime.hour}:${dateTime.minute}",
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class Message extends StatefulWidget {
//   String email;
//   Message({Key? key, required this.email}) : super(key: key);
//
//   @override
//   State<Message> createState() => _MessageState(email: email);
// }
//
// class _MessageState extends State<Message> {
//   String email;
//   _MessageState({required this.email});
//
//   final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
//       .collection('Messages')
//       .orderBy('time')
//       .snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _messageStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text("error");
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: snapshot.data!.docs.length,
//           physics: const ScrollPhysics(),
//           shrinkWrap: true,
//           primary: true,
//           itemBuilder: (_, index) {
//             DocumentSnapshot queryDocumentSnapshot = snapshot.data!.docs[index];
//             Timestamp timestamp = queryDocumentSnapshot['time'];
//             DateTime dateTime = timestamp.toDate();
//             print(dateTime.toString());
//
//             bool isAdmin = queryDocumentSnapshot['isAdmin'] ?? false;
//             Color textColor =
//             isAdmin ? Colors.red : Colors.black; // Set text color for admin messages
//
//             String message = queryDocumentSnapshot['message'] ?? '';
//             String senderEmail = queryDocumentSnapshot['email'] ?? '';
//
//             return Padding(
//               padding:
//               const EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
//               child: Column(
//                 crossAxisAlignment: email == senderEmail
//                     ? CrossAxisAlignment.end
//                     : CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 300,
//                     child: ListTile(
//                       tileColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                           color: Colors.white,
//                         ),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       title: Padding(
//                         padding: const EdgeInsets.only(top: 8),
//                         child: Text(
//                           senderEmail,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       subtitle: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             width: 200,
//                             child: Text(
//                               message,
//                               softWrap: true,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: textColor, // Apply text color
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "${dateTime.hour}:${dateTime.minute}",
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
