import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rushd/app/common/const.dart';
import 'package:rushd/app/modules/login/controllers/login_controller.dart';

import 'app/modules/audiobook/controllers/audiobook_controller.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
          ),
          scaffoldBackgroundColor: Const.mainWhite,
          primaryColor: Const.primaryColor),
      title: "Application",
      initialRoute: AppPages.intial,
      onInit: () {
        Get.put(
          AudiobookController(),
        );
        Get.put(
          LoginController(),
        );
      },
      getPages: AppPages.routes,
    ),
  );
}
