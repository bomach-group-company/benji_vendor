import 'package:benji_vendor/app/others/user%20reviews.dart';
<<<<<<< HEAD
import 'package:benji_vendor/back_office/order/order_provider.dart';
import 'package:benji_vendor/providers/constants.dart';
import 'package:benji_vendor/screens/login.dart';
import 'package:benji_vendor/utility/operations.dart';
=======
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/auth/auth_controller.dart';
import '../../back_office/user/user_provider.dart';
=======
import '../../src/common_widgets/profile first half.dart';
import '../../src/providers/constants.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import '../../theme/colors.dart';
import '../screens/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    UserProvider user = context.watch<UserProvider>();
    MyOrderProvider orders = context.watch<MyOrderProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        title: const Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding,
          ),
          child: Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ProfileFirstHalf(
              availableBalance: Operations.convertToCurrency(
                  user.user.balance == null
                      ? "0"
                      : user.user.balance.toString()),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding,
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding / 1.5,
              ),
              child: Container(
                width: 327,
                height: 190,
                padding: const EdgeInsets.all(
                  kDefaultPadding / 2,
                ),
                decoration: ShapeDecoration(
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(
                        0x0F000000,
                      ),
                      blurRadius: 24,
                      offset: Offset(
                        0,
                        4,
                      ),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.person_outlined,
                        color: kAccentColor,
                      ),
                      title: const Text(
                        'Personal Info',
                        style: TextStyle(
                          color: Color(
                            0xFF333333,
                          ),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.business_rounded,
                        color: kAccentColor,
                      ),
                      title: const Text(
                        'Shop Info',
                        style: TextStyle(
                          color: Color(
                            0xFF333333,
                          ),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.settings_rounded,
                        color: kAccentColor,
                      ),
                      title: const Text(
                        'Settings',
                        style: TextStyle(
                          color: Color(
                            0xFF333333,
                          ),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding / 1.5,
              ),
              child: Container(
                width: 327,
                height: 141,
                padding: const EdgeInsets.all(
                  kDefaultPadding / 2,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(
                        0x0F000000,
                      ),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.payment_rounded,
                        color: kAccentColor,
                      ),
                      title: const Text(
                        'Withdrawal History',
                        style: TextStyle(
                          color: Color(
                            0xFF333333,
                          ),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.receipt_long_outlined,
                        color: kAccentColor,
                      ),
                      title: const Text(
                        'Number of Orders',
                        style: TextStyle(
                          color: Color(
                            0xFF333333,
                          ),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Text(
                        Operations.convertToCurrency(
                            orders.myOrders.length.toString()),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(
                            0xFF9B9BA5,
                          ),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding / 1.5,
              ),
              child: Container(
                width: 327,
                height: 78,
                padding: const EdgeInsets.all(
                  kDefaultPadding / 2,
                ),
                decoration: ShapeDecoration(
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UserReviews(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.keyboard_command_key_rounded,
                    color: kAccentColor,
                  ),
                  title: const Text(
                    'User Reviews',
                    style: TextStyle(
                      color: Color(
                        0xFF333333,
                      ),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding / 1.5,
              ),
              child: Container(
                width: 327,
                height: 78,
                padding: const EdgeInsets.all(
                  kDefaultPadding / 2,
                ),
                decoration: ShapeDecoration(
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ListTile(
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 10.0,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 3),
                      content: Row(
                        children: [
                          Container(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Text(
                                "Sure you want to log out?",
                              ))
                        ],
                      ),
                      backgroundColor: kAccentColor.withOpacity(.6),
                      action: SnackBarAction(
                          label: "Yes",
                          textColor: Colors.white,
                          onPressed: () async {
                            await AuthIndividualController.logOutUser(context);
                          }),
                    ));

                    // Navigator.of(context).pushAndRemoveUntil(
                    //   MaterialPageRoute(
                    //     builder: (context) => const Login(),
                    //   ),
                    //   (route) => false,
                    // );
                  },
                  leading: Icon(
                    Icons.logout_rounded,
                    color: kAccentColor,
                  ),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Color(
                        0xFF333333,
                      ),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
