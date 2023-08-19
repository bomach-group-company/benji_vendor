// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int? id;
    String? email;
    String? password;
    String? phone;
    DateTime? created;
    String? username;
    String? firstName;
    String? lastName;
    String? gender;
    String? address;
    String? shopName;
    dynamic balance;

    UserModel({
        this.id,
        this.email,
        this.password,
        this.phone,
        this.created,
        this.username,
        this.firstName,
        this.lastName,
        this.gender,
        this.address,
        this.shopName,
        this.balance,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        address: json["address"],
        shopName: json["shop_name"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "phone": phone,
        "created": created?.toIso8601String(),
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "address": address,
        "shop_name": shopName,
        "balance": balance,
    };
}


class UpdateProfile {
  String? email;
  File? image;
  UpdateProfile({required this.email, this.image});
}

// To parse this JSON data, do
//
//     final userIdModel = userIdModelFromJson(jsonString);

UserIdModel userIdModelFromJson(String str) =>
    UserIdModel.fromJson(json.decode(str));

String userIdModelToJson(UserIdModel data) => json.encode(data.toJson());

class UserIdModel {
  int? id;
  dynamic username;
  String? email;

  UserIdModel({
    this.id,
    this.username,
    this.email,
  });

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
      };
}
