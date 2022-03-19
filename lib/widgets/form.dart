import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';
import 'package:projectv/utility/sizes.dart';
import 'package:projectv/widgets/text/standard_title_text.dart';

class AppForm extends StatelessWidget {

  final String? title, submitText;
  final List<String> fields;
  final List<TextEditingController> controllers;

  const AppForm({Key? key, required this.title, required this.submitText, required this.fields, required this.controllers}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.standardTitleTextSize+50+(36*fields.length)+(10*(fields.length-1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StandardTitleText(text: title ?? ""),
          SizedBox(height: 50,),
          Wrap(
            spacing: 10,
            children: List.generate(fields.length, (index) {
              return Container(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: index < controllers.length ? controllers[index] : null,
                  decoration: InputDecoration(
                    hintText: fields[index],
                    fillColor: AppColors.inputColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8)
                  ),
                ),
              );
            })
          )
        ],
      ),
    );
  }
}


