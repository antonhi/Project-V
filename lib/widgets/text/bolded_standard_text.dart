import 'package:flutter/cupertino.dart';

import '../../utility/sizes.dart';

class BoldedStandardText extends StatelessWidget {
  final String text;
  final Color color;
  const BoldedStandardText({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: AppSizes.standardTextSize,
        fontWeight: FontWeight.bold, color: color));
  }
}