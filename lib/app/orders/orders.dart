import 'package:flutter/material.dart';

import '../../src/common_widgets/category button section.dart';
import '../../src/common_widgets/orders container.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
import 'order details.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //============================= ALL VARIABLES =====================================\\
  //===================== CATEGORY BUTTONS =======================\\
  final List _categoryButton = [
    "Pending",
    "Completed",
    "Cancelled",
  ];

  final List<Color> _categoryButtonBgColor = [
    kAccentColor,
    const Color(
      0xFFF2F2F2,
    ),
    const Color(
      0xFFF2F2F2,
    ),
  ];
  final List<Color> _categoryButtonFontColor = [
    kPrimaryColor,
    const Color(
      0xFF828282,
    ),
    const Color(
      0xFF828282,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          color: kPrimaryColor,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Orders',
                style: TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              kSizedBox,
              CategoryButtonSection(
                category: _categoryButton,
                categorybgColor: _categoryButtonBgColor,
                categoryFontColor: _categoryButtonFontColor,
              ),
              kSizedBox,
              Flexible(
                child: Scrollbar(
                  thickness: 10,
                  interactive: true,
                  thumbVisibility: true,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const OrderDetails(),
                            ),
                          );
                        },
                        child: OrderContainer(
                          orderNumber: "00977",
                          customerName: "Blessing Elechi",
                          orderTimeStamp: "04-06-2023 | 12:30pm",
                          orderName: "Jollof Rice and Chicken with Plantain",
                          orderQuantity: 2.toString(),
                          orderPrice: "5,000",
                          customerAddress: "21 Kanna Street, GRA, Enugu",
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
