import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../temps/keys.dart';
import 'auth_model.dart';
import 'auth_office.dart';

class AuthProvider extends ChangeNotifier {
  bool _loadLogin = false;
  bool _loadRegister = false;
  bool _loadOtp = false;

  bool _registerBusiness = false;
  bool _forgetPass = false;

  String _otpMsg = "Incorrect Otp";
  String regMsg = "Something went wrong";
  String individualRegErrorMsg = "Something went wrong";

  bool get loadLogin => _loadLogin;
  bool get loadRegister => _loadRegister;
  bool get loadOtp => _loadOtp;
  bool get loadForget => _forgetPass;
  String get otpMsg => _otpMsg;
  bool get regbusiness => _registerBusiness;

  void isLoadOtp(bool status) => {_loadOtp = status, notifyListeners()};
  void isLoadLogin(bool status) => {_loadLogin = status, notifyListeners()};
  void isLoadForget(bool status) => {_forgetPass = status, notifyListeners()};
  void isLoadRegBusiness(bool status) =>
      {_registerBusiness = status, notifyListeners()};

  void isLoadRegister(bool status) =>
      {_loadRegister = status, notifyListeners()};

  Future<bool> registerIndividualFromApi(RegIndividual data) async {
    late bool isSuccessful;
    try {
      http.Response? response = await AuthCalls.regIndividualUser(data)
          .whenComplete(() => log("successfully"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        log("200");

        try {
          individualRegErrorMsg = jsonData["detail"][0]["msg"];
        } catch (e) {
          individualRegErrorMsg = "Something went wrong";
        }

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

  Future<bool> logoutUserFromApi() async {
    late bool isSuccessful;
    try {
      http.Response? response = await AuthCalls.getLogOutFromBackend()
          .whenComplete(() => log("logged out successfully"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        //  var jsonData = jsonDecode(response.body);

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

  Future<bool> forgetPassFromApi(email, password, pass) async {
    late bool isSuccessful;
    try {
      http.Response? response = await AuthCalls.getLogOutFromBackend()
          .whenComplete(() => log("logged out successfully"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        // var jsonData = jsonDecode(response.body);

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

  Future<bool> loginFromApi() async {
    late bool isSuccessful;
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      http.Response? response = await AuthCalls.getTokenFromBackend()
          .whenComplete(() => log("successfully"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["token"] == false) {
          isSuccessful = false;
        } else {
          await pref.setBool(isLoggedInKey, true);
          await pref.setString(tokenKey, jsonData["token"].toString());
          log(pref.getString(tokenKey).toString());
          isSuccessful = true;
        }
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
