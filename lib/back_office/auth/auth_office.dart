import 'dart:developer';
import 'dart:io';
import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../networks/network.dart';
import '../temps/keys.dart';
import 'auth_model.dart';

class AuthCalls {
  static Future<http.Response?> regIndividualUser(RegIndividual data) async {
    http.Response? response;

    try {
      response = await http.post(Uri.parse(Network.regVendor), headers: {
        HttpHeaders.contentTypeHeader: header,
        "Content-Type": content,
      }, body: {
        "first_name": data.firstName,
        "last_name": data.lastName,
        "email": data.email,
        "gender": data.gender,
        "address": data.address,
        "password": data.password,
        "phone": data.phone,
        "username": data.username,
        "shop_name": data.shopName,
      }).timeout(const Duration(seconds: 30));

      seeError(response.body);
    } catch (e) {
      response = null;
      seeError(e);
    }
    return response;
  }

  static Future<http.Response?> getTokenFromBackend() async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      response = await http.post(Uri.parse(Network.getTokenUrl), headers: {
        HttpHeaders.contentTypeHeader: header,
        "Content-Type": content,
      }, body: {
        "username": pref.getString(emailKey),
        "password": pref.getString(passwordKey),
      });

      log(response.body.toString());
    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }

  static Future<http.Response?> getLogOutFromBackend() async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    try {
      response = await http.post(
        Uri.parse(Network.logout),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );

    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }

  static Future<http.Response?> getForgetPassFromBackend(
      email, password, pass) async {
    http.Response? response;

    try {
      // response = await http.post(
      //   Uri.parse(Network.FORGET_PASS),
      //   headers: {
      //     HttpHeaders.contentTypeHeader: header,
      //     "Content-Type": content,
      //   },
      // );
    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }
}
