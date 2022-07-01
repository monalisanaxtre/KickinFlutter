// To parse this JSON data, do
//
//     final loginFailedModel = loginFailedModelFromJson(jsonString);

import 'dart:convert';

LoginFailedModel loginFailedModelFromJson(String str) => LoginFailedModel.fromJson(json.decode(str));

String loginFailedModelToJson(LoginFailedModel data) => json.encode(data.toJson());

class LoginFailedModel {
    LoginFailedModel({
      required  this.status,
      required  this.error,
      required  this.errorCode,
    });

    int status;
    List<String> error;
    int errorCode;

    factory LoginFailedModel.fromJson(Map<String, dynamic> json) => LoginFailedModel(
        status: json["status"],
        error: List<String>.from(json["error"].map((x) => x)),
        errorCode: json["error_code"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "error": List<dynamic>.from(error.map((x) => x)),
        "error_code": errorCode,
    };
}
