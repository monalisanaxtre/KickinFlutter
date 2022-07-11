// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
      required  this.status,
      required  this.message,
      required  this.data,
    });

    int status;
    String message;
    Data data;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
      required  this.userId,
      required  this.firstName,
      required  this.lastName,
      required  this.email,
      required  this.phoneNumber,
      required  this.gender,
      required  this.dob,
      required  this.userPhoto,
    });

    String userId;
    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String gender;
    String dob;
    String userPhoto;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        dob: json["dob"],
        userPhoto: json["user_photo"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "dob": dob,
        "user_photo": userPhoto,
    };
}
