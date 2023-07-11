import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/individualwidgets.dart';
import 'package:social/pages/chat_page.dart';

import '../auth.dart';

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _HomeState();
}

class _HomeState extends State<Social> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text("Social"),
      ),
      drawer: const MyDrawer(),
      body:
          // _buildContact(),
          //

          Center(
        child: Column(
          children: [
            Text(ap.userModel.name),
            Text(ap.userModel.phoneNumber),
            Text(ap.userModel.uid),
            Text(ap.userModel.createdAt),
          ],
        ),
      ),
    );
  }

  //  list of contacts
  Widget _buildContact(DocumentSnapshot document) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading...");
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildContactItem(doc))
              .toList(),
        );
      },
    );
  }

  // individual userlist item
  Widget _buildContactItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // display all userlist items
    if (_auth.currentUser!.phoneNumber != data["phoneNumber"]) {
      return ListTile(
        title: Text(data["phoneNumber"]),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverPhoneNumber: 'phoneNumber',
                        receiverUID: 'uid',
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
