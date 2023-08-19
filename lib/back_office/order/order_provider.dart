import 'dart:convert';
import 'dart:developer';

import 'package:benji_vendor/back_office/my_product/my_product_model.dart';
import 'package:benji_vendor/back_office/my_product/my_product_office.dart';
import 'package:benji_vendor/back_office/order/order_office.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import 'order_model.dart';

class MyOrderProvider extends ChangeNotifier {
  bool _loadProd = false;

  bool _loadAccept = false;
  bool _loadDecline = false;
  bool _loadCancel = false;

  List<MyOrderModel> myOrders = [];
  List<String> myShopCat = ["All"];
  String selectedItemCat = "";

  bool get loadLogin => _loadProd;
  bool get loadAccept => _loadAccept;
  bool get loadDecline => _loadDecline;
  bool get loadCancel => _loadCancel;

  Future<void> isLoadOrder(bool status) async {
    _loadProd = status;
    notifyListeners();
  }

  Future<void> isloadAccept(bool status) async {
    _loadAccept = status;
    notifyListeners();
  }

  Future<void> isloadDecline(bool status) async {
    _loadDecline = status;
    notifyListeners();
  }

  Future<void> isloadCancel(bool status) async {
    _loadCancel = status;
    notifyListeners();
  }

  void addSelectedCat(String s) {
    selectedItemCat = s;
    notifyListeners();
  }

  Future<bool> myOrderFromApi(String id) async {
    late bool isSuccessful;
    try {
      http.Response? response = await OrderCalls.getMyOrders(id)
          .whenComplete(() => log("order call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        //  var data = jsonDecode(response.body);

        try {
          var incoming = myOrderModelFromJson(response.body);
          myOrders = incoming;

          // await Future.forEach(myProd, (element) async {
          //   if (myShopCat.contains(element.subCategoryId!.name!)) {
          //   } else {
          //     myShopCat.add(element.subCategoryId!.name!);
          //   }
          // });
        } catch (e) {
           log(e.toString());
        }

        log(response.body);
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

  Future<bool> acceptOrderFromApi(id) async {
    late bool isSuccessful;

    try {
      http.Response? response = await OrderCalls.acceptOrder(id)
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

  Future<bool> cancelOrderFromApi(id) async {
    late bool isSuccessful;

    try {
      http.Response? response = await OrderCalls.cancelOrder(id)
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

  Future<bool> declineOrderFromApi(id) async {
    late bool isSuccessful;

    try {
      http.Response? response = await OrderCalls.declineOrder(id)
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
