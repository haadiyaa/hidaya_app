class PrayerTimeModel {
  PrayerTimeModel({
    required this.code,
    required this.status,
    required this.data,
  });
  late final int code;
  late final String status;
  late final List<Data> data;
  
  PrayerTimeModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.timings,
    required this.date,
  });
  late final Timings timings;
  late final Date date;
  
  Data.fromJson(Map<String, dynamic> json){
    timings = Timings.fromJson(json['timings']);
    date = Date.fromJson(json['date']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['timings'] = timings.toJson();
    _data['date'] = date.toJson();
    return _data;
  }
}

class Timings {
  Timings({
    required this.Fajr,
    required this.Sunrise,
    required this.Dhuhr,
    required this.Asr,
    required this.Sunset,
    required this.Maghrib,
    required this.Isha,
    required this.Imsak,
    required this.Midnight,
    required this.Firstthird,
    required this.Lastthird,
  });
  late final String Fajr;
  late final String Sunrise;
  late final String Dhuhr;
  late final String Asr;
  late final String Sunset;
  late final String Maghrib;
  late final String Isha;
  late final String Imsak;
  late final String Midnight;
  late final String Firstthird;
  late final String Lastthird;
  
  Timings.fromJson(Map<String, dynamic> json){
    Fajr = json['Fajr'];
    Sunrise = json['Sunrise'];
    Dhuhr = json['Dhuhr'];
    Asr = json['Asr'];
    Sunset = json['Sunset'];
    Maghrib = json['Maghrib'];
    Isha = json['Isha'];
    Imsak = json['Imsak'];
    Midnight = json['Midnight'];
    Firstthird = json['Firstthird'];
    Lastthird = json['Lastthird'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Fajr'] = Fajr;
    _data['Sunrise'] = Sunrise;
    _data['Dhuhr'] = Dhuhr;
    _data['Asr'] = Asr;
    _data['Sunset'] = Sunset;
    _data['Maghrib'] = Maghrib;
    _data['Isha'] = Isha;
    _data['Imsak'] = Imsak;
    _data['Midnight'] = Midnight;
    _data['Firstthird'] = Firstthird;
    _data['Lastthird'] = Lastthird;
    return _data;
  }
}

class Date {
  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
  });
  late final String readable;
  late final String timestamp;
  late final Hijri hijri;
  
  Date.fromJson(Map<String, dynamic> json){
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = Hijri.fromJson(json['hijri']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['readable'] = readable;
    _data['timestamp'] = timestamp;
    _data['hijri'] = hijri.toJson();
    return _data;
  }
}

class Hijri {
  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.year,
  });
  late final String date;
  late final String format;
  late final String day;
  late final String year;
  
  Hijri.fromJson(Map<String, dynamic> json){
    date = json['date'];
    format = json['format'];
    day = json['day'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['format'] = format;
    _data['day'] = day;
    _data['year'] = year;
    return _data;
  }
}
