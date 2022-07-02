import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kickinn/src/data/getallbagitemmodel.dart';

Future<GetAllBagItem> getAllBagItem(userId, currentTime) async {
  var data = {
    'user_id': userId,
    'current_time': currentTime,
  };
  var headers = {
    "content-type": "application/json",
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/get_all_bag_items'),
      headers: headers,
      body: json.encode(body));
  var jsonString = response.body;
  var jsonMap = json.decode(jsonString);

  try {
    if (response.statusCode == 200 && response.body.contains("data")) {
      return GetAllBagItem.fromJson(jsonMap);
    } else {
      return GetAllBagItem.fromJson(jsonMap);
    }
  } catch (_) {
    throw Exception("Failed to load data");
  }
}
