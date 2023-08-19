// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD:lib/widgets/orders/orders container.dart
import '../../providers/constants.dart';
import '../../theme/colors.dart';
=======
import '../providers/constants.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd:lib/src/common_widgets/orders container.dart

class OrderContainer extends StatelessWidget {
  final String customerName;
  final String orderNumber;
  final String orderTimeStamp;
  final String orderName;
  final String orderQuantity;
  final String orderPrice;
  final String customerAddress;
  final String? productImage;
  const OrderContainer({
    super.key,
    required this.customerName,
    required this.orderNumber,
    required this.orderTimeStamp,
    required this.orderName,
    required this.orderQuantity,
    required this.orderPrice,
    required this.customerAddress,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(
        kDefaultPadding / 2,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
                  imageUrl: productImage ?? "",
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(
                          child: CircularProgressIndicator(
                    color: kRedColor,
                  )),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: kRedColor,
                  ),
                ),
              ),
              kHalfSizedBox,
              Text(
                '#$orderNumber',
                style: const TextStyle(
                  color: Color(0xFF808080),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          kHalfWidthSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Text(
                      customerName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Text(
                      orderTimeStamp,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              kHalfSizedBox,
              SizedBox(
                width: 204,
                child: Text(
                  orderName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              kHalfSizedBox,
              Row(
                children: [
                  Text(
                    "x $orderQuantity",
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  kHalfWidthSizedBox,
                  SizedBox(
                    width: 77,
                    height: 23,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: '₦',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 15,
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: orderPrice,
                            style: const TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kHalfSizedBox,
              Container(
                constraints: BoxConstraints(maxWidth: 200),
                child: Text(
                  customerAddress,
                  style: const TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 12.52,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
