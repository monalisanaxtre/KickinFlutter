import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kickinn/src/data/recentOrder.dart';

import '../src/data/promooffermodel.dart';

Future<PromoOffer> getPromoOffer() async {
  var data = {};
  var body = data;
  var response = await http.post(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/allPromoOffers'),
      body: json.encode(body));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return PromoOffer.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
