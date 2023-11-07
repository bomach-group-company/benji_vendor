import 'package:benji_vendor/app/product/view_product.dart';
import 'package:benji_vendor/src/components/card/empty.dart';
import 'package:benji_vendor/src/components/container/vendors_product_container.dart';
import 'package:benji_vendor/src/components/responsive_widgets/padding.dart';
import 'package:benji_vendor/src/controller/product_controller.dart';
import 'package:benji_vendor/src/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/components/button/my outlined elevatedButton.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
import 'add_new_product.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(
        () => ProductController.instance.scrollListener(scrollController));
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  //========= variables ==========//
  final ScrollController scrollController = ScrollController();

  //============================= ALL VARIABLES =====================================\\

  //===================== TEXTEDITING CONTROLLER =======================\\
  TextEditingController searchController = TextEditingController();

  //===================== Fucntions =======================\\
  addProduct() {
    Get.to(
      () => const AddProduct(),
      routeName: 'AddProduct',
      duration: const Duration(milliseconds: 300),
      fullscreenDialog: true,
      curve: Curves.easeIn,
      preventDuplicates: true,
      popGesture: true,
      transition: Transition.rightToLeft,
    );
  }

  viewProduct(ProductModel product) {
    Get.to(
      () => ViewProduct(product: product),
      routeName: 'ViewProduct',
      duration: const Duration(milliseconds: 300),
      fullscreenDialog: true,
      curve: Curves.easeIn,
      preventDuplicates: true,
      popGesture: true,
      transition: Transition.rightToLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final media = MediaQuery.of(context).size;
    return MyResponsivePadding(
      child: GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            title: const Text(
              'Your Products',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: MyOutlinedElevatedButton(
                  elevation: 5.0,
                  onPressed: addProduct,
                  circularBorderRadius: 10,
                  minimumSizeWidth: 65,
                  minimumSizeHeight: 35,
                  maximumSizeWidth: 65,
                  maximumSizeHeight: 35,
                  title: "Add",
                  titleFontSize: 12,
                ),
              )
            ],
          ),
          body: SafeArea(
            maintainBottomViewPadding: true,
            child: Scrollbar(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(kDefaultPadding),
                physics: const BouncingScrollPhysics(),
                children: [
                  GetBuilder<ProductController>(
                    initState: (state) async {
                      await ProductController.instance.getProducts();
                    },
                    init: ProductController(),
                    builder: (controller) {
                      return controller.isLoad.value &&
                              controller.products.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                                color: kAccentColor,
                              ),
                            )
                          : controller.products.isEmpty
                              ? const EmptyCard()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return VendorsProductContainer(
                                      onTap: () => viewProduct(
                                          controller.products[index]),
                                      product: controller.products[index],
                                    );
                                  },
                                );
                    },
                  ),
                  GetBuilder<ProductController>(
                    initState: (state) async {
                      await ProductController.instance.getProducts();
                    },
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
                                controller.products.isNotEmpty
                            ? Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                height: 10,
                                width: 10,
                                decoration: ShapeDecoration(
                                    shape: const CircleBorder(),
                                    color: kPageSkeletonColor),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
