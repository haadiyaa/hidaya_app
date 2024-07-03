class NearbyPlace {
  NearbyPlace({
    required this.places,
  });
  late final List<Places> places;
  
  NearbyPlace.fromJson(Map<String, dynamic> json){
    places = List.from(json['places']).map((e)=>Places.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['places'] = places.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Places {
  Places({
    required this.name,
    required this.id,
    required this.types,
    required this.formattedAddress,
    required this.addressComponents,
    required this.location,
    // required this.viewport,
    required this.googleMapsUri,
    required this.utcOffsetMinutes,
    required this.adrFormatAddress,
    required this.businessStatus,
    required this.iconMaskBaseUri,
    required this.iconBackgroundColor,
    required this.displayName,
    required this.primaryTypeDisplayName,
    required this.primaryType,
    required this.shortFormattedAddress,
    // required this.photos,
  });
  late final String name;
  late final String id;
  late final List<String> types;
  late final String formattedAddress;
  late final List<AddressComponents> addressComponents;
  late final Location location;
  // late final Viewport viewport;
  late final String googleMapsUri;
  late final int utcOffsetMinutes;
  late final String adrFormatAddress;
  late final String businessStatus;
  late final String iconMaskBaseUri;
  late final String iconBackgroundColor;
  late final DisplayName displayName;
  late final PrimaryTypeDisplayName primaryTypeDisplayName;
  late final String primaryType;
  late final String shortFormattedAddress;
  // late final List<Photos> photos;
  
  Places.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
    types = List.castFrom<dynamic, String>(json['types']);
    formattedAddress = json['formattedAddress'];
    addressComponents = List.from(json['addressComponents']).map((e)=>AddressComponents.fromJson(e)).toList();
    location = Location.fromJson(json['location']);
    // viewport = Viewport.fromJson(json['viewport']);
    googleMapsUri = json['googleMapsUri'];
    utcOffsetMinutes = json['utcOffsetMinutes'];
    adrFormatAddress = json['adrFormatAddress'];
    businessStatus = json['businessStatus'];
    iconMaskBaseUri = json['iconMaskBaseUri'];
    iconBackgroundColor = json['iconBackgroundColor'];
    displayName = DisplayName.fromJson(json['displayName']);
    primaryTypeDisplayName = PrimaryTypeDisplayName.fromJson(json['primaryTypeDisplayName']);
    primaryType = json['primaryType'];
    shortFormattedAddress = json['shortFormattedAddress'];
    // photos = List.from(json['photos']).map((e)=>Photos.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    _data['types'] = types;
    _data['formattedAddress'] = formattedAddress;
    _data['addressComponents'] = addressComponents.map((e)=>e.toJson()).toList();
    _data['location'] = location.toJson();
    // _data['viewport'] = viewport.toJson();
    _data['googleMapsUri'] = googleMapsUri;
    _data['utcOffsetMinutes'] = utcOffsetMinutes;
    _data['adrFormatAddress'] = adrFormatAddress;
    _data['businessStatus'] = businessStatus;
    _data['iconMaskBaseUri'] = iconMaskBaseUri;
    _data['iconBackgroundColor'] = iconBackgroundColor;
    _data['displayName'] = displayName.toJson();
    _data['primaryTypeDisplayName'] = primaryTypeDisplayName.toJson();
    _data['primaryType'] = primaryType;
    _data['shortFormattedAddress'] = shortFormattedAddress;
    // _data['photos'] = photos.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AddressComponents {
  AddressComponents({
    required this.longText,
    required this.shortText,
    required this.types,
    required this.languageCode,
  });
  late final String longText;
  late final String shortText;
  late final List<String> types;
  late final String languageCode;
  
  AddressComponents.fromJson(Map<String, dynamic> json){
    longText = json['longText'];
    shortText = json['shortText'];
    types = List.castFrom<dynamic, String>(json['types']);
    languageCode = json['languageCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['longText'] = longText;
    _data['shortText'] = shortText;
    _data['types'] = types;
    _data['languageCode'] = languageCode;
    return _data;
  }
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });
  late final double latitude;
  late final double longitude;
  
  Location.fromJson(Map<String, dynamic> json){
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}

// class Viewport {
//   Viewport({
//     required this.low,
//     required this.high,
//   });
//   late final Low low;
//   late final High high;
  
//   Viewport.fromJson(Map<String, dynamic> json){
//     low = Low.fromJson(json['low']);
//     high = High.fromJson(json['high']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['low'] = low.toJson();
//     _data['high'] = high.toJson();
//     return _data;
//   }
// }

// class Low {
//   Low({
//     required this.latitude,
//     required this.longitude,
//   });
//   late final double latitude;
//   late final double longitude;
  
//   Low.fromJson(Map<String, dynamic> json){
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['latitude'] = latitude;
//     _data['longitude'] = longitude;
//     return _data;
//   }
// }

// class High {
//   High({
//     required this.latitude,
//     required this.longitude,
//   });
//   late final double latitude;
//   late final double longitude;
  
//   High.fromJson(Map<String, dynamic> json){
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['latitude'] = latitude;
//     _data['longitude'] = longitude;
//     return _data;
//   }
// }

class DisplayName {
  DisplayName({
    required this.text,
    required this.languageCode,
  });
  late final String text;
  late final String languageCode;
  
  DisplayName.fromJson(Map<String, dynamic> json){
    text = json['text'];
    languageCode = json['languageCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['languageCode'] = languageCode;
    return _data;
  }
}

class PrimaryTypeDisplayName {
  PrimaryTypeDisplayName({
    required this.text,
    required this.languageCode,
  });
  late final String text;
  late final String languageCode;
  
  PrimaryTypeDisplayName.fromJson(Map<String, dynamic> json){
    text = json['text'];
    languageCode = json['languageCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['languageCode'] = languageCode;
    return _data;
  }
}

// class AuthorAttributions {
//   AuthorAttributions({
//     required this.displayName,
//     required this.uri,
//     required this.photoUri,
//   });
//   late final String displayName;
//   late final String uri;
//   late final String photoUri;
  
//   AuthorAttributions.fromJson(Map<String, dynamic> json){
//     displayName = json['displayName'];
//     uri = json['uri'];
//     photoUri = json['photoUri'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['displayName'] = displayName;
//     _data['uri'] = uri;
//     _data['photoUri'] = photoUri;
//     return _data;
//   }
// }