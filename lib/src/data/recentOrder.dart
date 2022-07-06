// To parse this JSON data, do
//
//     final recentOrder = recentOrderFromJson(jsonString);

import 'dart:convert';

RecentOrder recentOrderFromJson(String str) => RecentOrder.fromJson(json.decode(str));

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
    StoreName storeName;
    StoreAddress storeAddress;
    String orderStatus;
    String orderPlacedOn;
    dynamic rating;
    bool ratingStatus;
    List<ItemDetail> itemDetails;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderNo: json["order_no"],
        amntPaid: json["amnt_paid"],
        storeName: storeNameValues.map[json["store_name"]],
        storeAddress: storeAddressValues.map[json["store_address"]],
        orderStatus: json["order_status"],
        orderPlacedOn: json["order_placed_on"],
        rating: json["rating"],
        ratingStatus: json["rating status"],
        itemDetails: List<ItemDetail>.from(json["item_details"].map((x) => ItemDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order_no": orderNo,
        "amnt_paid": amntPaid,
        "store_name": storeNameValues.reverse[storeName],
        "store_address": storeAddressValues.reverse[storeAddress],
        "order_status": orderStatus,
        "order_placed_on": orderPlacedOn,
        "rating": rating,
        "rating status": ratingStatus,
        "item_details": List<dynamic>.from(itemDetails.map((x) => x.toJson())),
    };
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

enum StoreAddress { ADELAIDE_AUSTRALIA, LORD_HOWE_ISLAND_AUSTRALIA, EUCLA_STREET_NO_94_AUSTRAILIA, SCO_35, PERTH_AUSTRAILIA }

final storeAddressValues = EnumValues({
    "Adelaide, Australia": StoreAddress.ADELAIDE_AUSTRALIA,
    "Eucla, street no - 94, Austrailia": StoreAddress.EUCLA_STREET_NO_94_AUSTRAILIA,
    "Lord Howe Island, Australia": StoreAddress.LORD_HOWE_ISLAND_AUSTRALIA,
    "Perth, Austrailia": StoreAddress.PERTH_AUSTRAILIA,
    "sco-35": StoreAddress.SCO_35
});

enum StoreName { CHILLIS_RESTRO, BHATINDA_PUNJAB, NAXTRE_STORE, BURGER_KING, KICKINN_BISTRO }

final storeNameValues = EnumValues({
    "Bhatinda Punjab": StoreName.BHATINDA_PUNJAB,
    "Burger King": StoreName.BURGER_KING,
    "Chillis Restro": StoreName.CHILLIS_RESTRO,
    "Kickinn Bistro": StoreName.KICKINN_BISTRO,
    "Naxtre_Store": StoreName.NAXTRE_STORE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
