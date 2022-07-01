import 'package:kickinn/src/presentation/view/homeview.dart/menudetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../src/data/menudetailmodel.dart';

Future<MenuDeatilModel> getMenuDetails(
    String? storeMenuId, String? storeId, String? userId) async {
  var data = {
    'store_menu_id': storeMenuId,
    'store_id': storeId,
    'user_id': userId,
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/singleItemDetails'),
      body: json.encode(body));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return MenuDeatilModel.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
