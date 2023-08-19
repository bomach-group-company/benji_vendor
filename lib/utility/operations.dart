import 'package:benji_vendor/back_office/auth/auth_controller.dart';
import 'package:benji_vendor/back_office/category/category_provider.dart';
import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:benji_vendor/utility/extras_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../back_office/category/category_controller.dart';
import '../back_office/my_product/my_product_controller.dart';
import '../back_office/notification/notification_controller.dart';
import '../back_office/order/order_controller.dart';
import '../back_office/ratings/rating_controller.dart';
import '../back_office/temps/keys.dart';
import 'allNavigation.dart';

class Operations {
  static Future signUpPageOperations(context, firstName, lastName, email,
      password, username, shopName, address, phone) async {
    AuthIndividualController.saveUserInfo(context, firstName, lastName, email,
        password, username, shopName, address, phone);
  }

  static Future clearAddProductProvider(context) async {
    CategoryProvider action =
        Provider.of<CategoryProvider>(context, listen: false);
    ExtraProvider image = Provider.of<ExtraProvider>(context, listen: false);
    action.clearFields();
    image.resetImage();
  }

  static Future delayScreen(BuildContext context, Widget page) async {
    await Future.delayed(const Duration(seconds: 2), () {})
        .whenComplete(() => PageRouting.removeAllToPage(context, page));
  }

  static Future<bool> isFirstTimeOnApp() async {
    late bool isTrue;
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey(isFirst)) {
      isTrue = false;
    } else {
      isTrue = true;
    }

    return isTrue;
  }

  static Future<bool> isLoggedIn() async {
    late bool isTrue;
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey(isLoggedInKey)) {
      isTrue = true;
    } else {
      isTrue = false;
    }

    return isTrue;
  }

  static Future addItemImage(context) async {
    final ImagePicker picker = ImagePicker();
    late XFile? imageFile;
    ExtraProvider action = Provider.of<ExtraProvider>(context, listen: false);
    try {
      final XFile? file = await picker.pickImage(
          source: ImageSource.gallery,
          preferredCameraDevice: CameraDevice.rear);

      if (file != null) {
        imageFile = file;

        action.addItemImage(imageFile);
      }
    } catch (e) {
      seeError(e.toString());
    }
  }

  static String convertDate(DateTime date) {
    late String newDate;
    if (date.month == 1) {
      newDate = "Jan";
    } else if (date.month == 2) {
      newDate = "Feb";
    } else if (date.month == 3) {
      newDate = "Mar";
    } else if (date.month == 4) {
      newDate = "Apr";
    } else if (date.month == 5) {
      newDate = "May";
    } else if (date.month == 6) {
      newDate = "Jun";
    } else if (date.month == 7) {
      newDate = "Jul";
    } else if (date.month == 8) {
      newDate = "Aug";
    } else if (date.month == 9) {
      newDate = "Sep";
    } else if (date.month == 10) {
      newDate = "Oct";
    } else if (date.month == 11) {
      newDate = "Nov";
    } else if (date.month == 12) {
      newDate = "Dec";
    }

    return "$newDate ${date.day}, ${date.year} - ${date.hour}:${date.minute} ${date.hour > 12 ? "PM" : "AM"}";
  }

  static String convertToCurrency(String e) {
    String newStr = e.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[0]},");
    return newStr;
  }

  static Future readAll(context, [bool? isRefresh]) async {
    if (isRefresh == true) {
      CategoryController.contactCat(context);
      CategoryController.contactSubCat(context);
      await MyProductController.myProd(context);
      await MyOrderController.myOrder(context);
      NotificaionController.notify(context);
      await RatingController.vendorRating(context);
      await RatingController.averageRating(context);
    } else {
      CategoryController.contactCat(context);
      CategoryController.contactSubCat(context);
      MyProductController.myProd(context);
    
      MyOrderController.myOrder(context);
      NotificaionController.notify(context);
      RatingController.vendorRating(context);
      RatingController.averageRating(context);
    }
  }
}
