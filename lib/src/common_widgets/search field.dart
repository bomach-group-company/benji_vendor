// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class SearchField extends StatelessWidget {
  SearchField({
    super.key,
    required this.searchController,
    required this.hintText,
    required this.change
  });

  final String hintText;
  TextEditingController searchController;
  Function(String) change;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onSubmitted: ,
      controller: searchController,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      enableSuggestions: true,
      autocorrect: true,
      canRequestFocus: true,
      cursorColor: kSecondaryColor,
      onChanged: change,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(
            0x662F2E3C,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 30,
        ),
        prefixIconColor: const Color(
          0x662F2E3C,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/icons/search-filter-icon.png",
          ),
        ),
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
      ),
    );
  }
}
