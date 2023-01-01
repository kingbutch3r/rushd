import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/audiobook_model.dart';

class AudiobookProvider {
  var firestore = FirebaseFirestore.instance;
  Future<List<Audiobook>> getaudiobooks() async {
    List<Audiobook> audiobooks = [];
    var collection = await firestore.collection("audiobooks").get();
    for (var element in collection.docs) {
      audiobooks.add(Audiobook.fromFirebaseJson(element));
    }
    return audiobooks;
  }

  Future<Audiobook> getaudiobookById(id) async {
    var doc = await firestore.collection("audiobooks").doc(id).get();
    if (doc.exists) {
      return Audiobook.fromJson(doc.data()!, id: doc.id);
    } else {
      return Future.error("Can't Find Audiobook");
    }
  }
}
