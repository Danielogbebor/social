// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:social/pages/contact_page.dart';

import '../individualwidgets.dart';

class ChatPage extends StatefulWidget {
  final String receiverPhoneNumber;
  final String receiverUID;
  const ChatPage({
    Key? key,
    required this.receiverPhoneNumber,
    required this.receiverUID,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          // title: Text(widget.receiverPhoneNumber),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactPage(),
                      ));
                },
                icon: Icon(Icons.contact_phone),
                color: Colors.white,
                iconSize: 30,
              ),
            )
          ]),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text("chatpage"),
      ),
    );
  }
}
