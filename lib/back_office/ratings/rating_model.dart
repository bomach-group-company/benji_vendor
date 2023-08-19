// To parse this JSON data, do
//
//     final vendorRatingModel = vendorRatingModelFromJson(jsonString);

import 'dart:convert';

List<VendorRatingModel> vendorRatingModelFromJson(String str) => List<VendorRatingModel>.from(json.decode(str).map((x) => VendorRatingModel.fromJson(x)));

String vendorRatingModelToJson(List<VendorRatingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VendorRatingModel {
    String? id;
   dynamic ratingValue;
    String? comment;
    DateTime? created;
    Client? client;
    Client? vendor;

    VendorRatingModel({
        this.id,
        this.ratingValue,
        this.comment,
        this.created,
        this.client,
        this.vendor,
    });

    factory VendorRatingModel.fromJson(Map<String, dynamic> json) => VendorRatingModel(
        id: json["id"],
        ratingValue: json["rating_value"],
        comment: json["comment"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
        vendor: json["vendor"] == null ? null : Client.fromJson(json["vendor"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rating_value": ratingValue,
        "comment": comment,
        "created": created?.toIso8601String(),
        "client": client?.toJson(),
        "vendor": vendor?.toJson(),
    };
}

class Client {
    int? id;
    String? username;
    String? email;

    Client({
        this.id,
        this.username,
        this.email,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
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
