import 'package:kickinn/src/data/menucategory.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<MenuCategoryModel> getMenuCategoryList(categoryId,storeId) async {
  var data={
    'category_id ':categoryId,
    'store_id':storeId,
  };
  var body=data;
  var response = await http.post(

      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/items_by_category'),
      body: json.encode(body));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return MenuCategoryModel.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}