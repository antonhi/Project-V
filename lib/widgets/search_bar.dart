import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';

class SearchBar extends StatelessWidget {

  final TextEditingController controller;
  final String placeholder;
  final double height;

  const SearchBar({Key? key, required this.controller, required this.placeholder, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(Icons.search, color: Colors.white,),
        fillColor: AppColors.inputColor,
        border: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.inputColor), borderRadius: BorderRadius.circular(50)),
        errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.inputColor), borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.inputColor), borderRadius: BorderRadius.circular(50)),
        disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.inputColor), borderRadius: BorderRadius.circular(50)),
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.inputColor), borderRadius: BorderRadius.circular(50)),
        focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.inputColor), borderRadius: BorderRadius.circular(50)),
        hintMaxLines: 1,
        hintText: placeholder,
        hintStyle: const TextStyle(color: AppColors.placeholderTextColor, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10)
      ),
    );
  }
}
