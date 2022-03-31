import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';

class ProfilePicture extends StatelessWidget {

  final double size;
  final String? url;

  const ProfilePicture({Key? key, required this.size, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: const CircleAvatar(backgroundColor: AppColors.inputColor, backgroundImage: AssetImage('images/anime.jpg'),),
    );
    //return CircleAvatar(radius: size, backgroundColor: Colors.white,);
  }
}
