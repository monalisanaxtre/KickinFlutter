import 'dart:convert';

import 'package:kickinn/src/data/addtocartmodel.dart';
import 'package:http/http.dart' as http;
import 'package:kickinn/src/data/editprofileModel.dart';

Future<EditProfileModel> editProfile(
    userId, firstName, lastName, email, phoneNumber, gender, dob) async {
  var data = {
    "user_id": "23",
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "gender": gender,
    "dob": dob
  };
  var headers = {
    "content-type": "application/json",
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/edit_profile'),
      headers: headers,
      body: json.encode(body));
  var jsonString = response.body;
  var jsonMap = json.decode(jsonString);

  try {
    if (response.statusCode == 200 && response.body.contains("data")) {
      return EditProfileModel.fromJson(jsonMap);
    } else {
      return EditProfileModel.fromJson(jsonMap);
    }
  } catch (_) {
    throw Exception("Failed to load data");
  }
}
