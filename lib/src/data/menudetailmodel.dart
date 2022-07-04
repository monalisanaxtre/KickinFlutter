import 'dart:convert';

MenuDeatilModel menuDeatilModelFromJson(String str) =>
    MenuDeatilModel.fromJson(json.decode(str));

String menuDeatilModelToJson(MenuDeatilModel data) =>
    json.encode(data.toJson());

class MenuDeatilModel {
  int status;
  Data data;
  MenuDeatilModel({
    required this.status,
    required this.data,
  });

  factory MenuDeatilModel.fromJson(Map<String, dynamic> json) =>
      MenuDeatilModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  bool customizeOptions;
  String storeMenuId;
  String storeId;
  String itemId;
  String categoryId;
  String itemName;
  String itemPrice;
  String itemQuantity;
  String itemDescription;
  String image;
  bool presentOnBag;
  String cookingTime;
  String qty;
  Data({
    required this.customizeOptions,
    required this.storeMenuId,
    required this.storeId,
    required this.itemId,
    required this.categoryId,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemDescription,
    required this.image,
    required this.presentOnBag,
    required this.cookingTime,
    required this.qty,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        customizeOptions: json["customize_options"],
        storeMenuId: json["store_menu_id"],
        storeId: json["store_id"],
        itemId: json["item_id"],
        categoryId: json["category_id"],
        itemName: json["item_name"],
        itemPrice: json["item_price"],
        itemQuantity: json["item_quantity"],
        itemDescription: json["item_description"],
        image: json["image"],
        presentOnBag: json["present_on_bag"],
        cookingTime: json["cooking_time"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "customize_options": customizeOptions,
        "store_menu_id": storeMenuId,
        "store_id": storeId,
        "item_id": itemId,
        "category_id": categoryId,
        "item_name": itemName,
        "item_price": itemPrice,
        "item_quantity": itemQuantity,
        "item_description": itemDescription,
        "image": image,
        "present_on_bag": presentOnBag,
        "cooking_time": cookingTime,
        "qty": qty,
      };
}
