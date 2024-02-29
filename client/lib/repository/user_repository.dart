import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:client/util/local_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:client/util/show_Alert.dart';
import 'package:client/util/db_util.dart';


class UserRepository{
  
  final localStorage=LocalStorage();

  Future<bool> signIn(String email, String password) async{

      var res=await http.post(Uri.parse('$baseUrl/user/login'),
          headers: <String,String>{'Content-Type':'application/json'},
          body:jsonEncode({"email":email, "password":password}
          ) );

      final Map<String, dynamic> data = jsonDecode(res.body);

      if(res.statusCode==200){
        final userID=JwtDecoder.decode(data["accessToken"])["userID"];
        localStorage.setUserID(userID);
        localStorage.setAccessToken(data["accessToken"]);
        localStorage.setRefreshToken(data["refreshToken"]);
        showSuccess(data["Message"]);
        return true;
      }else{
        showError(data["Message"]);
        return false;
      }

  }

  Future<bool> register(String email, String password) async{
    var res=await http.post(Uri.parse("$baseUrl/user/register"),
        headers: <String,String>{'Content-Type':'application/json'},
        body:jsonEncode({"email":email, "password":password}
        ) );
      final Map<String,dynamic> data=jsonDecode(res.body);
      if(res.statusCode==200){
        showSuccess(data["Message"]);
        return true;
      }else{
        showError(data["Message"]);
        return false;
      }
  }




}
