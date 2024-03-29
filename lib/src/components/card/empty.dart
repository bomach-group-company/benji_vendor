import 'package:benji_vendor/src/components/button/my%20elevatedButton.dart';
import 'package:benji_vendor/src/providers/constants.dart';
import 'package:benji_vendor/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCard extends StatelessWidget {
  final String emptyCardMessage;
  final String buttonTitle;
  final dynamic onPressed;
  final bool showButton;
  const EmptyCard({
    super.key,
    this.emptyCardMessage = "Oops! There is nothing here",
    this.buttonTitle = "",
    this.onPressed,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "assets/animations/empty/frame_1.json",
        ),
        kSizedBox,
        Text(
          emptyCardMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kTextGreyColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        kSizedBox,
        showButton == false
            ? const SizedBox()
            : MyElevatedButton(
                title: buttonTitle,
                onPressed: onPressed ?? () {},
              ),
      ],
    );
  }
}
