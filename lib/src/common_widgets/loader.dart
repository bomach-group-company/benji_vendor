import 'package:benji_vendor/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SpinKitChasingDots(
        color: kAccentColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
