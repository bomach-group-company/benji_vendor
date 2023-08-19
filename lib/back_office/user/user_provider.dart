import 'dart:developer';
import 'package:benji_vendor/back_office/user/user_model.dart';
import 'package:benji_vendor/back_office/user/user_office.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  bool _loadUser = false;
  bool _loadUserDetails = false;
  UserModel user = UserModel();

  UserIdModel userId = UserIdModel();

  String _msg = "Incorrect Otp";

  bool get loadLogin => _loadUser;
  bool get loadRegister => _loadUserDetails;

  String get otpMsg => _msg;

  void isLoadUser(bool status) => {_loadUser = status, notifyListeners()};
  void isLoadUserDetail(bool status) =>
      {_loadUserDetails = status, notifyListeners()};

  Future<bool> userFromApi() async {
    late bool isSuccessful;
    try {
      http.Response? response = await UserCalls.getuser(userId.id!.toString())
          .whenComplete(() => log("user end-point call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        try {
          var jsonData = jsonDecode(response.body);
          var incoming = UserModel.fromJson(jsonData);
          user = incoming;
        } catch (e) {}
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }
    notifyListeners();
    return isSuccessful;
  }

  Future<bool> userIdFromApi() async {
    late bool isSuccessful;
    try {
      http.Response? response = await UserCalls.getuserId()
          .whenComplete(() => log("user end-point call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        try {
          var jsonData = jsonDecode(response.body);
          var incoming = UserIdModel.fromJson(jsonData);
          userId = incoming;
        } catch (e) {}
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }
    notifyListeners();
    return isSuccessful;
  }

  Future<bool> userDetailsFromApi(
    UpdateProfile data,
  ) async {
    late bool isSuccessful;
    try {
      http.StreamedResponse? response = await UserCalls.updateImage(data)
          .whenComplete(() => log("update user dp end-point call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        await userFromApi();

        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }
    notifyListeners();
    return isSuccessful;
  }
}
