
class SurahModel {
    int? code;
    String? status;
    String? message;
    Data? data;

    SurahModel({this.code, this.status, this.message, this.data});

    SurahModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        status = json["status"];
        message = json["message"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
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
    int? sequence;
    int? numberOfVerses;
    Name? name;
    Revelation? revelation;
    Tafsir? tafsir;
    PreBismillah? preBismillah;
    List<Verses>? verses;

    Data({this.number, this.sequence, this.numberOfVerses, this.name, this.revelation, this.tafsir, this.preBismillah, this.verses});

    Data.fromJson(Map<String, dynamic> json) {
        number = json["number"];
        sequence = json["sequence"];
        numberOfVerses = json["numberOfVerses"];
        name = json["name"] == null ? null : Name.fromJson(json["name"]);
        revelation = json["revelation"] == null ? null : Revelation.fromJson(json["revelation"]);
        tafsir = json["tafsir"] == null ? null : Tafsir.fromJson(json["tafsir"]);
        preBismillah = json["preBismillah"] == null ? null : PreBismillah.fromJson(json["preBismillah"]);
        verses = json["verses"] == null ? null : (json["verses"] as List).map((e) => Verses.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["number"] = number;
        _data["sequence"] = sequence;
        _data["numberOfVerses"] = numberOfVerses;
        if(name != null) {
            _data["name"] = name?.toJson();
        }
        if(revelation != null) {
            _data["revelation"] = revelation?.toJson();
        }
        if(tafsir != null) {
            _data["tafsir"] = tafsir?.toJson();
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
    Tafsir1? tafsir;

    Verses({this.number, this.meta, this.text, this.translation, this.audio, this.tafsir});

    Verses.fromJson(Map<String, dynamic> json) {
        number = json["number"] == null ? null : Number.fromJson(json["number"]);
        meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
        text = json["text"] == null ? null : Text1.fromJson(json["text"]);
        translation = json["translation"] == null ? null : Translation2.fromJson(json["translation"]);
        audio = json["audio"] == null ? null : Audio1.fromJson(json["audio"]);
        tafsir = json["tafsir"] == null ? null : Tafsir1.fromJson(json["tafsir"]);
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
        if(tafsir != null) {
            _data["tafsir"] = tafsir?.toJson();
        }
        return _data;
    }
}

class Tafsir1 {
    Id? id;

    Tafsir1({this.id});

    Tafsir1.fromJson(Map<String, dynamic> json) {
        id = json["id"] == null ? null : Id.fromJson(json["id"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(id != null) {
            _data["id"] = id?.toJson();
        }
        return _data;
    }
}

class Id {
    String? short;
    String? long;

    Id({this.short, this.long});

    Id.fromJson(Map<String, dynamic> json) {
        short = json["short"];
        long = json["long"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["short"] = short;
        _data["long"] = long;
        return _data;
    }
}

class Audio1 {
    String? primary;
    List<String>? secondary;

    Audio1({this.primary, this.secondary});

    Audio1.fromJson(Map<String, dynamic> json) {
        primary = json["primary"];
        secondary = json["secondary"] == null ? null : List<String>.from(json["secondary"]);
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
    String? id;

    Translation2({this.en, this.id});

    Translation2.fromJson(Map<String, dynamic> json) {
        en = json["en"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        _data["id"] = id;
        return _data;
    }
}

class Text1 {
    String? arab;
    Transliteration2? transliteration;

    Text1({this.arab, this.transliteration});

    Text1.fromJson(Map<String, dynamic> json) {
        arab = json["arab"];
        transliteration = json["transliteration"] == null ? null : Transliteration2.fromJson(json["transliteration"]);
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
        en = json["en"];
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
    int? manzil;
    int? ruku;
    int? hizbQuarter;
    Sajda? sajda;

    Meta({this.juz, this.page, this.manzil, this.ruku, this.hizbQuarter, this.sajda});

    Meta.fromJson(Map<String, dynamic> json) {
        juz = json["juz"];
        page = json["page"];
        manzil = json["manzil"];
        ruku = json["ruku"];
        hizbQuarter = json["hizbQuarter"];
        sajda = json["sajda"] == null ? null : Sajda.fromJson(json["sajda"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["juz"] = juz;
        _data["page"] = page;
        _data["manzil"] = manzil;
        _data["ruku"] = ruku;
        _data["hizbQuarter"] = hizbQuarter;
        if(sajda != null) {
            _data["sajda"] = sajda?.toJson();
        }
        return _data;
    }
}

class Sajda {
    bool? recommended;
    bool? obligatory;

    Sajda({this.recommended, this.obligatory});

    Sajda.fromJson(Map<String, dynamic> json) {
        recommended = json["recommended"];
        obligatory = json["obligatory"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["recommended"] = recommended;
        _data["obligatory"] = obligatory;
        return _data;
    }
}

class Number {
    int? inQuran;
    int? inSurah;

    Number({this.inQuran, this.inSurah});

    Number.fromJson(Map<String, dynamic> json) {
        inQuran = json["inQuran"];
        inSurah = json["inSurah"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["inQuran"] = inQuran;
        _data["inSurah"] = inSurah;
        return _data;
    }
}

class PreBismillah {
    Text? text;
    Translation1? translation;
    Audio? audio;

    PreBismillah({this.text, this.translation, this.audio});

    PreBismillah.fromJson(Map<String, dynamic> json) {
        text = json["text"] == null ? null : Text.fromJson(json["text"]);
        translation = json["translation"] == null ? null : Translation1.fromJson(json["translation"]);
        audio = json["audio"] == null ? null : Audio.fromJson(json["audio"]);
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
        primary = json["primary"];
        secondary = json["secondary"] == null ? null : List<String>.from(json["secondary"]);
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
    String? id;

    Translation1({this.en, this.id});

    Translation1.fromJson(Map<String, dynamic> json) {
        en = json["en"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        _data["id"] = id;
        return _data;
    }
}

class Text {
    String? arab;
    Transliteration1? transliteration;

    Text({this.arab, this.transliteration});

    Text.fromJson(Map<String, dynamic> json) {
        arab = json["arab"];
        transliteration = json["transliteration"] == null ? null : Transliteration1.fromJson(json["transliteration"]);
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
        en = json["en"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        return _data;
    }
}

class Tafsir {
    String? id;

    Tafsir({this.id});

    Tafsir.fromJson(Map<String, dynamic> json) {
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        return _data;
    }
}

class Revelation {
    String? arab;
    String? en;
    String? id;

    Revelation({this.arab, this.en, this.id});

    Revelation.fromJson(Map<String, dynamic> json) {
        arab = json["arab"];
        en = json["en"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["arab"] = arab;
        _data["en"] = en;
        _data["id"] = id;
        return _data;
    }
}

class Name {
    String? short;
    String? long;
    Transliteration? transliteration;
    Translation? translation;

    Name({this.short, this.long, this.transliteration, this.translation});

    Name.fromJson(Map<String, dynamic> json) {
        short = json["short"];
        long = json["long"];
        transliteration = json["transliteration"] == null ? null : Transliteration.fromJson(json["transliteration"]);
        translation = json["translation"] == null ? null : Translation.fromJson(json["translation"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["short"] = short;
        _data["long"] = long;
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
    String? id;

    Translation({this.en, this.id});

    Translation.fromJson(Map<String, dynamic> json) {
        en = json["en"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        _data["id"] = id;
        return _data;
    }
}

class Transliteration {
    String? en;
    String? id;

    Transliteration({this.en, this.id});

    Transliteration.fromJson(Map<String, dynamic> json) {
        en = json["en"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["en"] = en;
        _data["id"] = id;
        return _data;
    }
}