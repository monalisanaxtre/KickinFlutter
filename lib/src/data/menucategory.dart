// To parse this JSON data, do
//
//     final menuCategory = menuCategoryFromJson(jsonString);

import 'dart:convert';

MenuCategoryModel menuCategoryFromJson(String str) =>
    MenuCategoryModel.fromJson(json.decode(str));

String menuCategoryToJson(MenuCategoryModel data) => json.encode(data.toJson());

class MenuCategoryModel {
  int status;
  List<Datum> data;
  MenuCategoryModel({
    required this.status,
    required this.data,
  });

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) => MenuCategoryModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String storeMenuId;
  String storeId;
  String categoryId;
  String itemName;
  String itemPrice;

  String itemDescription;
  String image;
  Datum({
    required this.storeMenuId,
    required this.storeId,
    required this.categoryId,
    required this.itemName,
    required this.itemPrice,

    required this.itemDescription,
    required this.image,
  });

  

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        storeMenuId: json["store_menu_id"],
        storeId: json["store_id"],
        categoryId: json["category_id"],
        itemName: json["item_name"],
        itemPrice: json["item_price"],
       
        itemDescription: json["item_description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "store_menu_id": storeMenuId,
        "store_id": storeId,
        "category_id": categoryId,
        "item_name": itemName,
        "item_price": itemPrice,
     
        "item_description": itemDescription,
        "image": image,
      };
}




