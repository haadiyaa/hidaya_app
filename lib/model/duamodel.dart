class DuaModel {
  
    List<English>? english;

    DuaModel({this.english});

    DuaModel.fromJson(Map<String, dynamic> json) {
        if(json["English"] is List) {
            english = json["English"] == null ? null : (json["English"] as List).map((e) => English.fromJson(e)).toList();
        }
    }

    static List<DuaModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => DuaModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(english != null) {
            _data["English"] = english?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class English {
    int? id;
    String? title;
    String? audioUrl;
    String? text;

    English({this.id, this.title, this.audioUrl, this.text});

    English.fromJson(Map<String, dynamic> json) {
        if(json["ID"] is int) {
            id = json["ID"];
        }
        if(json["TITLE"] is String) {
            title = json["TITLE"];
        }
        if(json["AUDIO_URL"] is String) {
            audioUrl = json["AUDIO_URL"];
        }
        if(json["TEXT"] is String) {
            text = json["TEXT"];
        }
    }

    static List<English> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => English.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["ID"] = id;
        _data["TITLE"] = title;
        _data["AUDIO_URL"] = audioUrl;
        _data["TEXT"] = text;
        return _data;
    }
}