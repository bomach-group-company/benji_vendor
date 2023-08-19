import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../networks/network.dart';
import '../temps/keys.dart';

class NotificationCalls {
  static Future<http.Response?> getNotification(String id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    try {
      response = await http.get(
        Uri.parse("${Network.notification}$id/getVendorNotifications"),
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
