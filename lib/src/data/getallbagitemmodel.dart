// To parse this JSON data, do
//
//     final getAllBagItem = getAllBagItemFromJson(jsonString);

import 'dart:convert';

GetAllBagItem getAllBagItemFromJson(String str) =>
    GetAllBagItem.fromJson(json.decode(str));

String getAllBagItemToJson(GetAllBagItem data) => json.encode(data.toJson());

class GetAllBagItem {
  GetAllBagItem({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory GetAllBagItem.fromJson(Map<String, dynamic> json) => GetAllBagItem(
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
    required this.storeId,
    required this.gst,
    required this.bagTotalPrice,
    required this.toPay,
    required this.bagItems,
    required this.deliveryTime,
  });

  String storeId;
  String gst;
  String bagTotalPrice;
  String toPay;
  List<BagItem> bagItems;
  List<String> deliveryTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        storeId: json["store_id"],
        gst: json["gst"],
        bagTotalPrice: json["bag_total_price"],
        toPay: json["to_pay"],
        bagItems: List<BagItem>.from(
            json["bag_items"].map((x) => BagItem.fromJson(x))),
        deliveryTime: List<String>.from(json["delivery_time"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "gst": gst,
        "bag_total_price": bagTotalPrice,
        "to_pay": toPay,
        "bag_items": List<dynamic>.from(bagItems.map((x) => x.toJson())),
        "delivery_time": List<dynamic>.from(deliveryTime.map((x) => x)),
      };
}

class BagItem {
  BagItem({
    required this.bagItemId,
    required this.storeId,
    required this.qty,
    required this.storeMenuId,
    required this.addOnAvailable,
    required this.addOnIds,
    required this.addOnQtys,
    required this.itemName,
    required this.price,
  });

  String bagItemId;
  String storeId;
  String qty;
  String storeMenuId;
  bool addOnAvailable;
  String addOnIds;
  String addOnQtys;
  String itemName;
  String price;

  factory BagItem.fromJson(Map<String, dynamic> json) => BagItem(
        bagItemId: json["bag_item_id"],
        storeId: json["store_id"],
        qty: json["qty"],
        storeMenuId: json["store_menu_id"],
        addOnAvailable: json["add_on_available"],
        addOnIds: json["add_on_ids"],
        addOnQtys: json["add_on_qtys"],
        itemName: json["item_name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "bag_item_id": bagItemId,
        "store_id": storeId,
        "qty": qty,
        "store_menu_id": storeMenuId,
        "add_on_available": addOnAvailable,
        "add_on_ids": addOnIds,
        "add_on_qtys": addOnQtys,
        "item_name": itemName,
        "price": price,
      };
}

class AddOnDetail {
  AddOnDetail({
    required this.id,
    required this.typeId,
    required this.addOnName,
    required this.qty,
    required this.addOnPrice,
  });

  String id;
  String typeId;
  String addOnName;
  String qty;
  String addOnPrice;

  factory AddOnDetail.fromJson(Map<String, dynamic> json) => AddOnDetail(
        id: json["id"],
        typeId: json["type_id"],
        addOnName: json["add_on_name"],
        qty: json["qty"],
        addOnPrice: json["add_on_price"] == null ? null : json["add_on_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "add_on_name": addOnName,
        "qty": qty,
        "add_on_price": addOnPrice == null ? null : addOnPrice,
      };
}
