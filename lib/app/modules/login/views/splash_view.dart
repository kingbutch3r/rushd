import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rushd/app/common/const.dart';
import 'package:rushd/app/modules/login/controllers/login_controller.dart';

class SplashView extends GetView<LoginController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Const.primaryColor,
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: Get.height / 3,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Rushd",
            style: TextStyle(
                fontSize: 24,
                color: Const.mainBlack,
                fontWeight: FontWeight.bold),
          ),
          Text("Changing Philosphy"),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: 3,
          ),
          Text("Loading")
        ],
      ),
    );
  }
}
