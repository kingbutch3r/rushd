import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rushd/app/common/const.dart';
import 'package:rushd/app/data/models/audiobook_model.dart';
import 'package:rushd/app/routes/app_pages.dart';

import '../controllers/audiobook_controller.dart';

class AudiobookView extends GetView<AudiobookController> {
  AudiobookView({Key? key}) : super(key: key);

  final Audiobook _audiobook = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_audiobook.title}',
          style: const TextStyle(color: Const.mainBlack),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        leadingWidth: 30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Const.mainBlack),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        () => controller.playerAudioBook.value == null
            ? SizedBox()
            : Card(
                color: Const.mainBlack,
                elevation: 35,
                child: Container(
                  // color: Const.mainWhite,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.currentAudioBook,
                            //     arguments: controller.audioBook);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.playerAudioBook.value!.title!,
                              style: const TextStyle(
                                  color: Const.mainWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Obx(
                          () => ProgressBar(
                            progressBarColor: Const.primaryColor,
                            baseBarColor: Const.primaryColor.withOpacity(0.30),
                            bufferedBarColor:
                                Const.primaryColor.withOpacity(0.50),
                            thumbColor: Const.mainWhite,
                            timeLabelTextStyle: TextStyle(
                              color: Const.mainWhite,
                            ),
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
                                icon: const Icon(
                                  Icons.fast_rewind_rounded,
                                  size: 35,
                                  color: Const.mainBlack,
                                )),
                            IconButton(
                                onPressed: () {
                                  controller.player.seek(Duration(
                                      seconds:
                                          controller.player.position.inSeconds -
                                              10));
                                },
                                icon: const Icon(
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
                                          controller.player.position.inSeconds +
                                              10));
                                },
                                icon: const Icon(
                                  Icons.forward_10_rounded,
                                  size: 35,
                                  color: Const.mainBlack,
                                )),
                            IconButton(
                                onPressed: () {
                                  controller.player
                                      .setSpeed(controller.player.speed + 0.25);
                                },
                                icon: const Icon(
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
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              clipBehavior: Clip.hardEdge,
              color: Const.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: SizedBox(
                height: 200,
                width: Get.width,
                child: Row(
                  children: [
                    Image.network(_audiobook.bookCover!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width / 2,
                            child: Text(
                              _audiobook.title!,
                              style: TextStyle(
                                  color: Const.mainWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            _audiobook.author!,
                            style: TextStyle(
                                color: Const.halfWhite,
                                fontSize: 14,
                                overflow: TextOverflow.visible),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => controller.playerAudioBook.value != _audiobook
                                ? InkWell(
                                    onTap: () {
                                      controller.startAudioBook(_audiobook);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: Const.secondaryBlack,
                                        child: Icon(
                                          Icons.play_arrow_outlined,
                                          color: Const.mainWhite,
                                        )))
                                : SizedBox(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
