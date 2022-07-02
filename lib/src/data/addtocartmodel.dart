// To parse this JSON data, do
//
//     final addToCart = addToCartFromJson(jsonString);

import 'dart:convert';

AddToCart addToCartFromJson(String str) => AddToCart.fromJson(json.decode(str));

String addToCartToJson(AddToCart data) => json.encode(data.toJson());

class AddToCart {
  AddToCart({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.counter,
  });

  String counter;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        counter: json["counter"],
      );

  Map<String, dynamic> toJson() => {
        "counter": counter,
      };
}
