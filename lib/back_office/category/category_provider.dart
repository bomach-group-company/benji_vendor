import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import 'category_model.dart';
import 'category_office.dart';

class CategoryProvider extends ChangeNotifier {
  bool _loadCat = false;
  String catId = "";
  String name = "Select Category";

  List<int> typeIds = [];
  List<String> typeNames = [];
  List<CategoryModel> category = [];
  List<SubCategoryModel> subCategory = [];

  String? subCatSelected = "Select";
  String? subCatIdSelected = "";

  bool get loadLogin => _loadCat;

  void clearFields() {
    subCatIdSelected = "";
    subCatSelected = "Select";
    name = "Select Category";
    notifyListeners();
  }

  Future<void> isLoadCat(bool status) async {
    _loadCat = status;
    notifyListeners();
  }

  void addSubCat(String val) {
    subCatSelected = val.split("|").first;
    subCatIdSelected = val.split("|").last;
  }

  void addCategory(String cat) {
    name = cat;

    notifyListeners();
  }

  void addCatId(val) {
    catId = val;
    notifyListeners();
  }

  Future<bool> catFromApi() async {
    late bool isSuccessful;
    try {
      http.Response? response = await CategoryCalls.getCategory()
          .whenComplete(() => log(" category call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var incoming = categoryModelFromJson(response.body);
        category = incoming;

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

  Future<bool> subCatFromApi() async {
    late bool isSuccessful;
    try {
      http.Response? response = await CategoryCalls.getSubCategory()
          .whenComplete(() => log("sub category call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var incoming = subCategoryModelFromJson(response.body);
        subCategory = incoming;

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
}
