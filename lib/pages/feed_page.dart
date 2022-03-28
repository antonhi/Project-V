import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/states/feed_state.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/widgets/feed/feed_recommended.dart';
import 'package:projectv/widgets/navigation_bar.dart';
import 'package:projectv/widgets/profile_picture.dart';
import 'package:projectv/widgets/text/bolded_small_text.dart';
import 'package:projectv/widgets/text/bolded_standard_text.dart';

import '../controllers/controllers/controller.dart';
import '../controllers/states/state.dart';
import '../utility/colors.dart';
import '../widgets/text/standard_text.dart';

class FeedPage extends AppPage {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();

}

class _FeedPageState extends State<FeedPage> {

  List<String> contentPages = ['Trending', 'Recommended', 'Following'];
  List<Color> colorPages = [Colors.red, Colors.blue, Colors.pink];
  int index = 1;
  PageController? pageController;

  @override
  void initState() {
    pageController ??= PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is FeedState) {
        return Stack(
          children: [
            Positioned(child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: (navigationWidth-20)/3,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                              BoldedStandardText(text: getGreeting(), color: Colors.white),
                              StandardText(text: state.user.displayName ?? '', color: AppColors.accentColor)
                            ],),
                          ),
                          SizedBox(
                            width: (navigationWidth-20)/3,
                            child: GestureDetector(child: const Image(image: AssetImage('images/vividlogo.png'), width: 50, height: 50,),
                            onTap: () => BlocProvider.of<Controller>(context).authentication.signOut(),),
                          ),
                          SizedBox(
                            width: (navigationWidth-20)/3,
                            child: Align(alignment: Alignment.centerRight,child: ProfilePicture(size: 50, url: state.user.photoURL,)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 20,
                      child: Center(
                        child: Wrap(spacing: 10, children: List.generate(3, (index) => Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: index == this.index ? AppColors.accentColor : AppColors.inputColor,
                              borderRadius: BorderRadius.circular(5)
                          ),
                        )),)
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: PageView.builder(controller: pageController, scrollDirection: Axis.horizontal, itemCount: 3, itemBuilder: (context, index) {
                        return index == 1 ? FeedRecommended(width: navigationWidth-20,) : Container(decoration: BoxDecoration(color: colorPages[index]),);
                      }, onPageChanged: (page) {
                        setState(() {
                          index = page;
                        });
                      },),
                    )
                  ],
                ),
              ),
            )),
            Positioned(left: navigationWidth*.05, bottom: 30, child: AppNavigationBar(width: navigationWidth, page: 1,))
          ],
        );
      }
      return Container();
    });
  }

  String getGreeting() {
    var now = DateTime.now();
    if (now.hour < 12) {
      return 'Good Morning';
    } else if (now.hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

}