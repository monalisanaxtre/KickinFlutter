import 'package:kickinn/src/data/loginmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Login {
  Future<LoginResponse> login() async {
    // ignore: prefer_typing_uninitialized_variables
    var loginresponse;
    final response =
        await http.get(Uri.parse('https://www.naxtre.com/kickin-inn_dev/'));
    try {
      if (response.statusCode == 200) {
        loginresponse = LoginResponse.fromJson(jsonDecode(response.body));
        return loginresponse;
      }
    } catch (e) {
      return loginresponse;
    }
    return loginresponse;
  }
}