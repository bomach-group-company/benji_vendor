import 'dart:developer';
import 'package:benji_vendor/back_office/user/user_model.dart';
import 'package:benji_vendor/back_office/user/user_provider.dart';
import 'package:provider/provider.dart';
import '../../utility/extras_provider.dart';

class UserController {
  static Future getUser(context) async {
    UserProvider user = Provider.of<UserProvider>(context, listen: false);

    user.isLoadUser(true);

    bool isDone =
        await user.userFromApi().whenComplete(() => log("User gotten"));

    if (isDone) {
      user.isLoadUser(false);
    } else {
      user.isLoadUser(false);
    }

    user.isLoadUser(false);
  }

  static Future getUseriD(context) async {
    UserProvider user = Provider.of<UserProvider>(context, listen: false);

    user.isLoadUser(true);

    bool isDone =
        await user.userIdFromApi().whenComplete(() => getUser(context));

    if (isDone) {
      user.isLoadUser(false);
    } else {
      user.isLoadUser(false);
    }

    user.isLoadUser(false);
  }

  static Future updateDp(context) async {
    UserProvider user = Provider.of(context, listen: false);
    ExtraProvider extra = Provider.of(context, listen: false);

    UpdateProfile data =
        UpdateProfile(email: user.user.email, image: extra.addedDp);

    user.isLoadUserDetail(true);

    bool isDone = await user.userDetailsFromApi(data);

    if (isDone) {
      user.isLoadUserDetail(false);
    } else {
      user.isLoadUserDetail(false);
    }
    user.isLoadUserDetail(false);
  }
}
