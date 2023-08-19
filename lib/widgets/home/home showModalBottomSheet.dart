// ignore_for_file: file_names, non_constant_identifier_names
import 'package:benji_vendor/reusable%20widgets/my%20elevatedButton.dart';
import 'package:benji_vendor/reusable%20widgets/my%20outlined%20elevatedButton.dart';
import 'package:benji_vendor/utility/operations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../back_office/order/order_controller.dart';
import '../../back_office/order/order_model.dart';
import '../../back_office/order/order_provider.dart';
import '../../theme/colors.dart';
import '../../providers/constants.dart';

Future<dynamic> OrdersContainerBottomSheet(BuildContext context, String numberAndTypeOf, List<MyOrderModel> myOrders) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: kPrimaryColor,
      barrierColor: kBlackColor.withOpacity(
        0.5,
      ),
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: true,
      elevation: 20.0,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        minHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            kDefaultPadding,
          ),
        ),
      ),
      enableDrag: true,
      builder: (context) {
        MyOrderProvider stream = context.watch<MyOrderProvider>();
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                  kDefaultPadding,
                ),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "$numberAndTypeOf Orders",
                    style: const TextStyle(
                      color: Color(
                        0xFF181C2E,
                      ),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                kSizedBox,
                Flexible(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: myOrders.length,
                    itemBuilder: (context, index) {
                      final MyOrderModel order = myOrders[index];
                      return SizedBox(
                        height: 120,
                        width: 331,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: 104,
                                height: 104,
                                decoration: ShapeDecoration(
                                  // image: const DecorationImage(
                                  //   image: AssetImage(
                                  //     "assets/images/food/pasta.png",
                                  //   ),
                                  //   fit: BoxFit.fill,
                                  // ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: order.productId!.productImage ?? "",
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
                            ),
                            Positioned(
                              left: 110,
                              child: SizedBox(
                                height: 70,
                                width: 260,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          order.productId!.subCategoryId!
                                                  .name ??
                                              '',
                                          style: TextStyle(
                                            color: kAccentColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.28,
                                          ),
                                        ),
                                        const Text(
                                          'ID: ',
                                          style: TextStyle(
                                            color: Color(
                                              0xFF9B9BA5,
                                            ),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      order.productId!.name ?? "",
                                      style: const TextStyle(
                                        color: Color(
                                          0xFF32343E,
                                        ),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '₦${Operations.convertToCurrency(order.productId!.price.toString())}',
                                      style: const TextStyle(
                                        color: Color(
                                          0xFF4F4F4F,
                                        ),
                                        fontSize: 18,
                                        fontFamily: 'Sen',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            numberAndTypeOf.contains("Completed")
                                ? const SizedBox.shrink()
                                : Positioned(
                                    right: 0,
                                    bottom: 10,
                                    child: SizedBox(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyElevatedButton(
                                            onPressed: () {
                                              MyOrderController.acceptOrder(
                                                  context, order.id, true);
                                            },
                                            elevation: 10.0,
                                            circularBorderRadius: 10,
                                            minimumSizeWidth: 90,
                                            minimumSizeHeight: 30,
                                            maximumSizeWidth: 90,
                                            maximumSizeHeight: 30,
                                            buttonTitle: "Done",
                                            titleFontSize: 14,
                                          ),
                                          MyOutlinedElevatedButton(
                                            onPressed: () async {
                                              MyOrderController.cancelOrder(
                                                  context, order.id);
                                            },
                                            elevation: 10.0,
                                            circularBorderRadius: 10,
                                            minimumSizeWidth: 90,
                                            minimumSizeHeight: 30,
                                            maximumSizeWidth: 90,
                                            maximumSizeHeight: 30,
                                            buttonTitle: "Cancel",
                                            titleFontSize: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding * 4,
                ),
              ],
            ),
          ),
        );
      });
}
