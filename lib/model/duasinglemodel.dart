class Dua {
  final String title; 
  final List<DuaIndividualModel> duaItems; 

  Dua({required this.title, required this.duaItems});

  factory Dua.fromJson(Map<String, dynamic> json) {
    final title = json.keys.first;
    final duaItemsJson = json[title] as List<dynamic>;
    final duaItems = duaItemsJson.map((item) => DuaIndividualModel.fromJson(item)).toList();
    return Dua(title: title, duaItems: duaItems);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data[title] = duaItems.map((item) => item.toJson()).toList();
    return _data;
  }
}

class DuaIndividualModel {
  final int? id;
  final String? arabicText;
  final String? languageArabicTranslatedText;
  final String? translatedText;
  final int? repeat;
  final String? audio;

  DuaIndividualModel({
    this.id,
    this.arabicText,
    this.languageArabicTranslatedText,
    this.translatedText,
    this.repeat,
    this.audio,
  });

  factory DuaIndividualModel.fromJson(Map<String, dynamic> json) {
    return DuaIndividualModel(
      id: json["ID"] as int?,
      arabicText: json["ARABIC_TEXT"] as String?,
      languageArabicTranslatedText: json["LANGUAGE_ARABIC_TRANSLATED_TEXT"] as String?,
      translatedText: json["TRANSLATED_TEXT"] as String?,
      repeat: json["REPEAT"] as int?,
      audio: json["AUDIO"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (id != null) _data["ID"] = id;
    if (arabicText != null) _data["ARABIC_TEXT"] = arabicText;
    if (languageArabicTranslatedText != null)
      _data["LANGUAGE_ARABIC_TRANSLATED_TEXT"] = languageArabicTranslatedText;
    if (translatedText != null) _data["TRANSLATED_TEXT"] = translatedText;
    if (repeat != null) _data["REPEAT"] = repeat;
    if (audio != null) _data["AUDIO"] = audio;
    return _data;
  }
}
