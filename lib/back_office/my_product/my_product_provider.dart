import 'dart:convert';
import 'dart:developer';

import 'package:benji_vendor/back_office/my_product/my_product_model.dart';
import 'package:benji_vendor/back_office/my_product/my_product_office.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class MyProductProvider extends ChangeNotifier {
  bool _loadProd = false;

  bool loadV = false;
  bool loadO = false;

  List<MyProductsModel> myProd = [];
  List<ProductVarietyModel> myProdVariety = [];
  List<VarietyoptionModel> myVarietyOption = [];
  List<String> myShopCat = ["All"];
  String selectedItemCat = "";

  bool get loadLogin => _loadProd;

  Future<void> isLoadProduct(bool status) async {
    _loadProd = status;
    notifyListeners();
  }

  Future<void> isLoadVariety(bool status) async {
    loadV = status;
    notifyListeners();
  }

  Future<void> isLoadOption(bool status) async {
    loadO = status;
    notifyListeners();
  }

  void addSelectedCat(String s) {
    selectedItemCat = s;
    notifyListeners();
  }

  Future<bool> myProductFromApi(String id) async {
    late bool isSuccessful;
    try {
      http.Response? response = await MyProdCall.getMyProducts(id)
          .whenComplete(() => log("individual category call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        //  var data = jsonDecode(response.body);

        try {
          var incoming = myProductsModelFromJson(response.body);
          myProd = incoming;

          await Future.forEach(myProd, (element) async {
            if (myShopCat.contains(element.subCategoryId!.name!)) {
            } else {
              myShopCat.add(element.subCategoryId!.name!);
            }
          });
        } catch (e) {
          // log(e.toString());
        }

        //   log(response.body);
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

  Future<bool> myProductVarietyFromApi(String id) async {
    late bool isSuccessful;
    try {
      http.Response? response = await MyProdCall.getVariety(id)
          .whenComplete(() => log(" call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        //  var data = jsonDecode(response.body);

        try {
          var incoming = productVarietyModelFromJson(response.body);
          myProdVariety = incoming;
        } catch (e) {
          // log(e.toString());
        }

        //   log(response.body);
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

  Future<bool> myVarietyOptionFromApi(String id) async {
    late bool isSuccessful;
    try {
      http.Response? response = await MyProdCall.getVOption(id)
          .whenComplete(() => log(" call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        //  var data = jsonDecode(response.body);

        try {
          var incoming = varietyoptionModelFromJson(response.body);
          myVarietyOption = incoming;
        } catch (e) {
          // log(e.toString());
        }

        //   log(response.body);
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
