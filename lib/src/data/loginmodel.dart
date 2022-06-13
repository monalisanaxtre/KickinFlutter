
import 'dart:convert';

LoginResponse loginFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    Data data;

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
    Data({
        this.userData,
        this.tokenData,
        this.address,
    });

    UserData userData;
    TokenData tokenData;
    Address address;

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
    Address({
        this.addressId,
        this.userId,
        this.name,
        this.phoneNumber,
        this.houseNo,
        this.city,
        this.fullAddress,
        this.state,
        this.landmark,
        this.pincode,
        this.latitude,
        this.longitude,
        this.createdOn,
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
    String pincode;
    String latitude;
    String longitude;
    DateTime createdOn;

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
    TokenData({
        this.type,
        this.token,
    });

    String type;
    String token;

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
    UserData({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.postcode,
        this.latitude,
        this.longitude,
    });

    String id;
    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String postcode;
    String latitude;
    String longitude;

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
