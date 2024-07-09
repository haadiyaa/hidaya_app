
class SurahModel {
    int? code;
    String? status;
    String? message;
    Data? data;

    SurahModel({this.code, this.status, this.message, this.data});

    SurahModel.fromJson(Map<String, dynamic> json) {
        if(json["code"] is int) {
            code = json["code"];
        }
        if(json["status"] is String) {
            status = json["status"];
        }
        if(json["message"] is String) {
            message = json["message"];
        }
        if(json["data"] is Map) {
            data = json["data"] == null ? null : Data.fromJson(json["data"]);
        }
    }

    static List<SurahModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => SurahModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["status"] = status;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    int? number;
    int? numberOfVerses;
    Name? name;
    Revelation? revelation;
    PreBismillah? preBismillah;
    List<Verses>? verses;

    Data({this.number, this.numberOfVerses, this.name, this.revelation, this.preBismillah, this.verses});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["number"] is int) {
            number = json["number"];
        }
        if(json["numberOfVerses"] is int) {
            numberOfVerses = json["numberOfVerses"];
        }
        if(json["name"] is Map) {
            name = json["name"] == null ? null : Name.fromJson(json["name"]);
        }
        if(json["revelation"] is Map) {
            revelation = json["revelation"] == null ? null : Revelation.fromJson(json["revelation"]);
        }
        if(json["preBismillah"] is Map) {
            preBismillah = json["preBismillah"] == null ? null : PreBismillah.fromJson(json["preBismillah"]);
        }
        if(json["verses"] is List) {
            verses = json["verses"] == null ? null : (json["verses"] as List).map((e) => Verses.fromJson(e)).toList();
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["number"] = number;
        _data["numberOfVerses"] = numberOfVerses;
        if(name != null) {
            _data["name"] = name?.toJson();
        }
        if(revelation != null) {
            _data["revelation"] = revelation?.toJson();
        }
        if(preBismillah != null) {
            _data["preBismillah"] = preBismillah?.toJson();
        }
        if(verses != null) {
            _data["verses"] = verses?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Verses {
    Number? number;
    Meta? meta;
    Text1? text;
    Translation2? translation;
    Audio1? audio;

    Verses({this.number, this.meta, this.text, this.translation, this.audio});

    Verses.fromJson(Map<String, dynamic> json) {
        if(json["number"] is Map) {
            number = json["number"] == null ? null : Number.fromJson(json["number"]);
        }
        if(json["meta"] is Map) {
            meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
        }
        if(json["text"] is Map) {
            text = json["text"] == null ? null : Text1.fromJson(json["text"]);
        }
        if(json["translation"] is Map) {
            translation = json["translation"] == null ? null : Translation2.fromJson(json["translation"]);
        }
        if(json["audio"] is Map) {
            audio = json["audio"] == null ? null : Audio1.fromJson(json["audio"]);
        }
    }

    static List<Verses> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Verses.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(number != null) {
            _data["number"] = number?.toJson();
        }
        if(meta != null) {
            _data["meta"] = meta?.toJson();
        }
        if(text != null) {
            _data["text"] = text?.toJson();
        }
        if(translation != null) {
            _data["translation"] = translation?.toJson();
        }
        if(audio != null) {
            _data["audio"] = audio?.toJson();
        }
        return _data;
    }
}

class Audio1 {
    String? primary;
    List<String>? secondary;

    Audio1({this.primary, this.secondary});

    Audio1.fromJson(Map<String, dynamic> json) {
        if(json["primary"] is String) {
            primary = json["primary"];
        }
        if(json["secondary"] is List) {
            secondary = json["secondary"] == null ? null : List<String>.from(json["secondary"]);
        }
    }

    static List<Audio1> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Audio1.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["primary"] = primary;
        if(secondary != null) {
            _data["secondary"] = secondary;
        }
        return _data;
    }
}

class Translation2 {
    String? en;

    Translation2({this.en});

    Translation2.fromJson(Map<String, dynamic> json) {
        if(json["en"] is String) {
            en = json["en"];
        }
    }

    static List<Translation2> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Translation2.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}

class Text1 {
    String? arab;
    Transliteration2? transliteration;

    Text1({this.arab, this.transliteration});

    Text1.fromJson(Map<String, dynamic> json) {
        if(json["arab"] is String) {
            arab = json["arab"];
        }
        if(json["transliteration"] is Map) {
            transliteration = json["transliteration"] == null ? null : Transliteration2.fromJson(json["transliteration"]);
        }
    }

    static List<Text1> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Text1.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["arab"] = arab;
        if(transliteration != null) {
            _data["transliteration"] = transliteration?.toJson();
        }
        return _data;
    }
}

class Transliteration2 {
    String? en;

    Transliteration2({this.en});

