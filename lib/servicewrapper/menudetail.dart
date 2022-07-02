import 'package:kickinn/src/presentation/view/homeview.dart/menudetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../src/data/menudetailmodel.dart';

Future<MenuDeatilModel> getMenuDetails(storeMenuId, storeId, userId) async {
  var data = {
    'store_menu_id': storeMenuId,
    'store_id': storeId,
    'user_id': userId,
  };
  var headers = {
    "content-type": "application/json",
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/singleItemDetails'),
      headers: headers,
      body: json.encode(body));
  var jsonString = response.body;
  var jsonMap = json.decode(jsonString);

  try {
    if (response.statusCode == 200 && response.body.contains("data")) {
      return MenuDeatilModel.fromJson(jsonMap);
    } else {
      return MenuDeatilModel.fromJson(jsonMap);
    }
  } catch (_) {
    throw Exception("Failed to load data");
  }
}