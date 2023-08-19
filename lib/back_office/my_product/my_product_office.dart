import 'dart:developer';
import 'dart:io';

import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../networks/network.dart';
import '../temps/keys.dart';

class MyProdCall {
  static Future<http.Response?> getMyProducts(String id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    //String tmp = "7";
    try {
      response = await http.get(
        Uri.parse("${Network.myProduct}$id/listMyProducts"),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 30));

      log(response.statusCode.toString());
    } catch (e) {
      response = null;
      seeError(e.toString());
    }
    return response;
  }

  static Future<http.Response?> getVariety(String id) async {
    print(id);
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    //String tmp = "7";
    
    try {
      response = await http.get(
        Uri.parse(Network.getProdVarietyList +"?product_id=$id"),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 30));

      log(response.body.toString());
    } catch (e) {
      response = null;
      seeError(e.toString());
    }
    return response;
  }

  static Future<http.Response?> getVOption(String id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    //String tmp = "7";
    try {
      response = await http.get(
        Uri.parse(Network.getVarietyOption + "?variety_id=$id"),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 30));

      log(response.body.toString());
    } catch (e) {
      response = null;
      seeError(e.toString());
    }
    return response;
  }
}
