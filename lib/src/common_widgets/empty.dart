import 'package:flutter/cupertino.dart';

class EmptyPage extends StatelessWidget {
  final String msg;
  const EmptyPage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              msg,
              style: const TextStyle(
                color: Color(0xFF9B9BA5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ]);
  }
}
