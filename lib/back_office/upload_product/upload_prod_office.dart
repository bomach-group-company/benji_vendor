import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:benji_vendor/back_office/upload_product/upload_prod_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

import '../networks/error.dart';
import '../networks/network.dart';
import '../temps/keys.dart';

const header = "application/json";
const content = "application/x-www-form-urlencoded";

class UploadProductCalls {
  static Future<http.StreamedResponse?> sendProd(UploadProduct data) async {
    http.StreamedResponse? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);

    final filePhotoName = basename(data.image!.path);

    var request =
        http.MultipartRequest("POST", Uri.parse(Network.uploadProduct));
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: header,
      "Content-Type": content,
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    var file = await http.MultipartFile.fromPath(
        'product_image', data.image!.path,
        filename: filePhotoName);

    request.headers.addAll(headers);

    request.fields["name"] = data.name!.toString();
    request.fields["description"] = data.description!.toString();
    request.fields["price"] = data.price!.toString();
    request.fields["is_available"] = data.isAvailable!.toString();
    request.fields["quantity_available"] = data.qty!.toString();
    request.fields["vendor_id"] = data.vendorId!.toString();
    request.fields["sub_category_id"] = data.subCategoryId!.toString();

    request.files.add(file);
    try {
      response = await request.send();
    } catch (e) {
      log(e.toString());
      response = null;
    }
    return response;
  }

  static Future<http.Response?> updateProd(UploadProduct data, id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    var map = {
      "name": "${data.name}",
      "description": "${data.description}",
      "price": "${data.price}",
      "is_available": "${data.isAvailable}",
      "quantity_available": "${data.qty}",
      "vendor_id": "${data.vendorId}",
      "sub_category_id": "${data.subCategoryId}",
    };

    try {
      response = await http
          .put(Uri.parse("${Network.updateProd}$id"),
              headers: {
                HttpHeaders.contentTypeHeader: header,
                "Content-Type": content,
                HttpHeaders.authorizationHeader: "Bearer $token",
              },
              body: jsonEncode(map))
          .timeout(const Duration(seconds: 30));

      seeError(response.body);
    } catch (e) {
      response = null;
      seeError(e);
    }
    return response;
  }

  static Future<http.Response?> deleteProd(String id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);

    try {
      response = await http.delete(
        Uri.parse(Network.deleteProd + id),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 30));

      seeError(response.body);
    } catch (e) {
      response = null;
      seeError(e);
    }
    return response;
  }

  static Future<http.Response?> addProdVariety(UploadVariety data) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    var map = {
      "title": "${data.title}",
      "product_id": "${data.id}",
    };

    try {
      response = await http
          .post(Uri.parse(Network.addProdVariety),
              headers: {
                HttpHeaders.contentTypeHeader: header,
                "Content-Type": content,
                HttpHeaders.authorizationHeader: "Bearer $token",
              },
              body: jsonEncode(map))
          .timeout(const Duration(seconds: 30));

      log(response.body);
    } catch (e) {
      response = null;
      seeError(e);
    }
    return response;
  }

  static Future<http.Response?> addVarietyOptions(
      UploadVariety data) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    var map = {
      "option": "${data.option}",
      "price": "${data.price}",
      "variety_id": "${data.id}",
    };

    try {
      response = await http
          .post(Uri.parse(Network.addVarietyOption),
              headers: {
                HttpHeaders.contentTypeHeader: header,
                "Content-Type": content,
                HttpHeaders.authorizationHeader: "Bearer $token",
              },
              body: jsonEncode(map))
          .timeout(const Duration(seconds: 30));

      seeError(response.body);
    } catch (e) {
      response = null;
      seeError(e);
    }
    return response;
  }
}
