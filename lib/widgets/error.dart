import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';

class AppError extends StatelessWidget {

  final String error;

  const AppError({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.inputColor.withOpacity(0.8)
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.error, color: AppColors.accentColor, size: 25,),
            const SizedBox(width: 10,),
            Text(error, style: const TextStyle(color: AppColors.placeholderTextColor, fontSize: 12, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
