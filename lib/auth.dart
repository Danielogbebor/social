import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/individualwidgets.dart';
import 'package:social/pages/verification.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  // initialise firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthProvider() {
    checkSingnedIn();
  }

  void checkSingnedIn() async {
    final SharedPreferences authenticate =
        await SharedPreferences.getInstance();
    _isSignedIn = authenticate.getBool('authenticated') ?? false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        //
        verificationFailed: (e) {
          showAlertDialog(context: context, message: e.toString());
        },

        //
        codeSent: (String smsCode, resendSmsCode) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Verification(smsCode: smsCode),
              ));
        },
        //
        codeAutoRetrievalTimeout: (String smsCode) {},
      );
    } on FirebaseAuthException catch (e) {
      //
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
