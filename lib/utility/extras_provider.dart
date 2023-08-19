import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ExtraProvider extends ChangeNotifier {
  String userName = "";
  String phone = "";
  String searchName = "";
  String searchForPay = "";

  // List<SignUpOtions> signUpOption = [
  //   SignUpOtions(isTicked: false, text: "A Business", id: 0),
  //   SignUpOtions(isTicked: false, text: "An Individual", id: 1),
  // ];

  // List<ItemWeigth> itemWeight = [
  //   ItemWeigth(item: "50-199kg", selected: false, id: 0),
  //   ItemWeigth(item: "200-599kg", selected: false, id: 1),
  //   ItemWeigth(item: "600-1000kg", selected: false, id: 2),
  // ];

  List<String> genders = ["Male", "Female"];
  String selectedGender = "Select";
  String selectedBusineessType = "Select";
  int selectedBusineessId = 0;

  List<int> _trackTimeline = [0];
  int _sendPackageIndex = 0;

  List<int> _trackRegTimeline = [0];
  int _regTimelineIndex = 0;
  String catName = "Choose category";

  String catType = "Choose type";
  int payNav = 0;

  int _index = 0;
  int _navIndex = 0;
  String itemWeightId = "Choose item weight range";
  bool isRegistered = false;
  bool isInsured = false;
  File? addedDp;
  File? addedPackImage;
  File? addedItem;
  //Size get screenSize => _screenSize;
  int get index => _index;
  // List get signUpOptions => signUpOption;
  int get navIndex => _navIndex;
  int get sendPackageIndex => _sendPackageIndex;
  List get trackTimeline => _trackTimeline;
  int get regTimelineIndex => _regTimelineIndex;
  List get trackRegTimeline => _trackRegTimeline;

  void changePayNav(int n) {
    payNav = n;
    notifyListeners();
  }

  void resetImage() {
    addedItem = null;
    notifyListeners();
  }

  Future<void> search(String data) async {
    searchName = data;
    notifyListeners();
  }

  Future<void> searchPay(String data) async {
    searchForPay = data;
    notifyListeners();
  }

  void addImage(XFile photo) {
    addedDp = File(photo.path);
    notifyListeners();
  }

  void addPackImage(XFile photo) {
    addedPackImage = File(photo.path);
    notifyListeners();
  }

  Future<void> addItemImage(XFile photo) async {
    addedItem = File(photo.path);
    notifyListeners();
  }

  Future<void> removePackImage() async {
    addedPackImage = null;
    notifyListeners();
  }

  void resetCat() {
    catName = "Choose category";
    catType = "Choose type";
    notifyListeners();
  }

  void addUsername(String name) {
    userName = name;
    notifyListeners();
  }

  void addCatName(String title) {
    catName = title;
    notifyListeners();
  }

  void addCatTypeName(String title) {
    catType = title;
    notifyListeners();
  }

  void addIsReg(bool val) {
    isRegistered = val;
    notifyListeners();
  }

  void addIsInsured(bool val) {
    isInsured = val;
    notifyListeners();
  }

  void addWeight(String title) {
    itemWeightId = title;
    notifyListeners();
  }

  void addPhone(String userNumber) {
    phone = userNumber;
    notifyListeners();
  }

  void changeSendPackageIndex(int added) {
    // _trackTimeline.clear();
    _sendPackageIndex = added;

    List<int> data =
        _trackTimeline.where((element) => element == added).toList();
    if (data.isEmpty) {
      _trackTimeline.add(added);
    } else {
      _trackRegTimeline.removeWhere((element) => element == added);
      _trackTimeline.add(added);
    }

    // if (_trackTimeline.length > 4) {
    //   _trackTimeline.clear();
    //   _trackTimeline.add(0);
    // }

    notifyListeners();
  }

  void resetTimelineIndex(int addedIndex) {
    _trackTimeline.clear();
    _trackTimeline.add(addedIndex);

    notifyListeners();
  }

  void changeRegTimelineIndex(int added) {
    // _trackTimeline.clear();
    _regTimelineIndex = added;
    _trackRegTimeline.add(added);
    // if (_trackTimeline.length > 4) {
    //   _trackRegTimeline.clear();
    //   _trackRegTimeline.add(0);
    // }

    notifyListeners();
  }

  void resetRegTimelineIndex(int addedIndex) {
    _trackRegTimeline.clear();
    _trackRegTimeline.add(addedIndex);

    notifyListeners();
  }

  void changeNavIndex(int dex) {
    _navIndex = dex;
    notifyListeners();
  }

  void nextCarousel() {
    if (_index >= 2) {
      return;
    }
    _index++;
    notifyListeners();
  }

  void previousCarousel() {
    if (_index <= 0) {
      return;
    }
    _index--;
    notifyListeners();
  }

  // void selectSignupOptions(int id, bool tick) {
  //   SignUpOtions isSelect =
  //       signUpOption.where((element) => element.id == id).single;
  //   SignUpOtions notSelect =
  //       signUpOption.where((element) => element.id != id).single;

  //   if (tick) {
  //     isSelect.isTicked = tick;
  //     notSelect.isTicked = false;
  //   } else {
  //     notSelect.isTicked = tick;
  //     isSelect.isTicked = false;
  //   }

  //   notifyListeners();
  // }

  void selectGender(String data) {
    selectedGender = data;
    notifyListeners();
  }

  void selectBusinessType(String data, int id) {
    selectedBusineessType = data;
    selectedBusineessId = id;
    notifyListeners();
  }

//   void selectWeight(int id, bool tick) {
//     ItemWeigth isSelect =
//         itemWeight.where((element) => element.id == id).single;
//     List<ItemWeigth> notSelect =
//         itemWeight.where((element) => element.id != id).toList();

//     if (tick) {
//       isSelect.selected = tick;
//       notSelect.forEach((element) {
//         element.selected = false;
//       });
//     } else {
//       notSelect.forEach((element) {
//         element.selected = tick;
//       });
//       isSelect.selected = false;
//     }

//     notifyListeners();
//   }
}
