

import 'package:client/repository/auth_repository.dart';
import 'package:client/util/local_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Future<void> refreshToken(String accessToken) async{

  if(JwtDecoder.isExpired(accessToken)){
    await AuthRepository().refreshToken();
  }
}

Future<bool> checkRefreshTokenIsExpired() async {
  final refreshToken = await LocalStorage().getRefreshToken();
  if(refreshToken!=null){
    return JwtDecoder.isExpired(refreshToken);
  }else{
    return true;
  }

}