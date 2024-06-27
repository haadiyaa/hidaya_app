class Functions {
  static String convertTime(String time) {
  if (time.length != 5 || !time.contains(':')) {
    throw const FormatException('Invalid time format. Expected HH:MM:SS');
  }

  int hour = int.parse(time.substring(0, 2));
  int minute = int.parse(time.substring(3, 5));
  int second = int.parse(time.substring(6, 8));

  String meridian = hour < 12 ? 'AM' : 'PM';
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour; 

  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2,'0')} $meridian';
}
}
