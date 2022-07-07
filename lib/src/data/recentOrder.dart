import 'dart:convert';

RecentOrder recentOrderFromJson(String str) =>
    RecentOrder.fromJson(json.decode(str));

String recentOrderToJson(RecentOrder data) => json.encode(data.toJson());

class RecentOrder {
  RecentOrder({
    required this.status,
    required this.data,
  });

  int status;
  List<Datum> data;

  factory RecentOrder.fromJson(Map<String, dynamic> json) => RecentOrder(
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
    required this.orderNo,
    required this.amntPaid,
    required this.storeName,
    required this.storeAddress,
    required this.orderStatus,
    required this.orderPlacedOn,
    required this.rating,
    required this.ratingStatus,
    required this.itemDetails,
  });

  String orderNo;
  String amntPaid;
  String storeName;
  String storeAddress;
  String orderStatus;
  String orderPlacedOn;
  dynamic rating;
  bool ratingStatus;
  List<ItemDetail> itemDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderNo: json["order_no"],
        amntPaid: json["amnt_paid"],
        storeName: json["store_name"],
        storeAddress: json["store_address"],
        orderStatus: json["order_status"],
        orderPlacedOn: json["order_placed_on"],
        rating: json["rating"],
        ratingStatus: json["rating status"],
        itemDetails: List<ItemDetail>.from(
            json["item_details"].map((x) => ItemDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_no": orderNo,
        "amnt_paid": amntPaid,
        "store_name": storeName,
        "store_address": storeAddress,
        "order_status": orderStatus,
        "order_placed_on": orderPlacedOn,
        "rating": rating,
        "rating status": ratingStatus,
        "item_details": List<dynamic>.from(itemDetails.map((x) => x.toJson())),
      };

  ItemDetails() {
    itemDetails.join(",\n");
  }
}

class ItemDetail {
  ItemDetail({
    required this.itemName,
    required this.qty,
  });

  String itemName;
  String qty;

  factory ItemDetail.fromJson(Map<String, dynamic> json) => ItemDetail(
        itemName: json["item_name"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "qty": qty,
      };
}
