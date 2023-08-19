// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:benji_vendor/back_office/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../providers/constants.dart';
import '../reusable widgets/email textformfield.dart';
import '../reusable widgets/my appbar.dart';
import '../reusable widgets/my fixed snackBar.dart';
import '../reusable widgets/name textformfield.dart';
import '../reusable widgets/password textformfield.dart';
import '../reusable widgets/reusable authentication first half.dart';
import '../splash screens/signup splash screen.dart';
import '../theme/colors.dart';
import '../utility/operations.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //=========================== ALL VARIABBLES ====================================\\

  //=========================== CONTROLLERS ====================================\\

  TextEditingController userFirstNameEC = TextEditingController();
  TextEditingController userLastNameEC = TextEditingController();
  TextEditingController userEmailEC = TextEditingController();
  TextEditingController userPasswordEC = TextEditingController();

  TextEditingController userAddressEC = TextEditingController();
  TextEditingController userUsernameEC = TextEditingController();
  TextEditingController userShopNameEC = TextEditingController();
  TextEditingController userPhoneEC = TextEditingController();

  //=========================== KEYS ====================================\\

  final _formKey = GlobalKey<FormState>();

  //=========================== BOOL VALUES ====================================\\
  bool isLoading = false;
  bool isChecked = false;
  bool isPWSuccess = false;
  var isObscured;

  //=========================== STYLE ====================================\\

  TextStyle myAccentFontStyle = TextStyle(
    color: kAccentColor,
  );

  //=========================== FOCUS NODES ====================================\\
  FocusNode userFirstNameFN = FocusNode();
  FocusNode userLastNameFN = FocusNode();
  FocusNode userEmailFN = FocusNode();
  FocusNode userPasswordFN = FocusNode();
  FocusNode userAddressFN = FocusNode();
  FocusNode userUsernameFN = FocusNode();
  FocusNode userShopNameFN = FocusNode();
  FocusNode userPhoneFN = FocusNode();

  //=========================== FUNCTIONS ====================================\\
  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });

    // Simulating a delay of 3 seconds
    await Future.delayed(const Duration(seconds: 2));

    //Display snackBar
    myFixedSnackBar(
      context,
      "Signup Successful".toUpperCase(),
      kSuccessColor,
      const Duration(
        seconds: 2,
      ),
    );

    // Navigate to the new page
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SignUpSplashScreen()),
      (route) => false,
    );

    setState(() {
      isLoading = false;
    });
  }

  //=========================== INITIAL STATE ====================================\\
  @override
  void initState() {
    super.initState();
    isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider stream = context.watch<AuthProvider>();
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        resizeToAvoidBottomInset: true,
        appBar: const MyAppBar(
          title: "",
          toolbarHeight: kToolbarHeight,
          backgroundColor: kTransparentColor,
          elevation: 0.0,
          actions: [],
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              const ReusableAuthenticationFirstHalf(
                title: "Sign up",
                subtitle: "Please sign up to get started",
                decoration: BoxDecoration(),
                imageContainerHeight: 0,
              ),
              kSizedBox,
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    top: kDefaultPadding / 2,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        24,
                      ),
                      topRight: Radius.circular(
                        24,
                      ),
                    ),
                    color: kPrimaryColor,
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              child: Text(
                                'First Name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            NameTextFormField(
                              controller: userFirstNameEC,
                              validator: (value) {
                                RegExp userNamePattern = RegExp(
                                  r'^.{3,}$', //Min. of 3 characters
                                );
                                if (value == null || value!.isEmpty) {
                                  userFirstNameFN.requestFocus();
                                  return "Enter your first name";
                                } else if (!userNamePattern.hasMatch(value)) {
                                  userFirstNameFN.requestFocus();
                                  return "Name must be at least 3 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userFirstNameEC.text = value;
                              },
                              textInputAction: TextInputAction.next,
                              nameFocusNode: userFirstNameFN,
                              hintText: "Enter first name",
                            ),
                            kSizedBox,
                            const SizedBox(
                              child: Text(
                                'Last Name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            NameTextFormField(
                              controller: userLastNameEC,
                              validator: (value) {
                                RegExp userNamePattern = RegExp(
                                  r'^.{3,}$', //Min. of 3 characters
                                );
                                if (value == null || value!.isEmpty) {
                                  userLastNameFN.requestFocus();
                                  return "Enter your last name";
                                } else if (!userNamePattern.hasMatch(value)) {
                                  userLastNameFN.requestFocus();
                                  return "Name must be at least 3 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userLastNameEC.text = value;
                              },
                              textInputAction: TextInputAction.next,
                              nameFocusNode: userLastNameFN,
                              hintText: "Enter last name",
                            ),
                            kSizedBox,
                            const SizedBox(
                              child: Text(
                                'Email',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            EmailTextFormField(
                              controller: userEmailEC,
                              emailFocusNode: userEmailFN,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                RegExp emailPattern = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                                );
                                if (value == null || value!.isEmpty) {
                                  userEmailFN.requestFocus();
                                  return "Enter your email address";
                                } else if (!emailPattern.hasMatch(value)) {
                                  userEmailFN.requestFocus();
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userEmailEC.text = value;
                              },
                            ),
                            kSizedBox,
                            const SizedBox(
                              child: Text(
                                'Phone number ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            NameTextFormField(
                              controller: userPhoneEC,
                              validator: (value) {
                                if (value == null || value!.isEmpty) {
                                  userPhoneFN.requestFocus();
                                  return "Enter Phone number";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userPhoneEC.text = value;
                              },
                              textInputAction: TextInputAction.next,
                              nameFocusNode: userPhoneFN,
                              hintText: "Enter phone number",
                              type: TextInputType.number,
                            ),
                            kSizedBox,
                            const SizedBox(
                              child: Text(
                                'Username',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            NameTextFormField(
                              controller: userUsernameEC,
                              validator: (value) {
                                RegExp userNamePattern = RegExp(
                                  r'^.{3,}$', //Min. of 3 characters
                                );
                                if (value == null || value!.isEmpty) {
                                  userUsernameFN.requestFocus();
                                  return "Enter your Username";
                                } else if (!userNamePattern.hasMatch(value)) {
                                  userUsernameFN.requestFocus();
                                  return "Username must be at least 3 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userUsernameEC.text = value;
                              },
                              textInputAction: TextInputAction.next,
                              nameFocusNode: userUsernameFN,
                              hintText: "Enter username",
                            ),
                            kSizedBox,
                            const SizedBox(
                              child: Text(
                                'Shop name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            NameTextFormField(
                              controller: userShopNameEC,
                              validator: (value) {
                                RegExp userNamePattern = RegExp(
                                  r'^.{1,}$', //Min. of 3 characters
                                );
                                if (value == null || value!.isEmpty) {
                                  userShopNameFN.requestFocus();
                                  return "Enter your shop name";
                                } else if (!userNamePattern.hasMatch(value)) {
                                  userShopNameFN.requestFocus();
                                  return "Shop name must be at least 2 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userShopNameEC.text = value;
                              },
                              textInputAction: TextInputAction.next,
                              nameFocusNode: userShopNameFN,
                              hintText: "Enter shop name",
                            ),
                            kSizedBox,
                            const SizedBox(
                              child: Text(
                                'Address ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            NameTextFormField(
                              controller: userAddressEC,
                              validator: (value) {
                                RegExp userNamePattern = RegExp(
                                  r'^.{3,}$', //Min. of 3 characters
                                );
                                if (value == null || value!.isEmpty) {
                                  userAddressFN.requestFocus();
                                  return "Enter your address";
                                } else if (!userNamePattern.hasMatch(value)) {
                                  userAddressFN.requestFocus();
                                  return "address must be at least 3 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userAddressEC.text = value;
                              },
                              textInputAction: TextInputAction.next,
                              nameFocusNode: userAddressFN,
                              hintText: "Enter address",
                            ),
                            kSizedBox,
                            const SizedBox(
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: Color(
                                    0xFF31343D,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            PasswordTextFormField(
                              controller: userPasswordEC,
                              passwordFocusNode: userPasswordFN,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isObscured,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                RegExp passwordPattern = RegExp(
                                  r'^.{8,}$',
                                );
                                if (value == null || value!.isEmpty) {
                                  userPasswordFN.requestFocus();
                                  return "Enter your password";
                                } else if (!passwordPattern.hasMatch(value)) {
                                  userPasswordFN.requestFocus();
                                  return "Password must be at least 8 characters";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userPasswordEC.text = value;
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscured = !isObscured;
                                  });
                                },
                                icon: isObscured
                                    ? const Icon(
                                        Icons.visibility,
                                      )
                                    : Icon(
                                        Icons.visibility_off_rounded,
                                        color: kSecondaryColor,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      kHalfSizedBox,
                      FlutterPwValidator(
                        uppercaseCharCount: 1,
                        lowercaseCharCount: 1,
                        numericCharCount: 1,
                        controller: userPasswordEC,
                        width: 400,
                        height: 150,
                        minLength: 8,
                        onSuccess: () async {
                          setState(() {
                            isPWSuccess = true;
                          });
                          // myFixedSnackBar(
                          //   context,
                          //   "Password matches requirement",
                          //   kSuccessColor,
                          //   const Duration(
                          //     seconds: 15,
                          //   ),
                          // );
                          // await Future.delayed(Duration(minutes: 1));
                        },
                        onFail: () {
                          setState(() {
                            isPWSuccess = false;
                          });
                        },
                      ),
                      kSizedBox,
                      stream.loadRegister
                          ? Center(
                              child: SpinKitChasingDots(
                                color: kAccentColor,
                                duration: const Duration(seconds: 2),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: (() async {
                                if (_formKey.currentState!.validate()) {
                                  Operations.signUpPageOperations(
                                      context,
                                      userFirstNameEC.text,
                                      userLastNameEC.text,
                                      userEmailEC.text,
                                      userPasswordEC.text,
                                      userUsernameEC.text,
                                      userShopNameEC.text,
                                      userAddressEC.text, userPasswordEC.text);
                                  //    loadData();
                                }
                              }),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kAccentColor,
                                maximumSize: Size(
                                  MediaQuery.of(context).size.width,
                                  62,
                                ),
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width,
                                  60,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    16,
                                  ),
                                ),
                                elevation: 10,
                                shadowColor: kDarkGreyColor,
                              ),
                              child: Text(
                                "Sign up".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                      kHalfSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Color(
                                0xFF646982,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: Text(
                              "Log in",
                              style: myAccentFontStyle,
                            ),
                          ),
                        ],
                      ),
                      kHalfSizedBox,
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "Or sign up with ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(
                                  0xFF646982,
                                ),
                              ),
                            ),
                            kSizedBox,
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                    color: kGreyColor1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/icons/google-signup-icon.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Google",
                                      style: TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            kSizedBox,
                          ],
                        ),
                      ),
                    ],
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
