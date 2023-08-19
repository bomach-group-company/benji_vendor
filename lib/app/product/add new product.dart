// ignore_for_file: file_names, prefer_typing_uninitialized_variables

<<<<<<< HEAD
import 'dart:developer';

import 'package:benji_vendor/back_office/category/category_provider.dart';
import 'package:benji_vendor/back_office/networks/error.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_controller.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_provider.dart';
import 'package:benji_vendor/reusable%20widgets/toast.dart';
import 'package:benji_vendor/utility/allNavigation.dart';
import 'package:benji_vendor/utility/operations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../back_office/my_product/my_product_model.dart';
import '../../providers/constants.dart';
import '../../reusable widgets/loader.dart';
import '../../reusable widgets/my appbar.dart';
import '../../reusable widgets/my disabled outlined elevatedButton.dart';
import '../../reusable widgets/my elevatedButton.dart';
import '../../reusable widgets/my fixed snackBar.dart';
import '../../reusable widgets/my outlined elevatedButton.dart';
import '../../reusable widgets/my textformfield.dart';
=======
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../src/common_widgets/my appbar.dart';
import '../../src/common_widgets/my disabled outlined elevatedButton.dart';
import '../../src/common_widgets/my elevatedButton.dart';
import '../../src/common_widgets/my outlined elevatedButton.dart';
import '../../src/common_widgets/my textformfield.dart';
import '../../src/providers/constants.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import '../../theme/colors.dart';
import '../../utility/extras_provider.dart';
import 'select category.dart';
import 'set variety.dart';

class AddProduct extends StatefulWidget {
  final bool? isEdit;
  final MyProductsModel? data;

  const AddProduct({super.key, required this.isEdit, this.data});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  //============================= ALL VARIABLES =====================================\\

  //===================== GLOBAL KEYS =======================\\
  final _formKey = GlobalKey<FormState>();

  //================================== DROP DOWN BUTTONFORMFIELD ====================================\\
  String dropDownItemValue = "Food";

  //================================== FOCUS NODES ====================================\\
  FocusNode productType = FocusNode();
  FocusNode productNameFN = FocusNode();
  FocusNode productDescriptionFN = FocusNode();
  FocusNode productPriceFN = FocusNode();
  FocusNode productQuantityFN = FocusNode();
  FocusNode productDiscountFN = FocusNode();

  void dropDownOnChanged(String? onChanged) {
    setState(() {
      dropDownItemValue = onChanged!;
    });
  }

  //================================== CONTROLLERS ====================================\\
  TextEditingController productNameEC = TextEditingController();
  TextEditingController productDescriptionEC = TextEditingController();
  TextEditingController productPriceEC = TextEditingController();
  TextEditingController productQuantityEC = TextEditingController();
  TextEditingController productCategoryEC = TextEditingController();
  TextEditingController productDiscountEC = TextEditingController();

  //================================== VALUES ====================================\\

  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  // bool categorySelected = false;
  var isToggled;

  int? selectedCategory;

