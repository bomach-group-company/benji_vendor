// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) => List<NotificationModel>.from(json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
    String? id;
    DateTime? created;
    String? message;
    Client? client;
    Client? vendor;

    NotificationModel({
        this.id,
        this.created,
        this.message,
        this.client,
        this.vendor,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        message: json["message"],
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
        vendor: json["vendor"] == null ? null : Client.fromJson(json["vendor"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created": created?.toIso8601String(),
        "message": message,
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
