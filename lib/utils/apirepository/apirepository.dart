import 'package:hidhayah/utils/apiprovider/apiprovider.dart';

class ApiRepostiroy {
  final ApiProvider _apiProvider=ApiProvider();
  Future<dynamic> loginUser( Map data)async{
    return _apiProvider.loginUser(data);
  }
  Future<dynamic> signupUser( Map data)async{
    return _apiProvider.signupUser(data);
  }
  Future<dynamic> forgotPass( Map data)async{
    return _apiProvider.forgotPassword(data);
  }
  Future<dynamic> fetchPrayertime( String year, String month, String city, String country)async{
    return _apiProvider.fetchPrayetrtime(year,month,city,country);
  }

  Future<dynamic> surahList( )async{
    return _apiProvider.surahList();
  }

}