import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/individualwidgets.dart';

import '../auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
}
