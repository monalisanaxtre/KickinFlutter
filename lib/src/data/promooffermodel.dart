// To parse this JSON data, do
//
//     final promoOffer = promoOfferFromJson(jsonString);

import 'dart:convert';

PromoOffer promoOfferFromJson(String str) =>
    PromoOffer.fromJson(json.decode(str));

String promoOfferToJson(PromoOffer data) => json.encode(data.toJson());

class PromoOffer {
  PromoOffer({
    required this.status,
    required this.data,
  });

  int status;
  List<Datum> data;

  factory PromoOffer.fromJson(Map<String, dynamic> json) => PromoOffer(
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
    required this.id,
    required this.name,
    required this.offerDescription,
    required this.startDate,
    required this.endDate,
    required this.featureImage,
    required this.images,
  });

  String id;
  String name;
  String offerDescription;
  String startDate;
  String endDate;
  String featureImage;
  List<String> images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        offerDescription: json["offer_description"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        featureImage: json["feature_image"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "offer_description": offerDescription,
        "start_date": startDate,
        "end_date": endDate,
        "feature_image": featureImage,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
