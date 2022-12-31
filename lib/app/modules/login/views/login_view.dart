import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextFormField(
              controller: controller.loginEmailCtrl,
            ),
            TextFormField(
              controller: controller.loginPassCtrl,
              decoration: InputDecoration(
                  prefix: InkWell(
                child: Icon(controller.loginShowPass
                    ? Icons.lock_open_rounded
                    : Icons.lock_outlined),
              )),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Login"),
                ))
          ],
        ));
  }
}
