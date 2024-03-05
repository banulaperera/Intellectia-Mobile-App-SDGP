import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  Future<void> setUserID(String userID) async{
  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("userID",userID);
  }

  Future<void> setAccessToken(String accessToken) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken",accessToken);
  }

  Future<void> setRefreshToken(String refreshToken) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("refreshToken",refreshToken);
  }

  Future<String> getUserID() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("userID") ?? "";

  }

  Future<String> getAccessToken() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("accessToken") ?? "";
  }

  Future<String> getRefreshToken() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("refreshToken") ?? "";
  }



}