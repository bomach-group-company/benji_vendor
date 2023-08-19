// ignore_for_file: camel_case_types, file_names

import 'package:benji_vendor/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../back_office/auth/auth_controller.dart';
import '../providers/constants.dart';
import '../theme/colors.dart';
import '../utility/operations.dart';

class StartupSplashscreen extends StatefulWidget {
  static String routeName = "Startup Splash Screen";
  const StartupSplashscreen({super.key});

  @override
  State<StartupSplashscreen> createState() => _StartupSplashscreenState();
}

class _StartupSplashscreenState extends State<StartupSplashscreen> {
  static Future delayScreen(BuildContext context) async {
    bool isFirstCheck = await Operations.isFirstTimeOnApp();
    bool isLoggedInBefore = await Operations.isLoggedIn();
    if (isLoggedInBefore) {
      // ignore: use_build_context_synchronously
      AuthIndividualController.loginUser(context, true);
    } else {
      // ignore: use_build_context_synchronously
      Operations.delayScreen(
          context, isFirstCheck ? const Login() : const Login());
    }
  }

  @override
  void initState() {
    super.initState();
    delayScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //     const Duration(
    //       seconds: 4,
    //     ), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (ctx) => const Login(),
    //     ),
    //   );
    // });
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/splash screen/frame-1.png",
                      ),
                    ),
                  ),
                ),
                kSizedBox,
                const Center(
                  child: Text(
                    "Vendor App",
                    style: TextStyle(
                      color: kTextBlackColor,
                    ),
                  ),
                ),
                kSizedBox,
                SpinKitThreeInOut(
                  color: kSecondaryColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
