import 'dart:convert';

import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/model/prayertimemodel.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  Future<String> loginUser(Map data) async {
    UserModel user;
    try {
      final response = await http.post(
        Uri.parse('${Secrets.authUrl}${Secrets.login}'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      // print(response.);
      final data1 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // print(data1['token']);
        var sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString(
            Constants.LOGINTOKEN, data1['token'].toString());

        final Map<String, String>? header = {
          'Content-Type': 'application/json',
          'x-auth-token': data1['token'],
        };
        final response = await http.get(
          Uri.parse('${Secrets.authUrl}${Secrets.getUser}'),
          headers: header,
        );
        print(response.body);
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          user = UserModel.fromMap(data);
          // print('user name: ${user.name}');
          if (user.email != null && user.name != null) {
            await sharedPref.setString(Constants.userName, user.name!);
            await sharedPref.setString(Constants.userEmail, user.email!);
          }
        } else {
          // print('error getting user data');
          // print('not success');
        }
        return '';
      } else {
        return data1['msg'].toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signupUser(Map data) async {
    try {
      final response = await http.post(
        Uri.parse('${Secrets.authUrl}${Secrets.register}'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      // print(response.body);
      final data1 = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return '';
      } else {
        return data1['msg'].toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> forgotPassword(Map data) async {
    try {
      final response = await http.post(
        Uri.parse('${Secrets.authUrl}${Secrets.forgotPassword}'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // print(response.body);
      final data1 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data1['msg'];
      } else {
        return data1['msg'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<http.Response> fetchPrayetrtime(
      String year, String month, String city, String country) async {
    final response = await http.get(Uri.parse(
        '${Secrets.prayerUrl}$year/$month${Secrets.city}$city${Secrets.country}$country${Secrets.end}'));
    return response;
  }

  Future<http.Response> surahList() async {
    final response = await http.get(Uri.parse(Secrets.surahList));
    return response;
  }

  Future<http.Response> playlist1() async {
    final response1 = await http.get(
        Uri.parse(
            '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${Constants.kidsPlaylist}${Secrets.key}'),
        headers: {
          "Accept": "application/json",
        });
    return response1;
  }

  Future<http.Response> playlist2() async {
    final response2 = await http.get(
        Uri.parse(
            '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${Constants.umarPlaylist}${Secrets.key}'),
        headers: {
          "Accept": "application/json",
        });
    return response2;
  }

  Future<http.Response> playlist3() async {
    final response3 = await http.get(
          Uri.parse(
              '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}${Constants.yaqeenInstitutelist}${Secrets.key}'),
          headers: {
            "Accept": "application/json",
          });
    return response3;
  }
}
