import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/auth.dart';
import 'package:social/individualwidgets.dart';
import 'package:social/pages/model.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  File? image;
  final nameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void uploadData() {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      UserModel userModel = UserModel(
        name: nameController.text.trim(),
        profilePhoto: " ",
        uid: " ",
        phoneNumber: " ",
        createdAt: " ",
      );
      if (image != null) {
        ap.saveUserData(
          context: context,
          onSuccess: () {},
          userModel: userModel,
          profilePhoto: image!,
        );
      } else {
        showAlertDialog(context: context, message: "Add profile Photo");
      }
    }

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
        Column(
          children: [
            InkWell(
              child: image == null
                  ? CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.add_a_photo,
                        size: 40,
                      ),
                      radius: 50,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 50,
                    ),
              onTap: () async {
                image = await pickImage(context);
                setState(() {});
              },
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: MyTextfield(
                  textAlign: TextAlign.left,
                  hintText: "Enter your name ",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  suffixIcon: Icon(
                    Icons.emoji_emotions,
                    size: 30,
                  ),

                  // nameController,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 60),
        MyButton(
          text: "Next",
          onPressed: () {
            uploadData();
            print("next");
          },
        )
      ])),
    );
  }
}
