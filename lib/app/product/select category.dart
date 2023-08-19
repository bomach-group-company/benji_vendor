// ignore_for_file: file_names

<<<<<<< HEAD
import 'package:benji_vendor/back_office/category/category_provider.dart';
import 'package:benji_vendor/reusable%20widgets/my%20appbar.dart';
import 'package:benji_vendor/theme/colors.dart';
import 'package:benji_vendor/utility/allNavigation.dart';
=======
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/category/category_model.dart';
import '../../providers/constants.dart';
import '../../reusable widgets/my elevatedButton.dart';
import '../../reusable widgets/my fixed snackBar.dart';
import '../../reusable widgets/my textformfield2.dart';
import '../../reusable widgets/showModalBottomSheetTitleWithIcon.dart';
=======
import '../../src/common_widgets/my appbar.dart';
import '../../src/common_widgets/my elevatedButton.dart';
import '../../src/common_widgets/my textformfield2.dart';
import '../../src/common_widgets/showModalBottomSheetTitleWithIcon.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import '../others/successful_screen.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  //======================================= ALL VARIABLES =======================================\\

  //================================== VALUES ====================================\\

  int? selectedCategory;

  //========================================= CONTROLLERS =========================================\\
  TextEditingController categoryNameEC = TextEditingController();

  //========================================= FOCUS NODES =========================================\\
  FocusNode categoryNameFN = FocusNode();

  //========================================= LISTS ==========================================\\

  int get categoryCount => categoryList.length;

  List<String> categoryList = [
    "Rice",
    "Swallow",
    "Soup",
    "Snacks",
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = -1;
  }

  error(val) {
    myFixedSnackBar(context, "$val", Colors.redAccent, Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider stream = context.watch<CategoryProvider>();
    CategoryProvider action =
        Provider.of<CategoryProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: MyAppBar(
        title: "Select Category",
        toolbarHeight: 80,
        elevation: 0.0,
        actions: const [],
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(
                kDefaultPadding,
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: stream.category.length,
                itemBuilder: (BuildContext context, int index) {
                  final CategoryModel data = stream.category[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          action.addCategory("${data.name}|${data.id}");
                          // setState(() {
                          //   selectedCategory = index;
                          // });
                        },
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.name!,
                                style: TextStyle(
                                  color:
                                      stream.name.split("|").first == data.name
                                          ? kBlackColor
                                          : kGreyColor1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                stream.name.split("|").first == data.name
                                    ? Icons.check_rounded
                                    : null,
                                color: kAccentColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: kGreyColor1,
                        ),
                      ),
                      kSizedBox,
                    ],
                  );
                },
              ),
            ),
            MyElevatedButton(
              buttonTitle: "Save",
              onPressed: () {
                PageRouting.popToPage(context);
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => const SuccessfulScreen(
                //       text: "Product added successfully",
                //       elevatedButtonTitle: "Okay",
                //     ),
                //   ),
                // );
              },
              circularBorderRadius: 16,
              minimumSizeWidth: MediaQuery.of(context).size.width,
              minimumSizeHeight: 50,
              maximumSizeWidth: MediaQuery.of(context).size.width,
              maximumSizeHeight: 50,
              titleFontSize: 14,
              elevation: 0,
            ),
            kSizedBox,
            InkWell(
              onTap: () {
                error("Not available at the moment");
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const AddCategory(),
                //   ),
                // );
                // showModalBottomSheet(
                //   context: context,
                //   backgroundColor: kPrimaryColor,
                //   barrierColor: kBlackColor.withOpacity(0.5),
                //   showDragHandle: true,
                //   useSafeArea: true,
                //   isScrollControlled: true,
                //   isDismissible: true,
                //   elevation: 20.0,
                //   constraints: BoxConstraints(
                //     maxHeight: MediaQuery.of(context).size.height * 0.7,
                //     minHeight: MediaQuery.of(context).size.height * 0.5,
                //   ),
                //   shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.vertical(
                //       top: Radius.circular(
                //         kDefaultPadding,
                //       ),
                //     ),
                //   ),
                //   enableDrag: true,
                //   builder: (context) => GestureDetector(
                //     onTap: (() =>
                //         FocusManager.instance.primaryFocus?.unfocus()),
                //     child: SingleChildScrollView(
                //       physics: const BouncingScrollPhysics(),
                //       scrollDirection: Axis.vertical,
                //       padding: const EdgeInsets.only(
                //         left: kDefaultPadding,
                //         top: kDefaultPadding / 2,
                //         right: kDefaultPadding,
                //         bottom: kDefaultPadding,
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const ShowModalBottomSheetTitleWithIcon(
                //             title: "Create Category",
                //           ),
                //           const SizedBox(height: kDefaultPadding * 4),
                //           MyTextFormField2(
                //             controller: categoryNameEC,
                //             focusNode: categoryNameFN,
                //             textInputType: TextInputType.name,
                //             hintText: "Enter category name here",
                //             textInputAction: TextInputAction.go,
                //             validator: (value) {
                //               RegExp namePattern = RegExp(
                //                 r'^.{3,}$', //Less than 3 characters
                //               );
                //               if (value == null || value!.isEmpty) {
                //                 categoryNameFN.requestFocus();
                //                 return "Enter a category";
                //               } else if (!namePattern.hasMatch(value)) {
                //                 categoryNameFN.requestFocus();
                //                 return "Please enter a valid name";
                //               }
                //               return null;
                //             },
                //             onSaved: (value) {
                //               categoryNameEC.text = value;
                //             },
                //           ),
                //           kSizedBox,
                //           MyElevatedButton(
                //             buttonTitle: "Save",
                //             onPressed: () {
                //               Navigator.of(context).pushReplacement(
                //                 MaterialPageRoute(
                //                   builder: (context) => const SuccessfulScreen(
                //                     text: "Product created successfully",
                //                     elevatedButtonTitle: "Okay",
                //                   ),
                //                 ),
                //               );
                //             },
                //             circularBorderRadius: 16,
                //             minimumSizeWidth: MediaQuery.of(context).size.width,
                //             minimumSizeHeight: 50,
                //             maximumSizeWidth: MediaQuery.of(context).size.width,
                //             maximumSizeHeight: 50,
                //             titleFontSize: 14,
                //             elevation: 0,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 56,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFFE6E6E6),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      color: kAccentColor,
                    ),
                    kHalfWidthSizedBox,
                    Text(
                      'Add Category',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kAccentColor,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
