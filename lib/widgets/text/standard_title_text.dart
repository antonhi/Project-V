import 'package:flutter/cupertino.dart';
import 'package:projectv/utility/sizes.dart';

class StandardTitleText extends StatelessWidget {
  final String text;
  final Color color;
  const StandardTitleText({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: AppSizes.standardTitleTextSize,
        fontWeight: FontWeight.bold, color: color));
  }
}
