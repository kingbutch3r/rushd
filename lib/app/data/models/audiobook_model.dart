import 'package:cloud_firestore/cloud_firestore.dart';

class Audiobook {
  List<Chapters>? chapters;
  String? author;

  String? langauge;
  String? bookCover;
  String? title;
  List<String>? tags;
  String? coverThumb;
  String? recordedBy;
  String? publication;
  List<String>? genre;
  String? id;
  int? authorId;
  String? narratedBy;
  String? uploadedBy;
  String? chaptersType;

  Audiobook(
      {this.chapters,
      this.author,
      this.langauge,
      this.bookCover,
      this.title,
      this.tags,
      this.coverThumb,
      this.recordedBy,
      this.publication,
      this.genre,
      this.id,
      this.authorId,
      this.narratedBy,
      this.uploadedBy,
      this.chaptersType});

  Audiobook.fromJson(Map<String, dynamic> json, {String? id}) {
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters?.add(Chapters.fromJson(v));
      });
    }

    author = json['author'];
    langauge = json['langauge'];
    bookCover = json['book_cover'];
    title = json['title'];
    id = id;
    tags = json['tags'].cast<String>();
    coverThumb = json['cover_thumb'];
    recordedBy = json['recordedBy'];
    publication = json['publication'];
    genre = json['genre'].cast<String>();
    id = json['id'];
    authorId = json['author_id'];
    narratedBy = json['narratedBy'];
    uploadedBy = json['uploadedBy'];
    chaptersType = json['chapters_type'];
  }

  Audiobook.fromFirebaseJson(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    Map json = doc.data();

    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters?.add(Chapters.fromJson(v));
      });
    }

    author = json['author'];
    langauge = json['langauge'];
    bookCover = json['book_cover'];
    title = json['title'];
    tags = json['tags'].cast<String>();
    coverThumb = json['cover_thumb'];
    recordedBy = json['recordedBy'];
    publication = json['publication'];
    genre = json['genre'].cast<String>();
    id = doc.id;
    authorId = json['author_id'];
    narratedBy = json['narratedBy'];
    uploadedBy = json['uploadedBy'];
    chaptersType = json['chapters_type'];
  }
  Map<String, dynamic> toFirebaseJson() {
    final data = <String, dynamic>{};
    if (chapters != null) {
      data['chapters'] = chapters?.map((v) => v.toJson()).toList();
    }
    data['author'] = author;
    data['langauge'] = langauge;
    data['book_cover'] = bookCover;
    data['title'] = title;
    data['tags'] = tags;
    data['cover_thumb'] = coverThumb;
    data['recordedBy'] = recordedBy;
    data['publication'] = publication;
    data['genre'] = genre;

    data['author_id'] = authorId;
    data['narratedBy'] = narratedBy;
    data['uploadedBy'] = uploadedBy;
    data['chapters_type'] = chaptersType;
    return data;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (chapters != null) {
      data['chapters'] = chapters?.map((v) => v.toJson()).toList();
    }
    data['author'] = author;
    data['langauge'] = langauge;
    data['book_cover'] = bookCover;
    data['title'] = title;
    data['tags'] = tags;
    data['cover_thumb'] = coverThumb;
    data['recordedBy'] = recordedBy;
    data['publication'] = publication;
    data['genre'] = genre;
    data['id'] = id;
    data['author_id'] = authorId;
    data['narratedBy'] = narratedBy;
    data['uploadedBy'] = uploadedBy;
    data['chapters_type'] = chaptersType;
    return data;
  }
}

class Chapters {
  Subtitles? subtitles;
  int? no;
  String? audio;
  String? title;

  Chapters({this.subtitles, this.no, this.audio, this.title});

  Chapters.fromJson(Map<String, dynamic> json) {
    subtitles = json['subtitles'] != null
        ? Subtitles?.fromJson(json['subtitles'])
        : null;
    no = json['no'];
    audio = json['audio'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (subtitles != null) {
      data['subtitles'] = subtitles?.toJson();
    }
    data['no'] = no;
    data['audio'] = audio;
    data['title'] = title;
    return data;
  }
}

class Subtitles {
  String? file;
  String? language;

  Subtitles({this.file, this.language});

  Subtitles.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['file'] = file;
    data['language'] = language;
    return data;
  }
}
