// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  int status;
  List<Datum> data;
  Store({
    required this.status,
    required this.data,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String storeName;
  String storeAddress;
  Datum({
    required this.id,
    required this.storeName,
    required this.storeAddress,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        storeName: json["store_name"],
        storeAddress: json["store_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_name": storeName,
        "store_address": storeAddress,
      };
}
