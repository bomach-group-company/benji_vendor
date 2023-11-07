import 'package:benji_vendor/app/orders/order_details.dart';
import 'package:benji_vendor/src/components/card/empty.dart';
import 'package:benji_vendor/src/components/container/vendors_order_container.dart';
import 'package:benji_vendor/src/components/responsive_widgets/padding.dart';
import 'package:benji_vendor/src/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/providers/constants.dart';
import '../../theme/colors.dart';

enum StatusType { delivered, pending, cancelled }

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //===== variable =====//

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
        () => OrderController.instance.scrollListener(scrollController));
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  void clickDelivered() async {
    await OrderController.instance.setStatus(StatusType.delivered);
  }

  void clickPending() async {
    await OrderController.instance.setStatus(StatusType.pending);
  }

  void clickCancelled() async {
    await OrderController.instance.setStatus(StatusType.cancelled);
  }

  bool checkStatus(StatusType? theStatus, StatusType currentStatus) =>
      theStatus == currentStatus;

  orderDetails() {
    Get.to(
      () => const OrderDetails(),
      routeName: 'OrderDetails',
      duration: const Duration(milliseconds: 300),
      fullscreenDialog: true,
      curve: Curves.easeIn,
      preventDuplicates: true,
      popGesture: true,
      transition: Transition.rightToLeft,
    );
  }

  //========= variables ==========//
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MyResponsivePadding(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: const Text(
            'Your Orders',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: const [],
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            children: [
              GetBuilder<OrderController>(
                builder: (controller) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: checkStatus(
                                  controller.status.value, StatusType.delivered)
                              ? kAccentColor
                              : const Color(0xFFF2F2F2),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: clickDelivered,
                        child: Text(
                          'Delivered',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: checkStatus(controller.status.value,
                                    StatusType.delivered)
                                ? kTextWhiteColor
                                : kGreyColor2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: checkStatus(
                                  controller.status.value, StatusType.pending)
                              ? kAccentColor
                              : const Color(0xFFF2F2F2),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: clickPending,
                        child: Text(
                          'Pending',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: checkStatus(
                                    controller.status.value, StatusType.pending)
                                ? kTextWhiteColor
                                : kGreyColor2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: checkStatus(
                                  controller.status.value, StatusType.cancelled)
                              ? kAccentColor
                              : kDefaultCategoryBackgroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                        onPressed: clickCancelled,
                        child: Text(
                          'Cancelled',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: checkStatus(controller.status.value,
                                    StatusType.cancelled)
                                ? kTextWhiteColor
                                : kGreyColor2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kSizedBox,
              GetBuilder<OrderController>(
                initState: (state) async {
                  await OrderController.instance.getOrdersBy();
                },
                init: OrderController(),
                builder: (controller) =>
                    controller.isLoad.value && controller.orderList.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: kAccentColor,
                            ),
                          )
                        : controller.orderList.isEmpty
                            ? const EmptyCard()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.orderList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: orderDetails,
                                    child: VendorsOrderContainer(
                                      order: controller.orderList[index],
                                    ),
                                  );
                                },
                              ),
              ),
              GetBuilder<OrderController>(
                builder: (controller) => Column(
                  children: [
                    controller.isLoadMore.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: kAccentColor,
                            ),
                          )
                        : const SizedBox(),
                    controller.loadedAll.value &&
                            controller.orderList.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                height: 10,
                                width: 10,
                                decoration: ShapeDecoration(
                                    shape: const CircleBorder(),
                                    color: kPageSkeletonColor),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
