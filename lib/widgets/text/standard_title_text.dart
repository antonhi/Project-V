import 'package:flutter/cupertino.dart';
import 'package:projectv/utility/sizes.dart';

class StandardTitleText extends StatelessWidget {
  final String text;
  const StandardTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: AppSizes.standardTitleTextSize, fontWeight: FontWeight.bold),);
  }
}
