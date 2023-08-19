// ignore_for_file: file_names

import 'package:benji_vendor/back_office/my_product/my_product_provider.dart';
import 'package:benji_vendor/back_office/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category button.dart';

class CategoryButtonSection extends StatelessWidget {
  const CategoryButtonSection({
    super.key,
    required List category,
    required List<Color> categorybgColor,
    required List<Color> categoryFontColor,
    required isOrder,
  })  : _category = category,
        _categorybgColor = categorybgColor,
        _categoryFontColor = categoryFontColor,
        _isOrder = isOrder;

  final List _category;
  final List<Color> _categorybgColor;
  final List<Color> _categoryFontColor;
  final bool _isOrder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: _category.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: CategoryButton(
            onPressed: () {
              if (_isOrder == true) {
                MyOrderProvider action =
                    Provider.of<MyOrderProvider>(context, listen: false);
                action.addSelectedCat(_category[index]);
              } else {
                MyProductProvider action =
                    Provider.of<MyProductProvider>(context, listen: false);
                action.addSelectedCat(_category[index]);
              }
            },
            title: _category[index],
            bgColor: _categorybgColor[index],
            categoryFontColor: _categoryFontColor[index],
          ),
        ),
      ),
    );
  }
}
