import 'package:flutter/material.dart';
import 'package:social/individualwidgets.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text(
          "Profile Info",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        const Center(
          child: Text(
            "please provide your name and a profile photo",
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 112, 112, 112)),
          child: GestureDetector(
            onTap: () {
              print("add image");
            },
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.add_a_photo,
                size: 45,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: MyTextfield(
                  textAlign: TextAlign.left,
                  hintText: "Enter your name ",
                  controller: null,

                  // nameController,
                ),
              ),
            )
          ],
        )
      ])),
    );
  }
}
