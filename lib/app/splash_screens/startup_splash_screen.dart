import 'package:benji_vendor/src/controller/auth_controller.dart';
import 'package:benji_vendor/src/controller/category_controller.dart';
import 'package:benji_vendor/src/controller/form_controller.dart';
import 'package:benji_vendor/src/controller/latlng_detail_controller.dart';
import 'package:benji_vendor/src/controller/login_controller.dart';
import 'package:benji_vendor/src/controller/notification_controller.dart';
import 'package:benji_vendor/src/controller/order_controller.dart';
import 'package:benji_vendor/src/controller/product_controller.dart';
import 'package:benji_vendor/src/controller/product_property_controller.dart';
import 'package:benji_vendor/src/controller/profile_controller.dart';
import 'package:benji_vendor/src/controller/reviews_controller.dart';
import 'package:benji_vendor/src/controller/user_controller.dart';
import 'package:benji_vendor/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../src/controller/payment_controller.dart';
import '../../src/controller/send_package_controller.dart';
import '../../src/providers/constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final user = Get.put(UserController());
  final category = Get.put(CategoryController());
  final login = Get.put(LoginController());
  final auth = Get.put(AuthController());
  final product = Get.put(ProductController());
  final order = Get.put(OrderController());

  final form = Get.put(FormController());
  final reviews = Get.put(ReviewsController());
  final latLngDetail = Get.put(LatLngDetailController());
  final profile = Get.put(ProfileController());
  final notify = Get.put(NotificationController());
  final package = Get.put(SendPackageController());
  final deliveryFee = Get.put(PaymentController());
  final productProperty = Get.put(ProductPropertyController());

  @override
  Widget build(BuildContext context) {
    order.setStatus();
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(kDefaultPadding),
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height / 4,
                      width: size.width / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/splash_screen/frame_1.png",
                          ),
                        ),
                      ),
                    ),
                    SpinKitThreeInOut(
                      color: kSecondaryColor,
                      size: 20,
                    ),
                    kSizedBox,
                    Text(
                      "VENDOR",
                      style: TextStyle(
                        color: kAccentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
