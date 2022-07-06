import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kickinn/src/data/recentOrder.dart';



Future<RecentOrder> getRecentOrder(
    String? userId) async {
  var data = {
    'user_id': userId,
  };
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/recent_orders'),
      body: json.encode(body));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return RecentOrder.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
