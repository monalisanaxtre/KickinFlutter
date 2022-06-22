import 'package:kickinn/src/data/loginmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kickinn/src/data/recommend.dart';

// class Recommend {
//  static  Future<RecommendModel> recommendfoodlist() async {
//     // ignore: prefer_typing_uninitialized_variables
//     var recommendresponse;
//     final response = await http.get(Uri.parse(
//         'https://www.naxtre.com/kickin-inn_dev/api/get_recommended_items'));
//     try {
//       if (response.statusCode == 200) {
//         recommendresponse = RecommendModel.fromJson(jsonDecode(response.body));
//         return recommendresponse;
//       }
//     } catch (e) {
//       return recommendresponse;
//     }
//     return recommendresponse;
//   }
// }
