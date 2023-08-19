// ignore_for_file: file_names

<<<<<<< HEAD
import 'package:benji_vendor/back_office/order/order_controller.dart';
import 'package:benji_vendor/providers/constants.dart';
import 'package:benji_vendor/reusable%20widgets/my%20appbar.dart';
import 'package:benji_vendor/reusable%20widgets/toast.dart';
import 'package:benji_vendor/theme/colors.dart';
import 'package:benji_vendor/utility/operations.dart';
import 'package:cached_network_image/cached_network_image.dart';
=======
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/order/order_model.dart';
import '../../back_office/order/order_provider.dart';
import '../../back_office/url_launch_controller.dart';
import '../../reusable widgets/my elevatedButton.dart';
import '../../reusable widgets/my outlined elevatedButton.dart';
=======
import '../../src/common_widgets/my appbar.dart';
import '../../src/common_widgets/my elevatedButton.dart';
import '../../src/common_widgets/my outlined elevatedButton.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd

class OrderDetails extends StatefulWidget {
  final MyOrderModel? order;
  const OrderDetails({super.key, required this.order});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
//============================== ALL VARIABLES ================================\\

//============================== VARIABLES ================================\\

//============================== BOOLS ================================\\
  bool isOrderProcessing = false;
  bool isOrderAccepted = false;
  bool isOrderCanceled = false;

//============================== FUNCTIONS ================================\\
  //Order Accepted
  void processOrderAccepted() {
    setState(() {
      isOrderProcessing = true;
    });

    // Simulating an asynchronous process
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isOrderProcessing = false;
        isOrderAccepted = true;
      });
    });
  }

  //Order Canceled
  void processOrderCanceled() {
    setState(() {
      isOrderProcessing = true;
    });

    // Simulating an asynchronous process
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isOrderProcessing = false;
        isOrderCanceled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MyOrderProvider order = context.watch<MyOrderProvider>();
    return Scaffold(
      appBar: MyAppBar(
        title: "Order Details",
        toolbarHeight: 80,
        elevation: 0.0,
        actions: const [],
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(
          kDefaultPadding,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Order ID',
                          style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 11.62,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          Operations.convertDate(widget.order!.created!),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 12.52,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    kHalfSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 160),
                          child: Text(
                            '#${widget.order!.id.toString()}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 16.09,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                        widget.order!.status == "CANC"
                            ? Text(
                                'Canceled',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: kAccentColor,
                                  fontSize: 16.09,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.32,
                                ),
                              )
                            : widget.order!.status == "COMP"
                                ? const Text(
                                    'Accepted',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: kSuccessColor,
                                      fontSize: 16.09,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.32,
                                    ),
                                  )
                                : widget.order!.status == "COMP"
                                    ? Text(
                                        'Processing',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: kLoadingColor,
                                          fontSize: 16.09,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.32,
                                        ),
                                      )
                                    : Text(
                                        'Pending',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: kSecondaryColor,
                                          fontSize: 16.09,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.32,
                                        ),
                                      ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            kSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.30),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Items ordered',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.09,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.32,
                    ),
                  ),
                  kHalfSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: ShapeDecoration(
                          // image: const DecorationImage(
                          //   image: AssetImage(
                          //     "assets/images/food/jollof-rice-chicken-plantain.png",
                          //   ),
                          //   fit: BoxFit.fill,
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.order!.productId!.productImage ?? "",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => const Center(
                                  child: CircularProgressIndicator(
                            color: kRedColor,
                          )),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: kRedColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 182.38,
                        child: Text.rich(
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.order!.productId!.name ?? "",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.52,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.52,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "x ${widget.order!.quantity}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.52,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: '₦',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 9.83,
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12.52,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: Operations.convertToCurrency(
                                  widget.order!.productId!.price.toString()),
                              style: const TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 14.30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            kSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.30),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Customer's Detail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.09,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.32,
                    ),
                  ),
                  kSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                            child: CachedNetworkImage(
                          imageUrl: widget.order!.clientId!.image ?? "",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => const Center(
                                  child: CircularProgressIndicator(
                            color: kRedColor,
                          )),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: kRedColor,
                          ),
                        )
                            // Image.asset(
                            //   "assets/images/customer/blessing-elechi.png",
                            //   fit: BoxFit.fill,
                            //   height: 60,
                            //   width: 60,
                            // ),
                            ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.order!.clientId!.username ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12.52,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          kHalfSizedBox,
                          Text(
                            widget.order!.clientId!.email ?? "",
                            style: const TextStyle(
                              color: Color(0xFF979797),
                              fontSize: 11.62,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          kSizedBox,
                          const Text(
                            'Delivery address',
                            style: TextStyle(
                              color: Color(0xFF979797),
                              fontSize: 10.73,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          kHalfSizedBox,
                          SizedBox(
                            width: 155,
                            child: Text(
                              widget.order!.deliveryAddress ?? "",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF222222),
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.52,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: kAccentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadows: [
                            BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 0.7,
                              color: kBlackColor.withOpacity(0.4),
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: IconButton(
                          onPressed: () async {
                            if (widget.order!.clientId!.phone == null ||
                                widget.order!.clientId!.phone!.isEmpty) {
                              inAppToast(
                                  context, "Can't initiate call at this time",
                                  isError: true);
                              return;
                            }

                            await UrlLaunchController.makePhoneCall(
                                widget.order!.clientId!.phone!);
                          },
                          icon: Icon(
                            Icons.phone_rounded,
                            color: kPrimaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            kSizedBox,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.30),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.09,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.32,
                    ),
                  ),
                  kSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.52,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "₦",
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 9.83,
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12.52,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: Operations.convertToCurrency(
                                  widget.order!.productId!.price.toString()),
                              style: const TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 14.30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  kHalfSizedBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delivery Fee',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.52,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "₦",
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 9.83,
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12.52,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "0",
                              style: const TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 14.30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  kHalfSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "₦",
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 9.83,
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12.52,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: Operations.convertToCurrency(
                                  widget.order!.productId!.price.toString()),
                              style: const TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 14.30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  kHalfSizedBox,
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            widget.order!.status == "CANC"
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEF8F8),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.50,
                          color: Color(0xFFFDEDED),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          color: kAccentColor,
                          Icons.info_outline_rounded,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Order Canceled',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.09,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.32,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                'This order has been canceled',
                                style: TextStyle(
                                  color: Color(0xFF6E6E6E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.28,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : widget.order!.status == "COMP"
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFEF8F8),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.50,
                              color: Color(0xFFFDEDED),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              color: kAccentColor,
                              Icons.info_outline_rounded,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Awaiting Delivery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.09,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: const Text(
                                    'The delivery man is on his way to deliver this product',
                                    style: TextStyle(
                                      color: Color(0xFF6E6E6E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : order.loadAccept || order.loadCancel || order.loadDecline
                        ? SpinKitChasingDots(
                            color: kAccentColor,
                            duration: const Duration(seconds: 2),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyOutlinedElevatedButton(
                                onPressed: () async {
                                  //    processOrderCanceled();
                                  MyOrderController.cancelOrder(
                                      context, widget.order!.id);
                                },
                                buttonTitle: "Cancel Order",
                                elevation: 10.0,
                                titleFontSize: 16.09,
                                circularBorderRadius: 10.0,
                                maximumSizeHeight: 50.07,
                                maximumSizeWidth:
                                    MediaQuery.of(context).size.width / 2.5,
                                minimumSizeHeight: 50.07,
                                minimumSizeWidth:
                                    MediaQuery.of(context).size.width / 2.5,
                              ),
                              MyElevatedButton(
                                onPressed: () async {
                                  MyOrderController.acceptOrder(
                                      context, widget.order!.id);
                                },
                                elevation: 10.0,
                                buttonTitle: "Accept Order",
                                titleFontSize: 16.09,
                                circularBorderRadius: 10.0,
                                maximumSizeHeight: 50.07,
                                maximumSizeWidth:
                                    MediaQuery.of(context).size.width / 2.5,
                                minimumSizeHeight: 50.07,
                                minimumSizeWidth:
                                    MediaQuery.of(context).size.width / 2.5,
                              ),
                            ],
                          ),
            kSizedBox,
          ],
        ),
      ),
    );
  }
}
