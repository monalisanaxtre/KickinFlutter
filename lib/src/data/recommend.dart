import 'dart:convert';

RecommendModel recommendFromJson(String str) =>
    RecommendModel.fromJson(json.decode(str));

String recommendToJson(RecommendModel data) => json.encode(data.toJson());

class RecommendModel {
  RecommendModel({
    this.status,
    this.data,
  });

  int status;
  List<Datum> data;

  factory RecommendModel.fromJson(Map<String, dynamic> json) => RecommendModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.itemId,
    this.itemImage,
    this.categoryId,
    this.itemName,
    this.itemPrice,
    // this.itemQuantity,
    this.itemDescription,
  });

  String itemId;
  String itemImage;
  String categoryId;
  String itemName;
  String itemPrice;
  // ItemQuantity itemQuantity;
  String itemDescription;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        itemId: json["item_id"],
        itemImage: json["item_image"],
        categoryId: json["category_id"],
        itemName: json["item_name"],
        itemPrice: json["item_price"],
        // itemQuantity: itemQuantityValues.map[json["item_quantity"]],
        itemDescription: json["item_description"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "item_image": itemImage,
        "category_id": categoryId,
        "item_name": itemName,
        "item_price": itemPrice,
        // "item_quantity": itemQuantityValues.reverse[itemQuantity],
        "item_description": itemDescription,
      };
}
