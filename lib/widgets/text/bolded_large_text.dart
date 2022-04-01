import 'package:flutter/cupertino.dart';

import '../../utility/sizes.dart';

class BoldedLargeText extends StatelessWidget {
  final String text;
  final Color color;
  const BoldedLargeText({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: AppSizes.boldedLargeTextSize,
        fontWeight: FontWeight.bold, color: color));
  }
}