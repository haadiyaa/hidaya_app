import 'package:hidhayah/utils/apiprovider/apiprovider.dart';

class ApiRepostiroy {
  final ApiProvider _apiProvider=ApiProvider();
  Future<dynamic> loginUser( Map data)async{
    return _apiProvider.loginUser(data);
  }
  Future<dynamic> signupUser( Map data)async{
    return _apiProvider.signupUser(data);
  }
}