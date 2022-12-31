import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rushd/app/data/models/audiobook_model.dart';

class AudiobookController extends GetxController {
  Audiobook? audioBook = Get.arguments;
  final player = AudioPlayer();
  var totalDuration = Rx<Duration>(const Duration());
  var position = Rx<Duration>(const Duration());
  var bufferedPosition = Rx<Duration>(const Duration());
  var isPlaying = RxBool(false);

  loadAudioBook({bool? override = false}) {
    audioBook = Get.arguments;
    if (override!) {
      player.dispose();
    }
    player.setAudioSource(AudioSource.uri(
        Uri.parse(audioBook!.chapters![0].audio!),
        tag: MediaItem(
            id: "1",
            title: audioBook!.title!,
            artUri: Uri.parse(audioBook!.coverThumb!))));
    // player.setUrl(audioBook!.chapters![0].audio!);
    player.load();
    player.durationStream.listen((event) {
      if (event != null) {
        totalDuration.value = event;
      }
    });
    player.positionStream.listen((event) {
      position.value = event;
    });
    player.bufferedPositionStream.listen((event) {
      bufferedPosition.value = event;
    });
    player.playingStream.listen((event) {
      isPlaying.value = event;
    });
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
