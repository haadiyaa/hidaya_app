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

  static bool checkTime(String prayerTime) {
    print(prayerTime);
    final DateTime currentTime = DateTime.now();
    final date = DateFormat('yyyy-MM-dd');
    final String formattedDateTime = '${date.format(currentTime)} $prayerTime';
    final DateTime prayerTimeObject = DateTime.parse(formattedDateTime);

    if (prayerTimeObject.compareTo(currentTime) < 0) {
      return true;
    } else
      return false;
  }
}
