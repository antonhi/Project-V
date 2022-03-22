import 'package:flutter/cupertino.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? backgroundColor, textColor;
  final String text;
  final double textSize, width, height;
  final Alignment alignment;
  const AppButton({Key? key, required this.onTap,
  required this.backgroundColor, required this.textColor, required this.textSize,
  required this.text, required this.width, required this.height, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(height/2)
        ),
        child: Align(
          alignment: alignment,
          child: Text(text, style: TextStyle(fontSize: textSize, color: textColor, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
