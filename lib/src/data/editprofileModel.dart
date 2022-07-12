// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
    EditProfileModel({
      required  this.status,
      required  this.data,
    });

    int status;
    Data data;

    factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
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
       required this.userId,
       required this.firstName,
       required this.lastName,
       required this.phoneNumber,
       required this.email,
       required this.gender,
       required this.dob,
       required this.userPhoto,
    });

    String userId;
    String firstName;
    String lastName;
    String phoneNumber;
    String email;
    String gender;
    String dob;
    String userPhoto;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        gender: json["gender"],
        dob: json["dob"],
        userPhoto: json["user_photo"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "gender": gender,
        "dob": dob,
        "user_photo": userPhoto,
    };
}
