
import 'dart:developer';
import 'dart:io';
import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:benji_vendor/back_office/temps/keys.dart';
import 'package:benji_vendor/back_office/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networks/network.dart';

class UserCalls {
  static Future<http.Response?> getuser(String id) async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    try {
      response = await http.get(
        Uri.parse(Network.user + id),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );

      log(response.body.toString());
    } catch (e) {
      response = null;
      seeError(e.toString());
    }
    return response;
  }


  static Future<http.Response?> getuserId() async {
    http.Response? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    try {
      response = await http.get(
        Uri.parse(Network.userId),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          "Content-Type": content,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );

      log(response.body.toString());
    } catch (e) {
      response = null;
      seeError(e.toString());
    }
    return response;
  }

  static Future<http.StreamedResponse?> updateImage(UpdateProfile data) async {
    http.StreamedResponse? response;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);

    final filePhotoName = basename(data.image!.path);

    var request = http.MultipartRequest(
        "POST", Uri.parse(""));
    Map<String, String> headers = {
      'Accept': 'application/json',
      "Content-Type": content,
      'authorization': 'Bearer $token',
    };

    var file = await http.MultipartFile.fromPath('files', data.image!.path,
        filename: filePhotoName);

    request.headers.addAll(headers);

    request.files.add(file);
    try {
      response = await request.send();
 
    } catch (e) {
      log(e.toString());
      response = null;
    }
    return response;
  }
}
