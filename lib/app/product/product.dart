import 'package:benji_vendor/app/product/view%20product.dart';
import 'package:benji_vendor/back_office/my_product/my_product_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/my_product/my_product_model.dart';
import '../../providers/constants.dart';
import '../../reusable widgets/my outlined elevatedButton.dart';
import '../../reusable widgets/search field.dart';
import '../../theme/colors.dart';
import '../../utility/operations.dart';
import '../../widgets/product/category button section.dart';
=======
import '../../src/common_widgets/category button section.dart';
import '../../src/common_widgets/my outlined elevatedButton.dart';
import '../../src/common_widgets/search field.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import 'add new product.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  //============================= ALL VARIABLES =====================================\\

  //===================== TEXTEDITING CONTROLLER =======================\\
  TextEditingController searchController = TextEditingController();

  //===================== CATEGORY BUTTONS =======================\\
  final List _categoryButton = [
    "Pasta",
    "Burgers",
    "Rice Dishes",
    "Chicken",
    "Snacks",
  ];

  final List<Color> _categoryButtonBgColor = [
    kAccentColor,
    const Color(
      0xFFF2F2F2,
    ),
    const Color(
      0xFFF2F2F2,
    ),
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
    const Color(
      0xFF828282,
    ),
    const Color(
      0xFF828282,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    MyProductProvider stream = context.watch();
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Container(
            color: kPrimaryColor,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(
              kDefaultPadding,
            ),
            child: StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  List<MyProductsModel> searchFor = stream.myProd
                      .where((element) => element.name!
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase()))
                      .toList();
                  List<MyProductsModel> afterFilter = searchFor
                      .where((element) => element.subCategoryId!.name!.contains(
                          stream.selectedItemCat == "All"
                              ? ""
                              : stream.selectedItemCat))
                      .toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Product',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            MyOutlinedElevatedButton(
                              elevation: 5.0,
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
                              circularBorderRadius: 10,
                              minimumSizeWidth: 65,
                              minimumSizeHeight: 35,
                              maximumSizeWidth: 65,
                              maximumSizeHeight: 35,
                              buttonTitle: "+ Add",
                              titleFontSize: 12,
                            )
                          ],
                        ),
                      ),
                      kSizedBox,
                      SearchField(
                        hintText: "Search your products",
                        searchController: searchController,
                        change: (val) {
                          setState(() {});
                        },
                      ),
                      kSizedBox,
                      CategoryButtonSection(
                        category: stream.myShopCat,
                        categorybgColor: _categoryButtonBgColor,
                        categoryFontColor: _categoryButtonFontColor,
                        isOrder: false,
                      ),
                      kHalfSizedBox,
                      Text(
                        'Total ${stream.myProd.length} items',
                        style: const TextStyle(
                          color: Color(
                            0xFF9B9BA5,
                          ),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      kSizedBox,
                      Flexible(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: afterFilter.length,
                          itemBuilder: (context, index) {
                            final MyProductsModel data = afterFilter[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ViewProduct(
                                      product: data,
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Container(
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
                                        imageUrl: data.productImage ?? "",
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator(
                                          color: kRedColor,
                                        )),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: kRedColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 200,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.name ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Color(
                                                  0xFF32343E,
                                                ),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              data.description ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text: '₦',
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFF4F4F4F,
                                                          ),
                                                          fontSize: 14,
                                                          fontFamily: 'Sen',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const TextSpan(
                                                        text: ' ',
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFF4F4F4F,
                                                          ),
                                                          fontSize: 13.60,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: Operations
                                                            .convertToCurrency(
                                                                data.price
                                                                    .toString()),
                                                        style: const TextStyle(
                                                          color: Color(
                                                            0xFF4F4F4F,
                                                          ),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Qty:',
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFF4F4F4F,
                                                          ),
                                                          fontSize: 13.60,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const TextSpan(
                                                        text: ' ',
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFF4F4F4F,
                                                          ),
                                                          fontSize: 13.60,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: data
                                                            .quantityAvailable
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Color(
                                                            0xFF4F4F4F,
                                                          ),
                                                          fontSize: 13.60,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
