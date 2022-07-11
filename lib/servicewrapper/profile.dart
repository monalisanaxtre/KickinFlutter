import 'package:http/http.dart' as http;
import 'package:kickinn/src/data/profilemodel.dart';
import 'dart:convert';



Future<ProfileModel> viewProfile(String? userId) async {
  var data = {
    'user_id': userId,
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/view_profile'),
      body: json.encode(body));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return ProfileModel.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
