import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class Functions {
  static String convertTime(String time) {
    if (time.length != 8 || !time.contains(':')) {
      throw const FormatException('Invalid time format. Expected HH:MM:SS');
    }

    int hour = int.parse(time.substring(0, 2));
    int minute = int.parse(time.substring(3, 5));
    int second = int.parse(time.substring(6, 8));

    String meridian = hour < 12 ? 'AM' : 'PM';
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;

    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $meridian';
  }

  static Future<Placemark?> getLocationName(Position? position) async {
    if (position != null) {
      try {
        final placemark = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemark.isNotEmpty) {
          print(placemark[0]);
          return placemark[0];
        }
      } catch (e) {
        print('Error fetching loc name : $e');
      }
    }
    return null;
  }

  static bool isCurrentTimeGreaterThanPrayerTime(String currentTime, String prayerTime) {
  final allowedFormats = [DateFormat("HH:mm"),DateFormat("HH:mm a")];
  final now = DateTime.now();

  for (final format in allowedFormats) {
    try {
      final currentDateTime = format.parse(currentTime);
      final prayerDateTime = format.parse(prayerTime);

      // Create DateTime objects for the current time and prayer time on today's date
      final todayCurrentDateTime = DateTime(
        now.year, now.month, now.day,
        currentDateTime.hour, currentDateTime.minute
      );
      final todayPrayerDateTime = DateTime(
        now.year, now.month, now.day,
        prayerDateTime.hour, prayerDateTime.minute
      );

      return todayCurrentDateTime.isAfter(todayPrayerDateTime);
    } on FormatException catch (e) {
      // Handle parsing exceptions
      print("Invalid time format. Please use HH:mm format.");
      return false;
    }
  }

  // If parsing fails with all formats, consider it an error (optional)
  print("Error parsing time formats.");
  return false;
}
}
