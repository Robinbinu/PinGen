import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinggen/providers/firestoreprovider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('timestamp')
      .snapshots();

  final List<String> messages = [];

  //TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  // @override
  // void dispose() {
  //   _textEditingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
        builder: (context, FirestoreProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Chat Screen'),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }
                    {
                      return ListView(
                        controller: _scrollController,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              DateTime date = data['timestamp'].toDate();
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(data['message']),
                                    subtitle: Text("${date.hour>12?date.hour-12:date.hour}:${date.minute<10?'0${date.minute}':date.minute} ${date.hour>12?'PM':'AM'}"),
                                  ),
                                ],
                              );
                            })
                            .toList()
                            .cast(),
                      );

                      // return ListView.builder(
                      //   itemCount: messages.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return ListTile(
                      //       title: Text(messages[index]),
                      //     );
                      //   },
                      // );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 60,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: FirestoreProvider.totext,
                        decoration: InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        sendMessage(FirestoreProvider.totext.text);
                        FirestoreProvider.addtext();
                        FirestoreProvider.totext.clear();
                        Timer(Duration(seconds: 1), () {
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add(text);
        // _textEditingController.clear();
      });
    }
  }
}