  //=========================== IMAGE PICKER ====================================\\

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  //================================== FUNCTIONS ====================================\\
  pickProductImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
    );
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  //=========================== WIDGETS ====================================\\
  Widget uploadProductImage() {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: kDefaultPadding,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Upload Product Image",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(80),
                onTap: () {},
                child: Icon(
                  Icons.delete_rounded,
                  color: kAccentColor,
                ),
              ),
            ],
          ),
          kSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      pickProductImage(ImageSource.camera);
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(
                            width: 0.5,
                            color: kGreyColor1,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                  kHalfSizedBox,
                  const Text(
                    "Camera",
                  ),
                ],
              ),
              kWidthSizedBox,
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      pickProductImage(ImageSource.gallery);
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(
                            width: 0.5,
                            color: kGreyColor1,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.image,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                  kHalfSizedBox,
                  const Text(
                    "Gallery",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  //OVERRIDES
  @override
  void initState() {
    super.initState();

    isToggled = true;
    if (widget.isEdit == true) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        CategoryProvider action =
            Provider.of<CategoryProvider>(context, listen: false);
        action.addSubCat(
            "${widget.data!.subCategoryId!.name!}|${widget.data!.subCategoryId!.id!}");
        // seeError(
        //     "${widget.data!.subCategoryId!.name!}|${widget.data!.subCategoryId!.id!}");
      });
      productNameEC = TextEditingController(text: widget.data!.name ?? "");
      productDescriptionEC =
          TextEditingController(text: widget.data!.description ?? "");
      productPriceEC = TextEditingController(
          text:
              widget.data!.price != null ? widget.data!.price.toString() : "");
      productQuantityEC = TextEditingController(
          text: widget.data!.quantityAvailable != null
              ? widget.data!.quantityAvailable.toString()
              : "");
      productCategoryEC = TextEditingController(
          text: widget.data!.subCategoryId != null
              ? widget.data!.subCategoryId!.name!
              : "");
      productDiscountEC = TextEditingController(text: "");
    }
  }

  @override
  Widget build(BuildContext context) {
    ExtraProvider stream = context.watch<ExtraProvider>();
    SendProductProvider send = context.watch<SendProductProvider>();
    CategoryProvider cat = context.watch<CategoryProvider>();
    var txt = {
      "dropDown": ["Select"],
    };

    cat.subCategory.forEach((element) {
      if (txt["dropDown"]!.contains("${element.name!}|${element.id}")) {
      } else {
        txt["dropDown"]!.add("${element.name!}|${element.id}");
      }
    });
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: MyAppBar(
          title: widget.isEdit == true ? "Update Item" : "Add New Item ",
          toolbarHeight: 80,
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          actions: const [],
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Container(
            // color: kAccentColor,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(
              kDefaultPadding,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                InkWell(
<<<<<<< HEAD
                  onTap: () => widget.isEdit == true
                      ? null
                      : Operations.addItemImage(context),
=======
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      elevation: 20,
                      barrierColor: kBlackColor.withOpacity(
                        0.8,
                      ),
                      showDragHandle: true,
                      useSafeArea: true,
                      isDismissible: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            kDefaultPadding,
                          ),
                        ),
                      ),
                      enableDrag: true,
                      builder: ((builder) => uploadProductImage()),
                    );
                  },
                  splashColor: kAccentColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 144,
                    decoration: ShapeDecoration(
<<<<<<< HEAD
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.50,
                            color: Color(
                              0xFFE6E6E6,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        image: stream.addedItem == null
                            ? null
                            : DecorationImage(
                                image: FileImage(stream.addedItem!))),
                    child: stream.addedItem == null
                        ? Align(
                            alignment: Alignment.center,
                            child: Column(
=======
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.50,
                          color: Color(0xFFE6E6E6),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: selectedImage == null
                          ? Column(
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/icons/image-upload.png",
                                ),
                                kHalfSizedBox,
                                const Text(
                                  'Upload product image',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF808080,
                                    ),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
<<<<<<< HEAD
                            ),
                          )
                        : SizedBox.shrink(),
=======
                            )
                          : GridTile(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(selectedImage!),
                                  ),
                                ),
                              ),
                            ),
                    ),
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
                  ),
                ),
                kSizedBox,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.isEdit == true
                          ? const SizedBox.shrink()
                          : const Text(
                              'Product Type',
                              style: TextStyle(
                                color: Color(
                                  0xFF575757,
                                ),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.32,
                              ),
                            ),
                      kHalfSizedBox,
                      DropdownButtonFormField(
                        value: cat.subCatSelected,
                        onChanged: (value) {
                          //   print(value.toString());
                          CategoryProvider action =
                              Provider.of(context, listen: false);
                          List<String> selected = txt["dropDown"]!
                              .where((element) =>
                                  element.split("|").first == value)
                              .toList();
                          //  print(selected.first.toString());

                          action.addSubCat(selected.first.toString());
                        },
                        enableFeedback: true,
                        focusNode: productType,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        elevation: 20,
                        validator: (value) {
                          if (value == null || value.toString() == "Select") {
                            productType.requestFocus();
                            return error("Set product type");
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            borderSide: BorderSide(
                              color: Colors.blue.shade50,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            borderSide: BorderSide(
                              color: Colors.blue.shade50,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            borderSide: BorderSide(
                              color: Colors.blue.shade50,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            borderSide: const BorderSide(
                              color: kErrorBorderColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        iconEnabledColor: kAccentColor,
                        iconDisabledColor: kGreyColor2,
                        items: txt["dropDown"]!
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.split("|").first,
                                //  enabled: true,
                                child: Text(
                                  e.split("|").first,
                                  style: const TextStyle(
                                    color: kTextBlackColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      kSizedBox,
                      const Text(
                        'Product Name',
                        style: TextStyle(
                          color: Color(
                            0xFF575757,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.32,
                        ),
                      ),
                      kHalfSizedBox,
                      MyTextFormField(
                        controller: productNameEC,
                        focusNode: productNameFN,
                        hintText: "Enter the product name here",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        prefixIcon: const Icon(
                          null,
                        ),
                        suffixIcon: const Icon(
                          null,
                        ),
                        validator: (value) {
                          if (value == null || value!.isEmpty) {
                            productNameFN.requestFocus();
                            return "Enter the product name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          productNameEC.text = value!;
                        },
                      ),
                      kSizedBox,
                      const Text(
                        'Product Description',
                        style: TextStyle(
                          color: Color(
                            0xFF575757,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.32,
                        ),
                      ),
                      kHalfSizedBox,
                      MyTextFormField(
                        controller: productDescriptionEC,
                        focusNode: productDescriptionFN,
                        hintText: "Enter the description here",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          null,
                        ),
                        suffixIcon: const Icon(
                          null,
                        ),
                        validator: (value) {
                          if (value == null || value!.isEmpty) {
                            productDescriptionFN.requestFocus();
                            return "Enter the product name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          productDescriptionEC.text = value!;
                        },
                      ),
                      kSizedBox,
                      const Text(
                        'Unit Price',
                        style: TextStyle(
                          color: Color(
                            0xFF575757,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.32,
                        ),
                      ),
                      kHalfSizedBox,
                      MyTextFormField(
                        controller: productPriceEC,
                        focusNode: productPriceFN,
                        hintText: "Enter the unit price here",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number,
                        prefixIcon: const Icon(
                          null,
                        ),
                        suffixIcon: const Icon(
                          null,
                        ),
                        validator: (value) {
                          if (value == null || value!.isEmpty) {
                            productPriceFN.requestFocus();
                            return "Enter the unit price";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          productPriceEC.text = value!;
                        },
                      ),
                      kSizedBox,
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          color: Color(
                            0xFF575757,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.32,
                        ),
                      ),
                      kHalfSizedBox,
                      MyTextFormField(
                        controller: productQuantityEC,
                        focusNode: productQuantityFN,
                        hintText: "Enter the quantity here",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        prefixIcon: const Icon(
                          null,
                        ),
                        suffixIcon: const Icon(
                          null,
                        ),
                        validator: (value) {
                          if (value == null || value!.isEmpty) {
                            productQuantityFN.requestFocus();
                            return "Enter the quantity";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          productQuantityEC.text = value!;
                        },
                      ),
                      kSizedBox,
                      const Text(
                        'Product Category',
                        style: TextStyle(
                          color: Color(
                            0xFF575757,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.32,
                        ),
                      ),
                      kHalfSizedBox,
                      ListTile(
                        enableFeedback: true,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SelectCategory(),
                            ),
                          );
                        },
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: kAccentColor,
                        ),
                        title: Text(
                          cat.name.split("|").first,
                          style: const TextStyle(
                            color: Color(
                              0xFF979797,
                            ),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      kHalfSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Special Offer',
                                style: TextStyle(
                                  color: Color(
                                    0xFF222222,
                                  ),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.26,
                                ),
                              ),
                              kHalfWidthSizedBox,
                              Text(
                                '(Optional)',
                                style: TextStyle(
                                  color: Color(0xFF979797),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.20,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            tooltip: isToggled ? "Turn on" : "Turn off",
                            isSelected: isToggled,
                            onPressed: () {
                              setState(() {
                                isToggled = !isToggled;
                              });
                            },
                            icon: isToggled
                                ? const Icon(
                                    Icons.toggle_off,
                                    color: kGreyColor1,
                                  )
                                : Icon(
                                    Icons.toggle_on,
                                    color: kAccentColor,
                                  ),
                          ),
                        ],
                      ),
                      isToggled
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: false,
                                  fillColor: const MaterialStatePropertyAll(
                                      kGreyColor1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  onChanged: (newValue) {
                                    null;
                                  },
                                ),
                                const Text(
                                  'Disabled',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF222222,
                                    ),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.26,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  splashRadius: 50,
                                  activeColor: kAccentColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      isChecked = newValue!;
                                    });
                                  },
                                ),
                                const Text(
                                  'Free Delivery',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF222222,
                                    ),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.26,
                                  ),
                                ),
                              ],
                            ),
                      isToggled
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: false,
                                  fillColor: const MaterialStatePropertyAll(
                                      kGreyColor1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  onChanged: (newValue) {
                                    null;
                                  },
                                ),
                                const Text(
                                  'Disabled',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF222222,
                                    ),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.26,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: isChecked2,
                                  splashRadius: 50,
                                  activeColor: kAccentColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      isChecked2 = newValue!;
                                    });
                                  },
                                ),
                                const Text(
                                  'Percentage Discount',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF222222,
                                    ),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.26,
                                  ),
                                ),
                              ],
                            ),
                      kSizedBox,
                      const Text(
                        'Set Custom Discount',
                        style: TextStyle(
                          color: Color(
                            0xFF222222,
                          ),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.26,
                        ),
                      ),
                      kHalfSizedBox,
                      MyTextFormField(
                        controller: productDiscountEC,
                        validator: (value) {
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        focusNode: productDiscountFN,
                        hintText: "Enter Discount",
                        textInputType: TextInputType.number,
                        prefixIcon: const Icon(
                          Icons.percent_rounded,
                          size: 20,
                          color: kBlackColor,
                        ),
                        suffixIcon: const Icon(
                          null,
                        ),
                      ),
                      kSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked3,
                            splashRadius: 50,
                            activeColor: kAccentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            onChanged: (newValue) {
                              if (widget.isEdit == true) {
                                setState(() {
                                  isChecked3 = newValue!;
                                });
                              } else {
                                inAppToast(context,
                                    "you can only set item on product edit. kindly add this item first",
                                    isError: true);
                              }
                            },
                          ),
                          const Text(
                            'Varieties',
                            style: TextStyle(
                              color: Color(
                                0xFF222222,
                              ),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.26,
                            ),
                          ),
                        ],
                      ),
                      kSizedBox,
                      isChecked3
                          ? ListTile(
                              enableFeedback: true,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SetVariety(
                                      data: widget.data,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                const Tooltip(
                                  message: "Select a variety",
                                );
                              },
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: kAccentColor,
                              ),
                              title: const Text(
                                'Select variety',
                                style: TextStyle(
                                  color: Color(
                                    0xFF979797,
                                  ),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : const ListTile(
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                              title: Text(
                                'Disabled',
                                style: TextStyle(
                                  color: Color(
                                    0xFF979797,
                                  ),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                      kHalfSizedBox,
                      isChecked3
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: MyOutlinedElevatedButton(
                                onPressed: () {},
                                elevation: 10.0,
                                buttonTitle: "+ Add a variety",
                                titleFontSize: 16,
                                circularBorderRadius: 20,
                                maximumSizeHeight: 30,
                                maximumSizeWidth: 150,
                                minimumSizeHeight: 30,
                                minimumSizeWidth: 150,
                              ),
                            )
                          : const Align(
                              alignment: Alignment.bottomRight,
                              child: MyDisabledOutlinedElevatedButton(
                                buttonTitle: "Disabled",
                                titleFontSize: 14,
                                circularBorderRadius: 20,
                                maximumSizeHeight: 30,
                                maximumSizeWidth: 150,
                                minimumSizeHeight: 30,
                                minimumSizeWidth: 150,
                              ),
                            ),
                      kSizedBox,
                      send.load || send.loadUpdate
                          ? Loader()
                          : MyElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  _saveInfo(context);
                                  // print("validated");
                                }
                              },
                              elevation: 10.0,
                              buttonTitle:
                                  widget.isEdit == true ? "Update" : "Save",
                              titleFontSize: 14,
                              circularBorderRadius: 20,
                              maximumSizeHeight: 56,
                              maximumSizeWidth:
                                  MediaQuery.of(context).size.width,
                              minimumSizeHeight: 56,
                              minimumSizeWidth:
                                  MediaQuery.of(context).size.width,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _saveInfo(context) {
    CategoryProvider cat = Provider.of(context, listen: false);
    ExtraProvider extra = Provider.of(context, listen: false);
    // log(widget.data!.id!);

    if (widget.isEdit == true) {
      if (cat.subCatSelected == "Select") {
        productType.requestFocus();
        error("Set product type");

        return;
      }

      UploadProductController.updateProd(
          context,
          productNameEC.text,
          productDescriptionEC.text,
          productPriceEC.text,
          productQuantityEC.text,
          widget.data!.subCategoryId!.id,
          widget.data!.id!);
    } else {
      if (extra.addedItem == null) {
        error("Add product image");
        return;
      }
      if (cat.subCatSelected == "Select") {
        productType.requestFocus();
        error("Set product type");

        return;
      }

      if (productNameEC.text.isEmpty ||
          productDescriptionEC.text.isEmpty ||
          productPriceEC.text.isEmpty ||
          productQuantityEC.text.isEmpty) {
        error("incomplete form");
        return;
      }

      if (cat.name == "Select Category") {
        PageRouting.pushToPage(context, const SelectCategory());
        return;
      }

      UploadProductController.sendProd(
          context,
          productNameEC.text,
          productDescriptionEC.text,
          productPriceEC.text,
          productQuantityEC.text);
    }
  }

  error(val) {
    myFixedSnackBar(context, "$val", Colors.redAccent, Duration(seconds: 2));
  }
}
