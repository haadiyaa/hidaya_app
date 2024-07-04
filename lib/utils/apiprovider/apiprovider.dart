import 'dart:convert';

import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  Future<String> loginUser(Map data) async {
    try {
      final response = await http.post(
        Uri.parse('${Secrets.authUrl}${Secrets.login}'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      final data1 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data1['token']);
        var sharedPref=await SharedPreferences.getInstance();
        await sharedPref.setString(Constants.LOGINTOKEN, data1['token'].toString());
        return '';
      } else {
        return data1['msg'].toString();
      }
    } catch (e) {
      return e.toString();
      
    }
  }
}
