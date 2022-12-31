import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rushd/app/modules/login/controllers/login_controller.dart';

class RegisterView extends GetView<LoginController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextFormField(
              controller: controller.registerNamectrl,
            ),
            TextFormField(
              controller: controller.registeremailctrl,
            ),
            TextFormField(
              controller: controller.registerPassctrl,
            ),
          ],
        ));
  }
}
