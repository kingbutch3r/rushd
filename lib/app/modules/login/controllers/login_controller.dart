import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController loginEmailCtrl = TextEditingController();
  TextEditingController loginPassCtrl = TextEditingController();
  bool loginShowPass = false;

  TextEditingController registeremailctrl = TextEditingController();
  TextEditingController registerNamectrl = TextEditingController();
  TextEditingController registerPassctrl = TextEditingController();
  User? user;
  login() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmailCtrl.text, password: loginPassCtrl.text);
  }

  regsier() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: loginEmailCtrl.text, password: loginPassCtrl.text)
        .then((value) => value.user!.sendEmailVerification());
  }

  checklogin() async {
    if (FirebaseAuth.instance.currentUser == null) {
      user = await FirebaseAuth.instance
          .signInAnonymously()
          .then((value) => value.user);
    } else {
      user = FirebaseAuth.instance.currentUser;
    }
  }

  @override
  void onInit() {
    checklogin();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
