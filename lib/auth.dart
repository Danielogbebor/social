import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/individualwidgets.dart';
import 'package:social/pages/model.dart';

import 'package:social/pages/verification_page.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  // initialise firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  AuthProvider() {
    checkSingnedIn();
  }

  void checkSingnedIn() async {
    final SharedPreferences authenticate =
        await SharedPreferences.getInstance();
    _isSignedIn = authenticate.getBool("is_signedIn") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences authenticate =
        await SharedPreferences.getInstance();
    authenticate.setBool("is_signedIn", true);
    _isSignedIn = true;
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

  // existing user or not
  Future<bool> checkForExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      print("user exist");
      return true;
    } else {
      print("user exist");
      return false;
    }
  }

//
  void saveUserData({
    required BuildContext context,
    required UserModel userModel,
    required File profilePhoto,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      await storeFileToStorage("profilePhoto/$_uid", profilePhoto)
          .then((value) {
        userModel.profilePhoto = value;
        userModel.createdAt = DateTime.timestamp.toString();
        userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
        userModel.uid = _firebaseAuth.currentUser!.phoneNumber!;
      });
      _userModel = userModel;
      await _firebaseFirestore
          .collection("users")
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showAlertDialog(context: context, message: e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

//
  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future getDataFromFirebaseFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot["name"],
        profilePhoto: snapshot["profilePhoto"],
        uid: snapshot["uid"],
        phoneNumber: snapshot["phoneNumber"],
        createdAt: snapshot["createdAt"],
        bio: snapshot["bio"],
      );
      _uid = userModel.uid;
    });
  }

  // share preference
  Future userDataFromSP() async {
    SharedPreferences authenticate = await SharedPreferences.getInstance();
    await authenticate.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getDataSP() async {
    SharedPreferences authenticate = await SharedPreferences.getInstance();
    String data = authenticate.getString("user_model") ?? " ";
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }

  Future signOut() async {
    SharedPreferences authenticate = await SharedPreferences.getInstance();

    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    authenticate.clear();
  }
}
