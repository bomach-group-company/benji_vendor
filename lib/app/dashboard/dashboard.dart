// ignore_for_file: avoid_unnecessary_containers

import 'package:benji_vendor/app/others/user%20reviews.dart';
import 'package:flutter/material.dart';

import '../../src/common_widgets/home appBar vendor name.dart';
import '../../src/common_widgets/home orders container.dart';
import '../../src/common_widgets/home showModalBottomSheet.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
import '../others/notifications.dart';
import '../product/add new product.dart';
import '../profile/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

typedef ModalContentBuilder = Widget Function(BuildContext);

class _DashboardState extends State<Dashboard> {
//=================================== ALL VARIABLES =====================================\\

//=================================== DROP DOWN BUTTON =====================================\\

  String dropDownItemValue = "Daily";

  void dropDownOnChanged(String? newValue) {
    setState(() {
      dropDownItemValue = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddProduct(),
            ),
          );
        },
        elevation: 20.0,
        backgroundColor: kAccentColor,
        foregroundColor: kPrimaryColor,
        tooltip: "Add a product",
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        titleSpacing: kDefaultPadding / 2,
        elevation: 0.0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 2,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
                },
                child: CircleAvatar(
                  minRadius: 20,
                  backgroundColor: kSecondaryColor,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/profile/profile-picture.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const AppBarVendor(
              vendorName: "Ntachi-Osa",
              vendorLocation: "Independence Layout, Enugu",
            ),
          ],
        ),
        actions: [
          IconButton(
            iconSize: 20,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ),
              );
            },
            splashRadius: 20,
            icon: Icon(
              Icons.notifications_outlined,
              color: kAccentColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.all(
                kDefaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrdersContainer(
                    onTap: () {
                      OrdersContainerBottomSheet(
                        context,
                        "20 Running",
                        20,
                      );
                    },
                    numberOfOrders: "20",
                    typeOfOrders: "Active",
                  ),
                  OrdersContainer(
                    onTap: () {
                      OrdersContainerBottomSheet(
                        context,
                        "5 Pending",
                        5,
                      );
                    },
                    numberOfOrders: "05",
                    typeOfOrders: "Pending",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Revenue',
                          style: TextStyle(
                            color: Color(
                              0xFF32343E,
                            ),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "₦2,241",
                          style: TextStyle(
                            color: Color(
                              0xFF32343E,
                            ),
                            fontSize: 22,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.only(
                      top: 6.10,
                      left: 8.72,
                      right: 6.10,
                      bottom: 6.10,
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.44,
                          color: Color(
                            0xFFE8E9EC,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(
                          6.98,
                        ),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropDownItemValue,
                      onChanged: dropDownOnChanged,
                      elevation: 20,
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      underline: Container(
                        color: kTransparentColor,
                        height: 0,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                      iconEnabledColor: kAccentColor,
                      iconDisabledColor: kGreyColor2,
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Daily",
                          enabled: true,
                          child: Text(
                            "Daily",
                            style: TextStyle(
                              color: Color(
                                0xFF9B9BA5,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Weekly",
                          enabled: true,
                          child: Text(
                            "Weekly",
                            style: TextStyle(
                              color: Color(
                                0xFF9B9BA5,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Monthly",
                          enabled: true,
                          child: Text(
                            "Monthly",
                            style: TextStyle(
                              color: Color(
                                0xFF9B9BA5,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Yearly",
                          enabled: true,
                          child: Text(
                            "Yearly",
                            style: TextStyle(
                              color: Color(
                                0xFF9B9BA5,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kHalfWidthSizedBox,
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      onLongPress: null,
                      child: Text(
                        'See Details',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: kAccentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kSizedBox,
            Container(
              margin: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 16.57,
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            color: kTextGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const UserReviews(),
                            ),
                          );
                        },
                        child: Text(
                          'See All Reviews',
                          style: TextStyle(
                            color: kAccentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHalfSizedBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_sharp,
                        color: kAccentColor,
                        size: 30,
                      ),
                      kWidthSizedBox,
                      Text(
                        '4.9',
                        style: TextStyle(
                          color: kAccentColor,
                          fontSize: 21.80,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      kWidthSizedBox,
                      const Text(
                        'Total 20 Reviews',
                        style: TextStyle(
                          color: Color(
                            0xFF32343E,
                          ),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  kSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 16.57,
                        child: Text(
                          'Popular items this week',
                          style: TextStyle(
                            color: kTextGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: kAccentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHalfSizedBox,
                ],
              ),
            ),
            Container(
              height: 180,
              margin: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      right: kDefaultPadding,
                      bottom: kDefaultPadding / 1.5,
                    ),
                    padding: const EdgeInsets.only(
                      top: kDefaultPadding / 1.5,
                      left: kDefaultPadding,
                      right: kDefaultPadding / 1.5,
                    ),
                    width: MediaQuery.of(context).size.width * 0.41,
                    decoration: ShapeDecoration(
                      color: kGreyColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          kDefaultPadding,
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
                          spreadRadius: 4,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
