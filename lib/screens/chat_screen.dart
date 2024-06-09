// كود الفايربيس
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// كود الفايربيس
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth_web/firebase_auth_web.dart';
final _firestore = FirebaseFirestore.instance;
late User signedInUser;

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // كود الفايربيس

  // final _auth = FirebaseAuth.instance;
  // final _authweb = FirebaseAuthWeb.instance;
  final messegeTextController = TextEditingController();

  String? messageText;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      // final user = _auth.currentUser;
      // final userWeb = _authweb.currentUser;
      // if (user != null) {
      //   signedInUser = user;
      //   print(signedInUser.email);
      // }
    } catch (e) {
      print(e);
    }
  }

  // void getMesseges() async {
  //   // كود الفايربيس
  //   try {
  //     final messeges = await _firestore.collection('messeges').get();
  //     for (var messege in messeges.docs) {
  //       print(messege.data());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

// دالة تجلب الرسائل(البيانات) من الفايربيس اوتوماتيكي بدون ضغط زر
  // void messegesStreem() async {
  //   try {
  //     await for (var snapshot
  //         in _firestore.collection('messeges').snapshots()) {
  //       for (var message in snapshot.docs) {
  //         print(message.data());
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Chat'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // كود الفايربيس
              // getMesseges();
              //add here logout function
              // _auth.signOut();
              // messegesStreem();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            // icon: const Icon(Icons.download),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessegeStreamBuilder(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.green[900]!,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messegeTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'write your message here ...',
                          border: InputBorder.none),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messegeTextController.clear();
                      try {
                        // كود الفايربيس
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': signedInUser,
                          'time': FieldValue.serverTimestamp(),
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessegeStreamBuilder extends StatelessWidget {
  const MessegeStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messeges')
          .orderBy('time')
          .snapshots(), //من تأتي البيانات
      builder: (context, snapshot) {
        List<MessegeLine> messegeWidgets = [];
        if (!snapshot.hasData) {
          // add here a spinner لولب التحميل
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }

        final messeges = snapshot.data!.docs.reversed;
        for (var messege in messeges) {
          final messegeText = messege.get('text');
          final messegeSender = messege.get('sender');
          final currentUser = signedInUser.email;

          // ignore: prefer_const_constructors
          final messegeWidget = MessegeLine(
            sender: messegeSender,
            text: messegeText,
            isMe: currentUser == messegeSender,
          );
          messegeWidgets.add(messegeWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messegeWidgets,
          ),
        );
      },
    );
  }
}

class MessegeLine extends StatelessWidget {
  const MessegeLine(
      {super.key,
      required this.sender,
      required this.text,
      required this.isMe});
  final String? sender;
  final String? text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender :',
            style: TextStyle(fontSize: 12, color: Colors.blue[900]),
          ),
          Material(
            elevation: 7, //ظل للخلفية
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            color: isMe ? Colors.blue[800] : Colors.yellow[400],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                ' $text',
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
