// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../back_office/my_product/my_product_provider.dart';
import '../../back_office/order/order_provider.dart';
import '../../theme/colors.dart';

class CategoryButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color bgColor;
  final Color categoryFontColor;
  const CategoryButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.bgColor,
    required this.categoryFontColor,
  });

  @override
  Widget build(BuildContext context) {
    MyProductProvider stream = context.watch();
    MyOrderProvider order = context.watch();

    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: null,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            title == stream.selectedItemCat || title == order.selectedItemCat
                ? kAccentColor
                : Color(
                    0xFFF2F2F2,
                  ),
        minimumSize: const Size(
          100,
          80,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
          color:
              title == stream.selectedItemCat || title == order.selectedItemCat
                  ? kPrimaryColor
                  : Color(
                      0xFF828282,
                    ),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
