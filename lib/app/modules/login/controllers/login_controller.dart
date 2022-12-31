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

  checklogin() {
    if (FirebaseAuth.instance.currentUser == null) {
// Get.toNamed(page)
    }
  }

  @override
  void onInit() {
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
