// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromJson(jsonString);

import 'dart:convert';

List<MyOrderModel> myOrderModelFromJson(String str) => List<MyOrderModel>.from(json.decode(str).map((x) => MyOrderModel.fromJson(x)));

String myOrderModelToJson(List<MyOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrderModel {
    String? id;
    String? deliveryAddress;
    String? status;
    dynamic quantity;
    DateTime? created;
    ClientId? clientId;
    ProductId? productId;

    MyOrderModel({
        this.id,
        this.deliveryAddress,
        this.status,
        this.quantity,
        this.created,
        this.clientId,
        this.productId,
    });

    factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
        id: json["id"],
        deliveryAddress: json["delivery_address"],
        status: json["status"],
        quantity: json["quantity"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        clientId: json["client_id"] == null ? null : ClientId.fromJson(json["client_id"]),
        productId: json["product_id"] == null ? null : ProductId.fromJson(json["product_id"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "delivery_address": deliveryAddress,
        "status": status,
        "quantity": quantity,
        "created": "${created!.year.toString().padLeft(4, '0')}-${created!.month.toString().padLeft(2, '0')}-${created!.day.toString().padLeft(2, '0')}",
        "client_id": clientId?.toJson(),
        "product_id": productId?.toJson(),
    };
}

class ClientId {
    dynamic id;
    String? username;
    String? email;
    String? phone;
    String? image;

    ClientId({
        this.id,
        this.username,
        this.email,
        this.phone,
        this.image,
    });

    factory ClientId.fromJson(Map<String, dynamic> json) => ClientId(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "image": image,
    };
}

class ProductId {
    String? id;
    String? name;
    String? description;
    dynamic price;
    dynamic quantityAvailable;
    String? productImage;
    bool? isAvailable;
    bool? isTrending;
    bool? isRecommended;
    VendorId? vendorId;
    SubCategoryId? subCategoryId;

    ProductId({
        this.id,
        this.name,
        this.description,
        this.price,
        this.quantityAvailable,
        this.productImage,
        this.isAvailable,
        this.isTrending,
        this.isRecommended,
        this.vendorId,
        this.subCategoryId,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantityAvailable: json["quantity_available"],
        productImage: json["product_image"],
        isAvailable: json["is_available"],
        isTrending: json["is_trending"],
        isRecommended: json["is_recommended"],
        vendorId: json["vendor_id"] == null ? null : VendorId.fromJson(json["vendor_id"]),
        subCategoryId: json["sub_category_id"] == null ? null : SubCategoryId.fromJson(json["sub_category_id"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity_available": quantityAvailable,
        "product_image": productImage,
        "is_available": isAvailable,
        "is_trending": isTrending,
        "is_recommended": isRecommended,
        "vendor_id": vendorId?.toJson(),
        "sub_category_id": subCategoryId?.toJson(),
    };
}

class SubCategoryId {
    String? id;
    String? name;
    String? description;
    bool? isActive;
    SubCategoryId? category;

    SubCategoryId({
        this.id,
        this.name,
        this.description,
        this.isActive,
        this.category,
    });

    factory SubCategoryId.fromJson(Map<String, dynamic> json) => SubCategoryId(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isActive: json["is_active"],
        category: json["category"] == null ? null : SubCategoryId.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "is_active": isActive,
        "category": category?.toJson(),
    };
}

class VendorId {
    dynamic id;
    String? username;
    String? email;

    VendorId({
        this.id,
        this.username,
        this.email,
    });

    factory VendorId.fromJson(Map<String, dynamic> json) => VendorId(
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
