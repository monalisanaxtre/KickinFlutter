// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
      int status;
    List<Datum> data;

    Menu({
       required  this.status,
       required  this.data,
    });



    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
      String categoryId;
    String name;
    String icon;
    Datum({
         required this.categoryId,
       required this.name,
        required this.icon,
    });

   

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        name: json["name"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "icon": icon,
    };
}
