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
      child: CircleAvatar(backgroundColor: AppColors.inputColor, backgroundImage: NetworkImage(url ?? 'https://firebasestorage.googleapis.com/v0/b/projectv-cbc7a.appspot.com/o/profilephotos%2Fdefault%2Fdefaultprofilephoto.png?alt=media&token=27c8c140-4513-4515-83b5-393479675362'),),
    );
    //return CircleAvatar(radius: size, backgroundColor: Colors.white,);
  }
}
