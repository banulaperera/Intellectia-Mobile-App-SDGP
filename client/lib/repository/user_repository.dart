import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRepository{
  Future<void> signIn(String email, String password) async{
    var res=await http.post(Uri.parse("http://192.168.8.100:3000/user/login"),
    body:jsonEncode(
        {
          "email":"banula@gmail.com",
          "password":"banulajjj123"

        }
    ) );
       print(res.body);
  }
}
