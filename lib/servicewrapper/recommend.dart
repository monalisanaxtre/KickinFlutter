import 'package:kickinn/src/data/loginmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kickinn/src/data/recommend.dart';

Future<RecommendModel> getrecommendFood() async {
  var response = await http.get(Uri.parse(
      'https://www.naxtre.com/kickin-inn_dev/api/get_recommended_items'));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return RecommendModel.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
