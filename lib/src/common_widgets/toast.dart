import 'package:benji_vendor/reusable%20widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../theme/colors.dart';

inAppToast(BuildContext context, String message, {bool isError = false}) {
  showToastWidget(
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Material(
          color: isError ? Colors.red : kPrimaryColor,
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isError ? Colors.white : Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: isError
                      ? const Icon(
                          Icons.error,
                          color: Colors.white,
                          size: 42,
                        )
                      : Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.info_outline,
                            color: kAccentColor,
                          )),
                        ),
                ),
                Expanded(
                  child: AppText(
                      text: message,
                      color: isError ? Colors.white : Colors.black,
                      size: 12),
                ),
              ],
            ),
          ),
        ),
      ),
      animation: StyledToastAnimation.slideFromTop,
      duration: const Duration(seconds: 4),
      position:
          const StyledToastPosition(align: Alignment.topCenter, offset: 40.0),
      reverseCurve: Curves.easeInCubic,
      context: context);
}

inAppSnackBar(context, message, [bool? isError]) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: AppText(text: message),
    elevation: 3.0,
    backgroundColor: isError == true ? kAccentColor : kBlueLinkTextColor,
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
  ));
}
