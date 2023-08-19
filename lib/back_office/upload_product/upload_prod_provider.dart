import 'dart:async';
import 'dart:developer';

import 'package:benji_vendor/back_office/upload_product/upload_prod_model.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_office.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SendProductProvider extends ChangeNotifier {
  bool _load = false;
  bool _loadUpdate = false;
  bool _loadPack = false;
  bool loadV = false;
  bool loadO = false;

  String _msg = "";
  bool get loadPack => _loadPack;
  bool get load => _load;
  bool get loadUpdate => _loadUpdate;

  String get msg => _msg;
  Future<void> isLoadVariety(bool status) async {
    loadV = status;
    notifyListeners();
  }

  Future<void> isLoadOption(bool status) async {
    loadO = status;
    notifyListeners();
  }
  void isLoad(bool status) => {_load = status, notifyListeners()};
  void isLoadUpdate(bool status) => {_loadUpdate = status, notifyListeners()};
  void isLoadPack(bool status) => {_loadPack = status, notifyListeners()};

  Future<bool> registerProdFromApi(UploadProduct data) async {
    late bool isSuccessful;

    try {
      http.StreamedResponse? response = await UploadProductCalls.sendProd(data)
          .whenComplete(() => log("successfully"));

      if (response == null) {
        log("null");
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        log("here");
        final res = await http.Response.fromStream(response);
        //  var jsonData = jsonDecode(res.body);
        log(res.body);

        isSuccessful = true;
      } else {
        final res = await http.Response.fromStream(response);
        //  var jsonData = jsonDecode(res.body);
        log(res.body.toString());
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      debugPrint(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }

  Future<bool> updateProdFromApi(UploadProduct data, id) async {
    late bool isSuccessful;

    try {
      http.Response? response = await UploadProductCalls.updateProd(data, id)
          .whenComplete(() => log("successfully"));

      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      debugPrint(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }

  Future<bool> delProdFromApi(String id) async {
    late bool isSuccessful;

    try {
      http.Response? response = await UploadProductCalls.deleteProd(id)
          .whenComplete(() => log("del successfully"));

      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      debugPrint(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }

  Future<bool> addProdVarietyFromApi(UploadVariety data) async {
    late bool isSuccessful;

    try {
      http.Response? response = await UploadProductCalls.addProdVariety(data)
          .whenComplete(() => log("successfully"));

      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      debugPrint(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }

  Future<bool> addVarietyOptionsFromApi(UploadVariety data) async {
    late bool isSuccessful;

    try {
      http.Response? response = await UploadProductCalls.addVarietyOptions(data)
          .whenComplete(() => log("successfully"));

      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      debugPrint(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }
}
