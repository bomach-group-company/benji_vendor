// To parse this JSON data, do
//
//     final myProductsModel = myProductsModelFromJson(jsonString);

import 'dart:convert';

List<MyProductsModel> myProductsModelFromJson(String str) =>
    List<MyProductsModel>.from(
        json.decode(str).map((x) => MyProductsModel.fromJson(x)));

String myProductsModelToJson(List<MyProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyProductsModel {
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

  MyProductsModel({
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

  factory MyProductsModel.fromJson(Map<String, dynamic> json) =>
      MyProductsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantityAvailable: json["quantity_available"],
        productImage: json["product_image"],
        isAvailable: json["is_available"],
        isTrending: json["is_trending"],
        isRecommended: json["is_recommended"],
        vendorId: json["vendor_id"] == null
            ? null
            : VendorId.fromJson(json["vendor_id"]),
        subCategoryId: json["sub_category_id"] == null
            ? null
            : SubCategoryId.fromJson(json["sub_category_id"]),
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
        category: json["category"] == null
            ? null
            : SubCategoryId.fromJson(json["category"]),
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



// To parse this JSON data, do
//
//     final productVarietyModel = productVarietyModelFromJson(jsonString);



List<ProductVarietyModel> productVarietyModelFromJson(String str) => List<ProductVarietyModel>.from(json.decode(str).map((x) => ProductVarietyModel.fromJson(x)));

String productVarietyModelToJson(List<ProductVarietyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductVarietyModel {
    DateTime? created;
    String? id;
    String? title;
    String? product;

    ProductVarietyModel({
        this.created,
        this.id,
        this.title,
        this.product,
    });

    factory ProductVarietyModel.fromJson(Map<String, dynamic> json) => ProductVarietyModel(
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        id: json["id"],
        title: json["title"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "created": "${created!.year.toString().padLeft(4, '0')}-${created!.month.toString().padLeft(2, '0')}-${created!.day.toString().padLeft(2, '0')}",
        "id": id,
        "title": title,
        "product": product,
    };
}



// To parse this JSON data, do
//
//     final varietyoptionModel = varietyoptionModelFromJson(jsonString);


List<VarietyoptionModel> varietyoptionModelFromJson(String str) => List<VarietyoptionModel>.from(json.decode(str).map((x) => VarietyoptionModel.fromJson(x)));

String varietyoptionModelToJson(List<VarietyoptionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VarietyoptionModel {
    DateTime? created;
    String? id;
    String? option;
    int? price;
    String? variety;

    VarietyoptionModel({
        this.created,
        this.id,
        this.option,
        this.price,
        this.variety,
    });

    factory VarietyoptionModel.fromJson(Map<String, dynamic> json) => VarietyoptionModel(
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        id: json["id"],
        option: json["option"],
        price: json["price"],
        variety: json["variety"],
    );

    Map<String, dynamic> toJson() => {
        "created": "${created!.year.toString().padLeft(4, '0')}-${created!.month.toString().padLeft(2, '0')}-${created!.day.toString().padLeft(2, '0')}",
        "id": id,
        "option": option,
        "price": price,
        "variety": variety,
    };
}
