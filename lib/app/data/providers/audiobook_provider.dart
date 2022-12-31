import 'package:get/get.dart';

import '../models/audiobook_model.dart';

class AudiobookProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Audiobook.fromJson(map);
      if (map is List) {
        return map.map((item) => Audiobook.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Audiobook?> getAudiobook(int id) async {
    final response = await get('audiobook/$id');
    return response.body;
  }

  Future<Response<Audiobook>> postAudiobook(Audiobook audiobook) async =>
      await post('audiobook', audiobook);
  Future<Response> deleteAudiobook(int id) async =>
      await delete('audiobook/$id');
}
