import 'dart:developer';
import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:benji_vendor/back_office/ratings/rating_model.dart';
import 'package:benji_vendor/back_office/ratings/rating_office.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RatingProvider extends ChangeNotifier {
  bool _load = false;

  var averageRating = 0.0;

  List<VendorRatingModel> rating = [];

  bool get load => _load;

  Future<void> isLoad(bool status) async {
    _load = status;
    notifyListeners();
  }

  Future<bool> ratingFromApi(String id) async {
    late bool isSuccessful;
    try {
      http.Response? response = await RatingCall.getRating(id)
          .whenComplete(() => log("rating call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var incoming = vendorRatingModelFromJson(response.body);
        rating = incoming;

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

  Future<bool> averageFromApi(String id) async {
    late bool isSuccessful;
    try {
      http.Response? response = await RatingCall.getAverageRating(id)
          .whenComplete(() => log("average rating call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var incoming = response.body;
        try {
          averageRating = double.tryParse(incoming.toString())!;
        } catch (e) {
          seeError(e);
        }

        //  log(response.body);
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
