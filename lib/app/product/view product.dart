// ignore_for_file: file_names

import 'package:benji_vendor/back_office/my_product/my_product_provider.dart';
import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_provider.dart';
import 'package:benji_vendor/reusable%20widgets/loader.dart';
import 'package:benji_vendor/utility/allNavigation.dart';
import 'package:benji_vendor/utility/operations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/category/category_provider.dart';
import '../../back_office/my_product/my_product_controller.dart';
import '../../back_office/my_product/my_product_model.dart';
import '../../back_office/upload_product/upload_prod_controller.dart';
import '../../providers/constants.dart';
import '../../reusable widgets/showModalBottomSheet.dart';
import '../../reusable widgets/showModalBottomSheetTitleWithIcon.dart';
import '../../theme/colors.dart';
import '../../widgets/product/category button section.dart';
import 'add new product.dart';
=======
import '../../src/common_widgets/category button section.dart';
import '../../src/common_widgets/showModalBottomSheet.dart';
import '../../src/common_widgets/showModalBottomSheetTitleWithIcon.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd

class ViewProduct extends StatefulWidget {
  final MyProductsModel product;
  const ViewProduct({super.key, required this.product});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  //============================ ALL VARIABLES ===============================\\

  //============================== CATEGORY BUTTONS ===========================\\
  final List _categoryButtonText = [
    "Protein",
    "Stew Type",
    "",
    "",
    "",
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
    SendProductProvider stream = context.watch<SendProductProvider>();
    MyProductProvider variety = context.watch<MyProductProvider>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white.withOpacity(
          0.6,
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 320,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(),
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //   image: AssetImage(
                //     "assets/images/food/pasta.png",
                //   ),
                // ),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.product.productImage ?? "",
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
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.04,
            left: kDefaultPadding,
            right: kDefaultPadding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(context);
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            19,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ShowModalBottomSheet(
                        context,
                        20.0,
                        MediaQuery.of(context).size.height * 0.7,
                        MediaQuery.of(context).size.height * 0.5,
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding / 2,
                            right: kDefaultPadding,
                            bottom: kDefaultPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ShowModalBottomSheetTitleWithIcon(
                                title: "Option",
                              ),
                              const SizedBox(
                                height: kDefaultPadding * 3,
                              ),
                              ListTile(
                                onTap: () async {
                                  Operations.clearAddProductProvider(context);
                                  CategoryProvider action =
                                      Provider.of<CategoryProvider>(context,
                                          listen: false);
                                  try {
                                    action.addSubCat(
                                        "${widget.product.subCategoryId!.name!}|${widget.product.subCategoryId!.id!}");

                                    action.addCategory(
                                        "${widget.product.subCategoryId!.category!.name!}|${widget.product.subCategoryId!.category!.id!}");
                                  } catch (e) {
                                    seeError(e);
                                  }
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AddProduct(
                                        isEdit: true,
                                        data: widget.product,
                                      ),
                                    ),
                                  );
                                },
                                leading: Icon(
                                  Icons.edit,
                                  color: kAccentColor,
                                  size: 14,
                                ),
                                title: const Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Color(0xFF696969),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                              ),
                              stream.loadPack
                                  ? Loader()
                                  : ListTile(
                                      onTap: () async {
                                        await UploadProductController.delProd(
                                            context,
                                            widget.product.id!.toString());
                                        // ignore: use_build_context_synchronously
                                        PageRouting.popToPage(context);
                                      },
                                      leading: Icon(
                                        Icons.delete,
                                        color: kAccentColor,
                                        size: 14,
                                      ),
                                      title: const Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Color(0xFF696969),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.32,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            19,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.more_horiz_rounded,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 380,
            left: kDefaultPadding,
            right: kDefaultPadding,
            child: Container(
              height: MediaQuery.of(context).size.height - 400,
              width: MediaQuery.of(context).size.width,
              // color: kAccentColor,
              padding: const EdgeInsets.all(
                5.0,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.name ?? "",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(
                              0xFF302F3C,
                            ),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "₦${Operations.convertToCurrency(widget.product.price.toString())}",
                          style: const TextStyle(
                            color: Color(
                              0xFF333333,
                            ),
                            fontSize: 22,
                            fontFamily: 'sen',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    kSizedBox,
                    Text(
                      widget.product.description ?? "",
                      style: const TextStyle(
                        color: Color(
                          0xFF676565,
                        ),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    kSizedBox,
                    SizedBox(
                      width: 67,
                      height: 17,
                      child: Text(
                        'Qty: ${widget.product.quantityAvailable!.toString()}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(
                            0xFF828282,
                          ),
                          fontSize: 13.60,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    kSizedBox,
                    // CategoryButtonSection(
                    //   category: _categoryButtonText,
                    //   categorybgColor: _categoryButtonBgColor,
                    //   categoryFontColor: _categoryButtonFontColor,
                    //   isOrder: false,
                    // ),
                    kSizedBox,
                    // const Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Beef (₦2,000)',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontFamily: 'Sen',
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //     kSizedBox,
                    //     Text(
                    //       'Fish (₦2,000)',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontFamily: 'Sen',
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //     kSizedBox,
                    //     Text(
                    //       'Goat Meat (₦2,000)',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontFamily: 'Sen',
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //     kSizedBox,
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MyProductController.myVariety(context, widget.product.id);
    });
  }
}
