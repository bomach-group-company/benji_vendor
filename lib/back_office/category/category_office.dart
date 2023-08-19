
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../networks/network.dart';
import '../temps/keys.dart';


class CategoryCalls {
  static Future<http.Response?> getCategory() async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    try {
      response = await http.get(
        Uri.parse(Network.categories),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 30));

      log(response.body.toString());
    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }

  static Future<http.Response?> getSubCategory() async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    try {
      response = await http.get(
        Uri.parse(Network.subCategories),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 30));

      log(response.body.toString());
    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }

}
