class SurahListModel {
  SurahListModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  
  late final int code;
  late final String status;
  late final String message;
  late final List<Data> data;
  
  SurahListModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.number,
    // required this.sequence,
    required this.numberOfVerses,
    required this.name,
    // required this.revelation,
    // required this.tafsir,
  });
  late final int number;
  // late final int sequence;
  late final int numberOfVerses;
  late final Name name;
  // // late final Revelation revelation;
  // // late final Tafsir tafsir;
  
  Data.fromJson(Map<String, dynamic> json){
    number = json['number'];
    // // sequence = json['sequence'];
    numberOfVerses = json['numberOfVerses'];
    name = Name.fromJson(json['name']);
    // // // revelation = Revelation.fromJson(json['revelation']);
    // // // tafsir = Tafsir.fromJson(json['tafsir']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['number'] = number;
    // // _data['sequence'] = sequence;
    _data['numberOfVerses'] = numberOfVerses;
    _data['name'] = name.toJson();
    // // _data['revelation'] = revelation.toJson();
    // // _data['tafsir'] = tafsir.toJson();
    return _data;
  }
}

class Name {
  Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });
  late final String short;
  late final String long;
  late final Transliteration transliteration;
  late final Translation translation;
  
  Name.fromJson(Map<String, dynamic> json){
    short = json['short'];
    long = json['long'];
    transliteration = Transliteration.fromJson(json['transliteration']);
    translation = Translation.fromJson(json['translation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['short'] = short;
    _data['long'] = long;
    _data['transliteration'] = transliteration.toJson();
    _data['translation'] = translation.toJson();
    return _data;
  }
}

class Transliteration {
  Transliteration({
    required this.en,
    required this.id,
  });
  late final String en;
  late final String id;
  
  Transliteration.fromJson(Map<String, dynamic> json){
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['en'] = en;
    _data['id'] = id;
    return _data;
  }
}

class Translation {
  Translation({
    required this.en,
    required this.id,
  });
  late final String en;
  late final String id;
  
  Translation.fromJson(Map<String, dynamic> json){
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['en'] = en;
    _data['id'] = id;
    return _data;
  }
}

// class Revelation {
  // Revelation({
  //   required this.arab,
  //   required this.en,
  //   required this.id,
  // });
  // late final String arab;
  // late final String en;
  // late final String id;
  
  // Revelation.fromJson(Map<String, dynamic> json){
  //   arab = json['arab'];
  //   en = json['en'];
  //   id = json['id'];
  // }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['arab'] = arab;
//     _data['en'] = en;
//     _data['id'] = id;
//     return _data;
//   }
// }

// class Tafsir {
  // Tafsir({
  //   required this.id,
  // });
  // late final String id;
  
  // Tafsir.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     return _data;
//   }
// }