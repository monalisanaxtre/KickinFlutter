import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kickinn/src/data/addressmodel.dart';

Future<AddressModel> addAddress(userId, name, phoneNumber, houseNo, state,
    city, fulladdress, landmark, pincode, latitude, longitude) async {
  var data = {
    "user_id": userId,
    "name": name,
    "phone_number": phoneNumber,
    "house_no": houseNo,
    "state": state,
    "city": city,
    "full_address": fulladdress,
    "landmark": landmark,
    "pincode": pincode,
    "latitude": latitude,
    "longitude": longitude
  };
  var headers = {
    "content-type": "application/json",
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/add_user_address'),
      headers: headers,
      body: json.encode(body));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

  try {
    if (response.statusCode == 200 && response.body.contains("data")) {
      return AddressModel.fromJson(jsonMap);
    } else {
      return AddressModel.fromJson(jsonMap);
    }
  } catch (_) {
    throw Exception("Failed to load data");
  }
}
