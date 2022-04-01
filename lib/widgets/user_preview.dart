import 'package:flutter/material.dart';
import 'package:projectv/models/user.dart';
import 'package:projectv/widgets/profile_picture.dart';
import 'package:projectv/widgets/text/bolded_standard_text.dart';

class UserPreview extends StatelessWidget {
  final AppUser user;

  const UserPreview({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePicture(size: 70, url: null),
        const SizedBox(height: 10,),
        BoldedStandardText(text: user.username, color: Colors.white)
      ],
    );
  }
}
