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

  Future<void> setOnboardStatus(bool status) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("onboardStatus",status);
  }

  Future<void> clearUserDetails() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    setOnboardStatus(false);
  }

  Future<bool> getOnboardStatus() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("onboardStatus") ?? true;
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


  Future<void> setYoutubeNotificationStatus(bool status) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("youtubeNotificationStatus",status);
  }

  Future<bool> getYoutubeNotificationStatus() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("youtubeNotificationStatus") ?? false;
  }

  Future<void> setRankNotificationStatus(bool status) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("rankNotificationStatus",status);
  }

  Future<bool> getRankNotificationStatus() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("rankNotificationStatus") ?? true;
  }

  Future<void> setQuizNotificationStatus(bool status) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("quizNotificationStatus",status);
  }

  Future<bool> getQuizNotificationStatus() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("quizNotificationStatus") ?? false;
  }

}