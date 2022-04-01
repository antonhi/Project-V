import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:projectv/models/post.dart';
import 'package:projectv/models/user.dart';
import 'package:projectv/widgets/button.dart';
import 'package:projectv/widgets/post/post_preview.dart';
import 'package:projectv/widgets/search_bar.dart';
import 'package:projectv/widgets/text/bolded_large_text.dart';
import 'package:projectv/widgets/text/bolded_small_text.dart';
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
    List<Widget> components = getComponents();
    return InViewNotifierList(builder: (context, index) {
      return InViewNotifierWidget(id: '$index', builder: (BuildContext context, bool isInView, Widget? child) {
        if (index == 4 || index == 12 || index == 13 || (index > 16 && index % 2 != 0)) {
          return PostPreview(post: Post(id: 'id', url: 'url', type: 'video', user: 'user', title: 'Testing'), width: widget.width, isInView: isInView);
        } else {
          return components[index];
        }
      });
    }, isInViewPortCondition: (double deltaTop, double deltaBottom, double vpHeight) {
      return deltaTop < (0.4 * vpHeight) && deltaBottom > (0.4 * vpHeight);
    }, itemCount: components.length,);
  }

  List<Widget> getComponents() {
    List<Widget> widgets = [];
    widgets.add(SearchBar(controller: controller!, placeholder: 'search games, users, + more', height: 30));
    widgets.add(const SizedBox(height: 20,));
    widgets.add(Row(
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
    ));
    widgets.add(const SizedBox(height: 20,));
    widgets.add(PostPreview(post: Post(id: 'id', url: 'url', type: 'video', user: 'anton'), width: widget.width, isInView: false,));
    widgets.add(const SizedBox(height: 20,));
    widgets.add(SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(16, (index) => index % 2 == 0 ? UserPreview(user: AppUser(username: 'Stevievee')) : SizedBox(width: 20,)),
      ),
    ));
    widgets.add(const SizedBox(height: 20,));
    widgets.add(Row(
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
    ));
    widgets.add(const SizedBox(height: 10,));
    widgets.add(SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(20, (index) => index % 2 == 0 ? AppButton(onTap: (){}, backgroundColor: AppColors.inputColor, textColor: Colors.white, textSize: 12, text: 'testing', height: 50, alignment: Alignment.center, image: null) : const SizedBox(width: 10,)),
      ),
    ));
    widgets.add(const SizedBox(height: 10,));
    widgets.add(Container());
    widgets.add(Container());
    widgets.add(const SizedBox(height: 20,));
    widgets.add(const Center(child: BoldedLargeText(text: 'Recommended', color: Colors.white)));
    widgets.add(const SizedBox(height: 20,));
    List.generate(12, (_) => widgets.add(const SizedBox(height: 40,)));
    widgets.add(const SizedBox(height: 65,));
    return widgets;
  }

}
