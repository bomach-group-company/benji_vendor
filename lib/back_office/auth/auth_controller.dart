import 'dart:developer';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../app/overview.dart';
import '../../main.dart';
import '../../reusable widgets/my fixed snackBar.dart';
import '../../reusable widgets/toast.dart';
import '../../screens/login.dart';
import '../../splash screens/signup splash screen.dart';
import '../../theme/colors.dart';
import '../../utility/allNavigation.dart';
import '../temps/keys.dart';
import '../user/user_controller.dart';
import 'auth_model.dart';
import 'auth_provider.dart';

class AuthIndividualController {
  static Future<void> loginUser(context, bool fromLoginScreen) async {
    AuthProvider action = Provider.of(context, listen: false);

    action.isLoadLogin(true);

    bool isDone = await action
        .loginFromApi()
        .whenComplete(() => UserController.getUseriD(context));
    await UserController.getUseriD(context);

    if (isDone) {
      //  PageRouting.removeAllToPage(context, const IndividualHomeScreen());
      action.isLoadLogin(false);
      if (fromLoginScreen) {
        // myFixedSnackBar(
        //   context,
        //   "Login Successful".toUpperCase(),
        //   kSuccessColor,
        //   const Duration(
        //     seconds: 2,
        //   ),
        // );
        PageRouting.removeAllToPage(context, const OverView());
      }
    } else {
      inAppToast(context, "Cannot log you in at the moment", isError: true);

      PageRouting.removeAllToPage(context, const Login());
      action.isLoadLogin(false);
    }
  }

  static Future<void> registerIndividual(
      context, username, shopName, address, phone) async {
    AuthProvider action = Provider.of(context, listen: false);
    SharedPreferences pref = await SharedPreferences.getInstance();
    RegIndividual regIndividual = RegIndividual(
      firstName: pref.getString(firstNameKey),
      lastName: pref.getString(lastNameKey),
      email: pref.getString(emailKey),
      address: address,
      gender: "",
      username: username,
      shopName: shopName,
      phone: phone,
      password: pref.getString(passwordKey),
    );
    action.isLoadRegister(true);

    bool isDone = await action
        .registerIndividualFromApi(regIndividual)
        .whenComplete(() => loginUser(context, false));

    if (isDone) {
      action.isLoadRegister(false);
      myFixedSnackBar(
        context,
        "Signup Successful".toUpperCase(),
        kSuccessColor,
        const Duration(
          seconds: 2,
        ),
      );

      PageRouting.pushToPage(context, const SignUpSplashScreen());
    } else {
      action.isLoadRegister(false);
      inAppToast(context, action.individualRegErrorMsg, isError: true);
    }
  }

  // static Future<void> verify(context, String otp) async {
  //   AuthProvider action = Provider.of(context, listen: false);
  //   UserProvider user = Provider.of(context, listen: false);
  //   action.isLoadOtp(true);

  //   bool isDone = await action
  //       .verifyOtpFromApi(otp)
  //       .whenComplete(() => print("provider network calls completed"));

  //   if (isDone) {
  //     bool login = await action
  //         .loginFromApi()
  //         .whenComplete(() => UserController.getUser(context));
  //     await UserController.getUser(context);
  //     if (login) {
  //       action.isLoadOtp(false);
  //       inAppToast(context, action.otpMsg);
  //       if (user.user.accountType == "business") {
  //         PageRouting.removeAllToPage(context, const BusinessHomeScreen());
  //       } else {
  //         PageRouting.removeAllToPage(context, const IndividualHomeScreen());
  //       }
  //     } else {
  //       action.isLoadOtp(false);
  //       inAppToast(context, "Something went wrong", isError: true);
  //     }
  //   } else {
  //     inAppToast(context, "OTP verification ${action.otpMsg}", isError: true);
  //     action.isLoadOtp(false);
  //   }
  // }

  static Future saveUserInfo(context, String firstName, String lastName,
      String email, String password, username, shopName, address, phone) async {
    // ExtraProvider action = Provider.of(context, listen: false);
    // action.addUsername("$lastName $firstName");
    // action.addPhone(phone);
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(firstNameKey, firstName);
    await pref.setString(emailKey, email);
    await pref.setString(lastNameKey, lastName);
    await pref.setString(passwordKey, password);
    await registerIndividual(context, username, shopName, address, phone);
  }

  static Future saveLoginInfo(context, String email, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(passwordKey, password);
    await pref.setString(emailKey, email);

    await loginUser(context, true);
  }

  static Future saveRegion(String address, String country, String state,
      String city, String busStop, String bvn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(deliveryAdressKey, address);
    await pref.setString(countryKey, country);
    await pref.setString(stateKey, state);
    await pref.setString(cityKey, city);
    await pref.setString(busStopKey, busStop);
    await pref.setString(bvnKey, bvn);
  }

  static Future savePassword(
      context, String password, bool isIndividual) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(passwordKey, password);

    //  if (isIndividual) await registerIndividual(context);
  }

  static logOutUser(context) async {
    AuthProvider action = Provider.of(context, listen: false);
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool isDone = await action
        .logoutUserFromApi()
        .whenComplete(() => log("We have logged out successfully"));

    if (isDone) {
      await pref.clear().whenComplete(
          () => PageRouting.removeAllToPage(context, const MyApp()));
      // Restart.restartApp();
    } else {
      inAppToast(context, "LogOut failed", isError: true);
    }
  }

  static forgetPassword(context, email, password, pass) async {
    AuthProvider action = Provider.of(context, listen: false);

    action.isLoadForget(true);

    bool isDone = await action
        .forgetPassFromApi(email, password, pass)
        .whenComplete(() => log("We have updated your password successfully"));

    if (isDone) {
      action.isLoadForget(false);
      inAppToast(context, "Password updated successfully ", isError: false);
      PageRouting.popToPage(context);
    } else {
      action.isLoadForget(false);
      inAppToast(context, "Operation Failed. Please try again", isError: true);
    }
    action.isLoadForget(false);
  }
}
