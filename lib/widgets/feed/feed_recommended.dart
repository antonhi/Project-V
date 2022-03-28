import 'package:flutter/material.dart';
import 'package:projectv/models/post.dart';
import 'package:projectv/models/user.dart';
import 'package:projectv/widgets/button.dart';
import 'package:projectv/widgets/post/post_preview.dart';
import 'package:projectv/widgets/search_bar.dart';
import 'package:projectv/widgets/text/bolded_large_text.dart';
import 'package:projectv/widgets/text/bolded_small_text.dart';
import 'package:projectv/widgets/text/standard_text.dart';
import 'package:projectv/widgets/user_preview.dart';

import '../../utility/colors.dart';

class FeedRecommended extends StatefulWidget {

  final double width;

  const FeedRecommended({Key? key, required this.width}) : super(key: key);

  @override
  State<FeedRecommended> createState() => _FeedRecommendedState();
}

class _FeedRecommendedState extends State<FeedRecommended> {

  TextEditingController? controller;

  @override
  void initState() {
    controller ??= TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SearchBar(controller: controller!, placeholder: 'search games, users, + more', height: 30),
      const SizedBox(height: 30,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BoldedLargeText(text: 'Following', color: Colors.white),
          Row(
            children: [
              BoldedSmallText(text: 'swipe left', color: AppColors.alternateTextColor),
              Icon(Icons.chevron_right, color: AppColors.alternateTextColor,)
            ],
          ),
        ],
      ),
      const SizedBox(height: 30,),
      PostPreview(post: Post(id: 'id', url: 'url', type: 'image', user: 'anton', title: 'Testing Title', description: 'This is a test of the post description'), width: widget.width),
      const SizedBox(height: 20,),
      SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(16, (index) => index % 2 == 0 ? UserPreview(user: AppUser(username: 'Stevievee')) : SizedBox(width: 20,)),
        ),
      ),
      const SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.chevron_left, color: AppColors.alternateTextColor,),
              BoldedSmallText(text: 'swipe right', color: AppColors.alternateTextColor),
            ],
          ),
          const BoldedLargeText(text: 'Trending', color: Colors.white),
        ],
      ),
      const SizedBox(height: 10,),
      SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(20, (index) => index % 2 == 0 ? AppButton(onTap: (){}, backgroundColor: AppColors.inputColor, textColor: Colors.white, textSize: 12, text: 'testing', height: 50, alignment: Alignment.center, image: null) : const SizedBox(width: 10,)),
        ),
      ),
      const SizedBox(height: 10,),
      Wrap(
        direction: Axis.vertical,
        spacing: 20,
        children: List.generate(2, (_) => PostPreview(post: Post(id: 'id', url: 'url', type: 'image', user: 'anton'), width: widget.width),),
      ),
      const SizedBox(height: 20,),
      const Center(child: BoldedLargeText(text: 'Recommended', color: Colors.white)),
      const SizedBox(height: 20,),
      Wrap(
        direction: Axis.vertical,
        spacing: 20,
        children: List.generate(6, (_) => PostPreview(post: Post(id: 'id', url: 'url', type: 'image', user: 'anton'), width: widget.width),),
      ),
      const SizedBox(height: 65,)
    ]);
  }
}