    Transliteration2.fromJson(Map<String, dynamic> json) {
        if(json["en"] is String) {
            en = json["en"];
        }
    }

    static List<Transliteration2> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Transliteration2.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}

class Meta {
    int? juz;
    int? page;

    Meta({this.juz, this.page});

    Meta.fromJson(Map<String, dynamic> json) {
        if(json["juz"] is int) {
            juz = json["juz"];
        }
        if(json["page"] is int) {
            page = json["page"];
        }
    }

    static List<Meta> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Meta.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["juz"] = juz;
        _data["page"] = page;
        return _data;
    }
}

class Number {
    int? inSurah;

    Number({this.inSurah});

    Number.fromJson(Map<String, dynamic> json) {
        if(json["inSurah"] is int) {
            inSurah = json["inSurah"];
        }
    }

    static List<Number> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Number.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["inSurah"] = inSurah;
        return _data;
    }
}

class PreBismillah {
    TextC? text;
    Translation1? translation;
    Audio? audio;

    PreBismillah({this.text, this.translation, this.audio});

    PreBismillah.fromJson(Map<String, dynamic> json) {
        if(json["text"] is Map) {
            text = json["text"] == null ? null : TextC.fromJson(json["text"]);
        }
        if(json["translation"] is Map) {
            translation = json["translation"] == null ? null : Translation1.fromJson(json["translation"]);
        }
        if(json["audio"] is Map) {
            audio = json["audio"] == null ? null : Audio.fromJson(json["audio"]);
        }
    }

    static List<PreBismillah> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => PreBismillah.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(text != null) {
            _data["text"] = text?.toJson();
        }
        if(translation != null) {
            _data["translation"] = translation?.toJson();
        }
        if(audio != null) {
            _data["audio"] = audio?.toJson();
        }
        return _data;
    }
}

class Audio {
    String? primary;
    List<String>? secondary;

    Audio({this.primary, this.secondary});

    Audio.fromJson(Map<String, dynamic> json) {
        if(json["primary"] is String) {
            primary = json["primary"];
        }
        if(json["secondary"] is List) {
            secondary = json["secondary"] == null ? null : List<String>.from(json["secondary"]);
        }
    }

    static List<Audio> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Audio.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["primary"] = primary;
        if(secondary != null) {
            _data["secondary"] = secondary;
        }
        return _data;
    }
}

class Translation1 {
    String? en;

    Translation1({this.en});

    Translation1.fromJson(Map<String, dynamic> json) {
        if(json["en"] is String) {
            en = json["en"];
        }
    }

    static List<Translation1> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Translation1.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}

class TextC {
    String? arab;
    Transliteration1? transliteration;

    TextC({this.arab, this.transliteration});

    TextC.fromJson(Map<String, dynamic> json) {
        if(json["arab"] is String) {
            arab = json["arab"];
        }
        if(json["transliteration"] is Map) {
            transliteration = json["transliteration"] == null ? null : Transliteration1.fromJson(json["transliteration"]);
        }
    }

    static List<TextC> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => TextC.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["arab"] = arab;
        if(transliteration != null) {
            _data["transliteration"] = transliteration?.toJson();
        }
        return _data;
    }
}

class Transliteration1 {
    String? en;

    Transliteration1({this.en});

    Transliteration1.fromJson(Map<String, dynamic> json) {
        if(json["en"] is String) {
            en = json["en"];
        }
    }

    static List<Transliteration1> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Transliteration1.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}

class Revelation {
    String? en;

    Revelation({this.en});

    Revelation.fromJson(Map<String, dynamic> json) {
        if(json["en"] is String) {
            en = json["en"];
        }
    }

    static List<Revelation> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Revelation.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}

class Name {
    Transliteration? transliteration;
    Translation? translation;

    Name({this.transliteration, this.translation});

    Name.fromJson(Map<String, dynamic> json) {
        if(json["transliteration"] is Map) {
            transliteration = json["transliteration"] == null ? null : Transliteration.fromJson(json["transliteration"]);
        }
        if(json["translation"] is Map) {
            translation = json["translation"] == null ? null : Translation.fromJson(json["translation"]);
        }
    }

    static List<Name> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Name.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(transliteration != null) {
            _data["transliteration"] = transliteration?.toJson();
        }
        if(translation != null) {
            _data["translation"] = translation?.toJson();
        }
        return _data;
    }
}

class Translation {
    String? en;

    Translation({this.en});

    Translation.fromJson(Map<String, dynamic> json) {
        if(json["en"] is String) {
            en = json["en"];
        }
    }

    static List<Translation> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Translation.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}

class Transliteration {
    String? en;

    Transliteration({this.en});

    Transliteration.fromJson(Map<String, dynamic> json) {
        if(json["en"] is String) {
            en = json["en"];
        }
    }

    static List<Transliteration> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Transliteration.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}