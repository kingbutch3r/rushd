import 'package:get/get.dart';
import 'package:rushd/app/data/models/audiobook_model.dart';
import 'package:rushd/app/data/providers/audiobook_provider.dart';

class HomeController extends GetxController {
  var audiobooks = RxList<Audiobook>();

  @override
  void onInit() async {
    audiobooks.value = await AudiobookProvider().getaudiobooks();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
