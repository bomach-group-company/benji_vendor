// ignore_for_file: file_names

import 'package:benji_vendor/back_office/upload_product/upload_prod_controller.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_model.dart';
import 'package:benji_vendor/reusable%20widgets/loader.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'package:benji_vendor/providers/constants.dart';
import 'package:benji_vendor/reusable%20widgets/my%20outlined%20elevatedButton.dart';
import 'package:benji_vendor/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../back_office/my_product/my_product_model.dart';
import '../../back_office/upload_product/upload_prod_provider.dart';
import '../../reusable widgets/my appbar.dart';
import '../../reusable widgets/my elevatedButton.dart';
import '../../reusable widgets/my textformfield2.dart';
import '../../reusable widgets/toast.dart';
=======
import '../../src/common_widgets/my appbar.dart';
import '../../src/common_widgets/my elevatedButton.dart';
import '../../src/common_widgets/my outlined elevatedButton.dart';
import '../../src/common_widgets/my textformfield2.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd

class SetVariety extends StatefulWidget {
  final MyProductsModel? data;
  const SetVariety({super.key, this.data});

  @override
  State<SetVariety> createState() => _SetVarietyState();
}

class _SetVarietyState extends State<SetVariety> {
  //============================= ALL VARIABLES =====================================\\

  //===================== GLOBAL KEYS =======================\\
  final _formKey = GlobalKey<FormState>();

  //===================== FOCUS NODES =======================\\
  FocusNode titleFN = FocusNode();
  FocusNode optionFN = FocusNode();

  FocusNode priceFN = FocusNode();
  //===================== CONTROLLERS =======================\\
  TextEditingController titleEC = TextEditingController();
  TextEditingController optionEC = TextEditingController();

  TextEditingController priceEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SendProductProvider stream = context.watch<SendProductProvider>();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: MyAppBar(
        title: "Set Variety",
        toolbarHeight: 80,
        elevation: 0.0,
        actions: const [],
        backgroundColor: kPrimaryColor,
      ),
      body: GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.26,
                      ),
                    ),
                    kHalfSizedBox,
                    MyTextFormField2(
                      hintText: "Enter a title",
                      textInputType: TextInputType.name,
                      controller: titleEC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          titleFN.requestFocus();
                          return "Enter a title";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        titleEC.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      focusNode: titleFN,
                    ),
                    kSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Option 1',
                                style: TextStyle(
                                  color: Color(0xFF222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.26,
                                ),
                              ),
                              kHalfSizedBox,
                              MyTextFormField2(
                                hintText: "Enter an option",
                                textInputType: TextInputType.name,
                                controller: optionEC,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    optionFN.requestFocus();
                                    return "Enter an option";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  optionEC.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                focusNode: optionFN,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  color: Color(0xFF222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.26,
                                ),
                              ),
                              kHalfSizedBox,
                              MyTextFormField2(
                                hintText: "Enter cost here",
                                textInputType: TextInputType.number,
                                controller: priceEC,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    optionFN.requestFocus();
                                    return "Enter the cost";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  priceEC.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                focusNode: priceFN,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    kSizedBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: MyOutlinedElevatedButton(
                        onPressed: () {},
                        circularBorderRadius: 20,
                        minimumSizeWidth: 165,
                        minimumSizeHeight: 48,
                        maximumSizeWidth: 165,
                        maximumSizeHeight: 48,
                        buttonTitle: "Add an option",
                        titleFontSize: 14,
                        elevation: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kDefaultPadding * 4,
              ),
              stream.loadV
                  ? Loader()
                  : MyElevatedButton(
                      onPressed: () {
                        save(context);
                      },
                      circularBorderRadius: 20,
                      minimumSizeWidth: MediaQuery.of(context).size.width,
                      minimumSizeHeight: 50,
                      maximumSizeWidth: MediaQuery.of(context).size.width,
                      maximumSizeHeight: 50,
                      buttonTitle: "Set Variety",
                      titleFontSize: 14,
                      elevation: 0.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  save(context) async {
    if (titleEC.text.isEmpty) {
      inAppSnackBar(context, "Add title", true);
      return;
    } else {
      UploadProductController.updateVariety(
          context, titleEC.text, widget.data!.id);
    }
  }
}
