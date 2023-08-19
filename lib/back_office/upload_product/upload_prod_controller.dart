import 'dart:io';

import 'package:benji_vendor/back_office/my_product/my_product_controller.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_model.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_provider.dart';
import 'package:benji_vendor/utility/allNavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app/others/successful_screen.dart';
import '../../reusable widgets/my fixed snackBar.dart';
import '../../utility/extras_provider.dart';
import '../category/category_provider.dart';
import '../user/user_provider.dart';

class UploadProductController {
  static Future sendProd(context, name, desc, price, qty) async {
    UserProvider user = Provider.of<UserProvider>(context, listen: false);

    CategoryProvider types =
        Provider.of<CategoryProvider>(context, listen: false);
    ExtraProvider extra = Provider.of<ExtraProvider>(context, listen: false);

    SendProductProvider action =
        Provider.of<SendProductProvider>(context, listen: false);

    UploadProduct data = UploadProduct(
        vendorId: user.userId.id,
        description: desc,
        name: name,
        subCategoryId: types.subCatIdSelected,
        price: price,
        qty: qty,
        catId: types.name.split("|").last,
        image: extra.addedItem,
        isAvailable: true);

    action.isLoad(true);

    bool isDone = await action.registerProdFromApi(data);

    if (isDone) {
      await MyProductController.myProd(context);
      extra.resetCat();
      action.isLoad(false);
      PageRouting.removePreviousToPage(
        context,
        const SuccessfulScreen(
          text: "Product added successfully",
          elevatedButtonTitle: "Okay",
        ),
      );
    } else {
      action.isLoad(false);
      myFixedSnackBar(
          context, "Failed to add item", Colors.red, Duration(seconds: 2));
    }
    action.isLoad(false);
  }

  static Future updateProd(context, name, desc, price, qty, id, proId) async {
    UserProvider user = Provider.of<UserProvider>(context, listen: false);

    SendProductProvider action =
        Provider.of<SendProductProvider>(context, listen: false);
    CategoryProvider types =
        Provider.of<CategoryProvider>(context, listen: false);
    // print(
    //   proId,
    // );

    UploadProduct data = UploadProduct(
        vendorId: user.userId.id,
        description: desc ?? "",
        name: name ?? "",
        subCategoryId: types.subCatIdSelected,
        price: price ?? "",
        qty: qty ?? "",
        catId: "",
        image: null,
        isAvailable: true);

    action.isLoadUpdate(true);

    bool isDone = await action.updateProdFromApi(data, proId);

    if (isDone) {
      await MyProductController.myProd(context);

      action.isLoadUpdate(false);
      PageRouting.removePreviousToPage(
        context,
        const SuccessfulScreen(
          text: "Product updated successfully",
          elevatedButtonTitle: "Okay",
        ),
      );
    } else {
      action.isLoadUpdate(false);
      myFixedSnackBar(
          context, "Failed to update item", Colors.red, Duration(seconds: 2));
    }
    action.isLoadUpdate(false);
  }

  static Future delProd(context, String proID) async {
    SendProductProvider action =
        Provider.of<SendProductProvider>(context, listen: false);

    action.isLoadPack(true);

    bool isDone = await action.delProdFromApi(proID);

    if (isDone) {
      await MyProductController.myProd(context);

      action.isLoadPack(false);
      PageRouting.popToPage(context);
    } else {
      action.isLoadPack(false);
      myFixedSnackBar(
          context, "Failed to delete item", Colors.red, Duration(seconds: 2));
    }
    action.isLoadPack(false);
  }

  static Future updateVariety(context, title, id) async {
    SendProductProvider action =
        Provider.of<SendProductProvider>(context, listen: false);

    UploadVariety data = UploadVariety(
      id: id,
      option: "",
      title: title ?? "",
      price: "",
    );

    action.isLoadVariety(true);

    bool isDone = await action.addProdVarietyFromApi(data);

    if (isDone) {
      //  await MyProductController.myProd(context);

      action.isLoadVariety(false);
      PageRouting.removePreviousToPage(
        context,
        const SuccessfulScreen(
          text: "Variety updated successfully",
          elevatedButtonTitle: "Okay",
        ),
      );
    } else {
      action.isLoadVariety(false);
      myFixedSnackBar(context, "Failed to update variety", Colors.red,
          Duration(seconds: 2));
    }
    action.isLoadVariety(false);
  }

  static Future updateOption(context, option, price, id) async {
    SendProductProvider action =
        Provider.of<SendProductProvider>(context, listen: false);

    UploadVariety data = UploadVariety(
      id: id,
      option: option,
      title: "",
      price: price,
    );

    action.isLoadOption(true);

    bool isDone = await action.addVarietyOptionsFromApi(data);

    if (isDone) {
      //  await MyProductController.myProd(context);

      action.isLoadOption(false);
      PageRouting.removePreviousToPage(
        context,
        const SuccessfulScreen(
          text: "Option added successfully",
          elevatedButtonTitle: "Okay",
        ),
      );
    } else {
      action.isLoadOption(false);
      myFixedSnackBar(
          context, "Failed to add option", Colors.red, Duration(seconds: 2));
    }
    action.isLoadOption(false);
  }
}
