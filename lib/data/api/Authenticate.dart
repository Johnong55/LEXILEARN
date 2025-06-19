import 'dart:convert';
import 'dart:developer';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loginUser(String username,String password) async
{
  final url  = Uri.parse("http://192.168.1.17:8080/api/auth/login");
  try{
    final Response =  await http.post(url,
      headers: {'Content-Type': 'application/json',
       }
       ,body: jsonEncode({
        'email': username,
        'password':password,
       })
    );
    if(Response.statusCode == 200)
    {
      final responseData = jsonDecode(Response.body);
      final token = responseData['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("jwt_token",token);
      log("success login");
      return true;
    }
    else{
      
      log("false : ${Response.statusCode}");
    }
  }
  catch (e)
  {
      log("error : ${e.toString()}");
  }
  return false;
}
Future<bool> isLoggedIn() async{
  final prefs  = await SharedPreferences.getInstance();
  final token  = prefs.getString('jwt_token');
  if(token == null || JwtDecoder.isExpired(token)){
    return false;

  }
  return true;
}
Future<void> logout() async{
  final prefs = await SharedPreferences.getInstance();
await  prefs.remove('jwt_token');

}
