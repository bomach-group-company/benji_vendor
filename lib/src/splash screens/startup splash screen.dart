// ignore_for_file: camel_case_types, file_names

import 'package:benji_vendor/app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/colors.dart';
import '../providers/constants.dart';

class StartupSplashscreen extends StatefulWidget {
  static String routeName = "Startup Splash Screen";
  const StartupSplashscreen({super.key});

  @override
  State<StartupSplashscreen> createState() => _StartupSplashscreenState();
}

class _StartupSplashscreenState extends State<StartupSplashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignUp()),
          (route) => false);
    });
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
                      image:
                          AssetImage("assets/images/splash screen/frame-1.png"),
                    ),
                  ),
                ),
                kSizedBox,
                const Center(
                  child: Text(
                    "Vendor App",
                    style: TextStyle(color: kTextBlackColor),
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
