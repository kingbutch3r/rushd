import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rushd/app/data/models/audiobook_model.dart';

class AudiobookController extends GetxController {
  final player = AudioPlayer();
  final playerStorage = GetStorage("player");
  var playerAudioBook = Rxn<Audiobook>();

  var totalDuration = Rx<Duration>(const Duration());
  var position = Rx<Duration>(const Duration());
  var bufferedPosition = Rx<Duration>(const Duration());
  var isPlaying = RxBool(false);

  startAudioBook(Audiobook book) async {
    await player.setAudioSource(
        AudioSource.uri(Uri.parse(book.chapters![0].audio!),
            tag: MediaItem(
                id: "1",
                title: book.title!,
                artUri: Uri.parse(book.coverThumb!))),
        preload: true);
    // player.setUrl(audioBook!.chapters![0].audio!);
    playerAudioBook.value = book;
    player.load();

    player.durationStream.listen((event) {
      if (event != null) {
        totalDuration.value = event;
      }
    });
    player.positionStream.listen((event) {
      position.value = event;
      // playerStorage.write("position", event);
    });
    player.bufferedPositionStream.listen((event) {
      bufferedPosition.value = event;
    });
    player.playingStream.listen((event) {
      isPlaying.value = event;
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    super.onClose();
  }
}
