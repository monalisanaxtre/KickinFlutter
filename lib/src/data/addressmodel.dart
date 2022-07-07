// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    AddressModel({
       required this.status,
       required this.data,
    });

    int status;
    Data data;

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
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
      required  this.addressId,
      required  this.userId,
      required  this.name,
      required  this.phoneNumber,
      required  this.houseNo,
      required  this.city,
      required  this.fullAddress,
      required  this.state,
      required  this.landmark,
      required  this.latitude,
      required  this.longitude,
      required  this.pincode,
    });

    String addressId;
    String userId;
    String name;
    String phoneNumber;
    String houseNo;
    String city;
    String fullAddress;
    String state;
    String landmark;
    String latitude;
    String longitude;
    String pincode;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        addressId: json["address_id"],
        userId: json["user_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        houseNo: json["house_no"],
        city: json["city"],
        fullAddress: json["full_address"],
        state: json["state"],
        landmark: json["landmark"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "user_id": userId,
        "name": name,
        "phone_number": phoneNumber,
        "house_no": houseNo,
        "city": city,
        "full_address": fullAddress,
        "state": state,
        "landmark": landmark,
        "latitude": latitude,
        "longitude": longitude,
        "pincode": pincode,
    };
}
