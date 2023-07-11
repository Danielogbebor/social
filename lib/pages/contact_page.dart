import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Select Contact",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              "5 contacts",
              style: TextStyle(fontSize: 13, color: Colors.white),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search), color: Colors.white),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.white)
        ],
      ),
    );
  }
}
