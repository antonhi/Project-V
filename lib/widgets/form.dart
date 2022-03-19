import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';
import 'package:projectv/widgets/text/standard_title_text.dart';

class AppForm extends StatelessWidget {

  final String? title;
  final List<String> fields;
  final List<TextEditingController> controllers;

  const AppForm({Key? key, required this.title, required this.fields, required this.controllers}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StandardTitleText(text: title ?? "", color: Colors.white,),
          SizedBox(height: 10,),
          Wrap(
            runSpacing: 10,
            children: List.generate(fields.length, (index) {
              return TextField(
                textInputAction: index == fields.length-1 ? TextInputAction.done : TextInputAction.next,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                controller: index < controllers.length ? controllers[index] : null,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.accentColor)
                  ),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.accentColor)
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.accentColor, width: 2)
                  ),
                  disabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.accentColor)
                  ),
                  hintText: fields[index],
                  hintStyle: const TextStyle(fontSize: 16, color: AppColors.placeholderTextColor),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
                ),
              );
            })
          )
        ],
      ),
    );
  }
}


