import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rushd/app/common/const.dart';

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

  runApp(
    GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Const.mainWhite,
          primaryColor: Const.primaryColor),
      title: "Application",
      initialRoute: AppPages.intial,
      onInit: () {
        Get.put(
          AudiobookController(),
        );
      },
      getPages: AppPages.routes,
    ),
  );
}
