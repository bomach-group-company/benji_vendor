// ignore_for_file: avoid_unnecessary_containers

<<<<<<< HEAD
import 'package:benji_vendor/back_office/category/category_controller.dart';
import 'package:benji_vendor/back_office/my_product/my_product_controller.dart';
import 'package:benji_vendor/back_office/order/order_provider.dart';
import 'package:benji_vendor/back_office/user/user_provider.dart';
import 'package:benji_vendor/reusable%20widgets/text.dart';
import 'package:benji_vendor/theme/colors.dart';
import 'package:benji_vendor/utility/operations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
=======
import 'package:benji_vendor/app/others/user%20reviews.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/my_product/my_product_model.dart';
import '../../back_office/my_product/my_product_provider.dart';
import '../../back_office/ratings/rating_provider.dart';
import '../../providers/constants.dart';
import '../../reusable widgets/empty.dart';
import '../../widgets/home/home appBar vendor name.dart';
import '../../widgets/home/home orders container.dart';
import '../../widgets/home/home showModalBottomSheet.dart';
=======
import '../../src/common_widgets/home appBar vendor name.dart';
import '../../src/common_widgets/home orders container.dart';
import '../../src/common_widgets/home showModalBottomSheet.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import '../others/notifications.dart';
import '../others/user reviews.dart';
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
    UserProvider user = context.watch<UserProvider>();
    var pictureName = user.user.shopName!.split("");
    MyOrderProvider order = context.watch<MyOrderProvider>();
    RatingProvider rate = context.watch<RatingProvider>();
    MyProductProvider prod = context.watch<MyProductProvider>();
    var numOfPending =
        order.myOrders.where((element) => element.status == "PEND").toList();
    var numOfCompleted =
        order.myOrders.where((element) => element.status == "COMP").toList();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Operations.clearAddProductProvider(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddProduct(
                isEdit: false,
              ),
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
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                      border: Border.all(
                          color: kAccentColor.withOpacity(.4), width: 0)),
                  child: ClipOval(
                      child: Center(
                    child: AppText(
                      text: pictureName.first.toString().toUpperCase(),
                      fontWeight: FontWeight.w800,
                      size: 24,
                      color: kAccentColor,
                    ),
                  )

                      // Image.asset(
                      //   "assets/images/profile/profile-picture.png",
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ),
              ),
            ),
            AppBarVendor(
              vendorName: user.user.shopName ?? "",
              vendorLocation: user.user.address ?? "Independence Layout, Enugu",
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
      body: RefreshIndicator(
        color: kAccentColor,
        onRefresh: () async {
          await Operations.readAll(context, true);
        },
        child: SafeArea(
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
                          "${numOfCompleted.length} Completed",
                          numOfCompleted,
                        );
                      },
                      numberOfOrders: "${numOfCompleted.length}",
                      typeOfOrders: "Complete",
                    ),
                    OrdersContainer(
                      onTap: () {
                        OrdersContainerBottomSheet(
                          context,
                          "${numOfPending.length} Pending",
                          numOfPending,
                        );
                      },
                      numberOfOrders: "${numOfPending.length}",
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
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
                            "₦${Operations.convertToCurrency(user.user.balance == null ? "0" : user.user.balance.toString())}",
                            style: const TextStyle(
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
<<<<<<< HEAD
                    kHalfWidthSizedBox,
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        onLongPress: null,
=======
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
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
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
                          rate.averageRating.toStringAsFixed(1),
                          style: TextStyle(
                            color: kAccentColor,
                            fontSize: 21.80,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        kWidthSizedBox,
                        Text(
                          'Total ${rate.rating.length} Reviews',
                          style: const TextStyle(
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
                    prod.myProd
                            .where((element) => element.isTrending == true)
                            .toList()
                            .isEmpty
                        ? const SizedBox.shrink()
                        : Row(
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
                child: prod.myProd
                        .where((element) => element.isTrending == true)
                        .toList()
                        .isEmpty
                    ? const EmptyPage(msg: "No Popular items this week")
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: prod.myProd
                            .where((element) => element.isTrending == false)
                            .toList()
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          MyProductsModel data = prod.myProd
                              .where((element) => element.isTrending == false)
                              .toList()[index];
                          return InkWell(
                            onTap: () {},
                            child: Container(
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
                              child: CachedNetworkImage(
                                imageUrl: data.productImage ?? "",
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const Center(
                                            child: CircularProgressIndicator(
                                  color: kRedColor,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: kRedColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
