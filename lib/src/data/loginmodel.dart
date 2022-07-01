import 'dart:convert';

LoginResponse loginFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int status;
  String message;
  Data data;
  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
  UserData userData;
  TokenData tokenData;
  Address address;
  Data({
    required this.userData,
    required this.tokenData,
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userData: UserData.fromJson(json["user_data"]),
        tokenData: TokenData.fromJson(json["token_data"]),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "user_data": userData.toJson(),
        "token_data": tokenData.toJson(),
        "address": address.toJson(),
      };
}

class Address {
  String addressId;
  String userId;
  String name;
  String phoneNumber;
  String houseNo;
  String city;
  String fullAddress;
  String state;
  String landmark;
  String pincode;
  String latitude;
  String longitude;
  DateTime createdOn;
  Address({
    required this.addressId,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.houseNo,
    required this.city,
    required this.fullAddress,
    required this.state,
    required this.landmark,
    required this.pincode,
    required this.latitude,
    required this.longitude,
    required this.createdOn,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressId: json["address_id"],
        userId: json["user_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        houseNo: json["house_no"],
        city: json["city"],
        fullAddress: json["full_address"],
        state: json["state"],
        landmark: json["landmark"],
        pincode: json["pincode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdOn: DateTime.parse(json["created_on"]),
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
        "pincode": pincode,
        "latitude": latitude,
        "longitude": longitude,
        "created_on": createdOn.toIso8601String(),
      };
}

class TokenData {
  String type;
  String token;
  TokenData({
    required this.type,
    required this.token,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
        type: json["type"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "token": token,
      };
}

class UserData {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String postcode;
  String latitude;
  String longitude;
  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.postcode,
    required this.latitude,
    required this.longitude,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        postcode: json["postcode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "postcode": postcode,
        "latitude": latitude,
        "longitude": longitude,
      };
}
