import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/individualwidgets.dart';
import 'package:social/pages/model.dart';
import 'package:social/pages/verification.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;

  // initialise firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
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
        codeSent: (String verificationId, resendSmsCode) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Verification(smsId: verificationId),
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

// verify otpcode

  void verifyOtp({
    required BuildContext,
    required String verificationId,
    // required String smsCode,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showAlertDialog(message: e.toString(), context: BuildContext);
      _isLoading = false;
      notifyListeners();
    }
  }

  // existing user
  Future<bool> checkForExistingUser() async {
    DocumentSnapshot hasData =
        await _firebaseFirestore.collection("user").doc(_uid).get();
    if (hasData.exists) {
      print("user exist");
      return true;
    } else {
      print("user exist");
      return false;
    }
  }

  void saveUserData({
    required BuildContext context,
    required UserModel userModel,
    required File profilePhoto,
    required Function onSuccess,
  }) async {
    _isLoading = false;
    notifyListeners();
    try {} on FirebaseAuthException catch (e) {
      showAlertDialog(context: context, message: e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}


// // chatgpt verify code
// Future<String?> verifyOTP(String verificationId, String otpCode) async {
//   try {
//     // Create a PhoneAuthCredential with the verification ID and OTP code
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: otpCode,
//     );

//     // Sign in using the credential
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);

//     // Get the user's ID token
//     String idToken = await userCredential.user!.getIdToken();

//     // Return the ID token
//     return idToken;
//   } catch (e) {
//     // Handle verification failure
//     print('OTP verification failed: $e');
//     // Return an error message or null to indicate failure
//     return null;
//   }
// }
