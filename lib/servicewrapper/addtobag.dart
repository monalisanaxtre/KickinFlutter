import 'dart:convert';

import 'package:kickinn/src/data/addtocartmodel.dart';
import 'package:http/http.dart' as http;

Future<AddToCart> getAllBagItem(
  userId,
  storeId,
  storeMenuId,
  qty,
) async {
  var data = {
    "user_id": "25",
    "store_id": storeId,
    "store_menu_id": storeMenuId,
    "qty": qty,
    "add_on_presence": false
  };
  var headers = {
    "content-type": "application/json",
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/add_items_to_bag'),
      headers: headers,
      body: json.encode(body));
  var jsonString = response.body;
  var jsonMap = json.decode(jsonString);

  try {
    if (response.statusCode == 200 && response.body.contains("data")) {
      return AddToCart.fromJson(jsonMap);
    } else {
      return AddToCart.fromJson(jsonMap);
    }
  } catch (_) {
    throw Exception("Failed to load data");
  }
}
