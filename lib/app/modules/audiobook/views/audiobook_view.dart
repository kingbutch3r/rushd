import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rushd/app/common/const.dart';
import 'package:rushd/app/data/models/audiobook_model.dart';
import 'package:rushd/app/routes/app_pages.dart';

import '../controllers/audiobook_controller.dart';

class AudiobookView extends StatelessWidget {
  AudiobookView({Key? key}) : super(key: key);
  AudiobookController controller = Get.find<AudiobookController>();
  final Audiobook _audiobook = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_audiobook.title}',
          style: TextStyle(color: Const.mainBlack),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Const.mainBlack),
        centerTitle: true,
      ),
      bottomNavigationBar: Material(
        elevation: 35,
        child: Container(
          color: Const.mainWhite,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.currentAudioBook,
                        arguments: controller.audioBook);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.audioBook!.title!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Obx(
                  () => ProgressBar(
                    progressBarColor: Const.primaryColor,
                    baseBarColor: Const.primaryColor.withOpacity(0.30),
                    bufferedBarColor: Const.primaryColor.withOpacity(0.40),
                    thumbColor: Const.secondaryColor,
                    progress: controller.position.value,
                    buffered: controller.bufferedPosition.value,
                    total: controller.totalDuration.value,
                    onSeek: (duration) {
                      controller.player.seek(duration);
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.player
                              .setSpeed(controller.player.speed - 0.25);
                        },
                        icon: Icon(
                          Icons.fast_rewind_rounded,
                          size: 35,
                          color: Const.mainBlack,
                        )),
                    IconButton(
                        onPressed: () {
                          controller.player.seek(Duration(
                              seconds:
                                  controller.player.position.inSeconds - 10));
                        },
                        icon: Icon(
                          Icons.replay_10_rounded,
                          size: 35,
                          color: Const.mainBlack,
                        )),
                    Obx(
                      () => IconButton(
                          onPressed: () {
                            controller.player.playing
                                ? controller.player.pause()
                                : controller.player.play();
                          },
                          icon: Icon(
                            controller.isPlaying.value
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 35,
                            color: Const.mainBlack,
                          )),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.player.seek(Duration(
                              seconds:
                                  controller.player.position.inSeconds + 10));
                        },
                        icon: Icon(
                          Icons.forward_10_rounded,
                          size: 35,
                          color: Const.mainBlack,
                        )),
                    IconButton(
                        onPressed: () {
                          controller.player
                              .setSpeed(controller.player.speed + 0.25);
                        },
                        icon: Icon(
                          Icons.fast_forward_rounded,
                          size: 35,
                          color: Const.mainBlack,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Container(
                height: 200,
                width: Get.width,
                child: Row(
                  children: [Image.network(_audiobook.bookCover!)],
                ),
              ),
              color: Const.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
