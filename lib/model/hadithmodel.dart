class HadithModel {
  HadithModel({
    required this.data,
  });
  late final Data data;
  
  HadithModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.book,
    required this.bookName,
    required this.chapterName,
    required this.hadithEnglish,
    required this.header,
    required this.id,
    required this.refno,
  });
  late final String book;
  late final String bookName;
  late final String chapterName;
  late final String hadithEnglish;
  late final String header;
  late final int id;
  late final String refno;
  
  Data.fromJson(Map<String, dynamic> json){
    book = json['book'];
    bookName = json['bookName'];
    chapterName = json['chapterName'];
    hadithEnglish = json['hadith_english'];
    header = json['header'];
    id = json['id'];
    refno = json['refno'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['book'] = book;
    _data['bookName'] = bookName;
    _data['chapterName'] = chapterName;
    _data['hadith_english'] = hadithEnglish;
    _data['header'] = header;
    _data['id'] = id;
    _data['refno'] = refno;
    return _data;
  }
}