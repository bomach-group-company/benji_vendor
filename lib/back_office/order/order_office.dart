import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../networks/network.dart';
import '../temps/keys.dart';

class OrderCalls {
  static Future<http.Response?> getMyOrders(String id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);

    try {
      response = await http.get(
        Uri.parse("${Network.myOrders}$id/listMyOrders"),
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

  static Future<http.Response?> cancelOrder(id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    var map = {"order_id": "$id"};

    try {
      response = await http
          .put(Uri.parse(Network.cancelOrder),
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

  static Future<http.Response?> acceptOrder(id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? token = pref.getString(tokenKey);
    var map = {"order_id": "$id"};
    print(map);

    try {
      response = await http
          .put(Uri.parse(Network.acceptOrder),
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

  static Future<http.Response?> declineOrder(id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    var map = {"order_id": "$id"};

    try {
      response = await http
          .put(Uri.parse(Network.declineOrder),
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
