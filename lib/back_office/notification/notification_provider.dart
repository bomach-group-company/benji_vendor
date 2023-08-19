import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'notification_model.dart';
import 'notification_office.dart';

class NotificationProvider extends ChangeNotifier {
  bool _load = false;


  List<NotificationModel> notification = [];

  bool get load => _load;



  Future<void> isLoadCat(bool status) async {
    _load = status;
    notifyListeners();
  }

  Future<bool> notificationFromApi(String id ) async {
    late bool isSuccessful;
    try {
      http.Response? response = await NotificationCalls.getNotification(id)
          .whenComplete(() => log("notification call Done!!!"));
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var incoming = notificationModelFromJson(response.body);
        notification = incoming;

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
