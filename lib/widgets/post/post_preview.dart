import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';
import 'package:projectv/widgets/post/post_video.dart';
import 'package:projectv/widgets/profile_picture.dart';
import 'package:projectv/widgets/text/bolded_standard_text.dart';

import '../../models/post.dart';
import '../text/standard_text.dart';

class PostPreview extends StatefulWidget {

  final Post post;
  final double width;

  const PostPreview({Key? key, required this.post, required this.width}) : super(key: key);

  @override
  State<PostPreview> createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: widget.width-40,
            height: (widget.width-40)/(1920/1080),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(10), child: getPost()),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  width: (widget.width-40)/1.5,
                  height: (widget.width-40)/(1920/1080),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldedStandardText(text: widget.post.title ?? '', color: Colors.white,),
                      SizedBox(height: 5,),
                      StandardText(text: widget.post.description ?? '', color: Colors.white,),
                      Spacer(),
                      Align(alignment: Alignment.bottomRight, child: BoldedStandardText(text: widget.post.user, color: Colors.white,),)
                    ],
                  ),
                )
              ],
            )
        ),
        const SizedBox(width: 10,),
        Container(
          height: (widget.width-40)/(1920/1080),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.chevron_left, color: Colors.white,),
              Icon(Icons.comment_outlined, color: Colors.white,),
              Icon(Icons.thumb_up_alt_outlined, color: Colors.white,),
              ProfilePicture(size: 30, url: null)
            ],
          ),
        )
      ],
    );
  }

  Widget getPost() {
    if (widget.post.type == 'image') {
      return Image(image: AssetImage('images/anime.jpg'), fit: BoxFit.cover,);
    }
    return PostVideo(url: widget.post.url);
  }
}
