import 'package:kickinn/src/data/loginfailedModel.dart';
import 'package:kickinn/src/data/loginmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future login(email, password, deviceType, deviceToken) async {
  var data = {
    'email': email,
    'password': password,
    'device_type': deviceType,
    'device_token': deviceToken,
  };
  print(data.toString());

  var headers = {
    "content-type": "application/json",
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/login'),
      headers: headers,
      body: json.encode(body));
  var jsonString = response.body;
  var jsonMap = json.decode(jsonString);
  try {
    if (response.statusCode == 200 && response.body.contains("data")) {
      return LoginResponse.fromJson(jsonMap);
    } else {
      return LoginFailedModel.fromJson(jsonMap);
    }
  } catch (_) {
    throw Exception("Failed to load data");
  }
}
 