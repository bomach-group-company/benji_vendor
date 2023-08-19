import 'package:benji_vendor/back_office/order/order_provider.dart';
import 'package:benji_vendor/utility/operations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/order/order_model.dart';
import '../../reusable widgets/empty.dart';
import '../../widgets/orders/orders container.dart';
import '../../widgets/product/category button section.dart';
=======
import '../../src/common_widgets/category button section.dart';
import '../../src/common_widgets/orders container.dart';
import '../../src/providers/constants.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
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
    MyOrderProvider order = context.watch<MyOrderProvider>();
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
              order.myOrders.isEmpty
                  ? const SizedBox.shrink()
                  : CategoryButtonSection(
                      category: _categoryButton,
                      categorybgColor: _categoryButtonBgColor,
                      categoryFontColor: _categoryButtonFontColor,
                      isOrder: true,
                    ),
              kSizedBox,
              order.myOrders.isEmpty
                  ? Center(child: EmptyPage(msg: "You have no orders yet!"))
                  : StreamBuilder(
                      stream: null,
                      builder: (context, snapshot) {
                        List<MyOrderModel> afterFilter = order.myOrders
                            .where((element) => element.status!
                                .toUpperCase()
                                .contains(order.selectedItemCat == "All"
                                    ? ""
                                    : order.selectedItemCat.characters
                                        .take(4)
                                        .toString()
                                        .toUpperCase()))
                            .toList();
                        return Flexible(
                          child: Scrollbar(
                            thickness: 10,
                            interactive: true,
                            thumbVisibility: true,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: afterFilter.length,
                              itemBuilder: (context, index) {
                                MyOrderModel data = afterFilter[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OrderDetails(order: data),
                                      ),
                                    );
                                  },
                                  child: OrderContainer(
                                    orderNumber: "00977",
                                    customerName: data.clientId!.username ?? "",
                                    orderTimeStamp:
                                        Operations.convertDate(data.created!),
                                    orderName: data.productId!.name ?? "",
                                    orderQuantity: data.quantity.toString(),
                                    orderPrice: Operations.convertToCurrency(
                                        data.productId!.price.toString()),
                                    customerAddress: data.deliveryAddress!,
                                    productImage: data.productId!.productImage,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
