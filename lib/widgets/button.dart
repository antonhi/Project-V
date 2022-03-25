import 'package:flutter/cupertino.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? backgroundColor, textColor;
  final String text;
  final Icon? image;
  final double textSize, width, height;
  final Alignment alignment;
  const AppButton({Key? key, required this.onTap,
  required this.backgroundColor, required this.textColor, required this.textSize,
  required this.text, required this.width, required this.height, required this.alignment,
  required this.image}) : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getComponents(),
          ),
        ),
      ),
    );
  }

  List<Widget> getComponents() {
    if (image == null) {
      return [Text(text, style: TextStyle(fontSize: textSize, color: textColor, fontWeight: FontWeight.bold),)];
    } else if (image != null && text == '') {
      return [image!];
    } else {
      return [image!,
        const SizedBox(width: 5,),
        Text(text, style: TextStyle(fontSize: textSize, color: textColor, fontWeight: FontWeight.bold),)];
    }

  }
}
