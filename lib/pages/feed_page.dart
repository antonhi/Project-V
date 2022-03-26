import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/states/feed_state.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/widgets/navigation_bar.dart';

import '../controllers/controllers/controller.dart';
import '../controllers/states/state.dart';
import '../utility/colors.dart';

class FeedPage extends AppPage {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();

}

class _FeedPageState extends State<FeedPage> {
  
  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is FeedState) {
        return Stack(
          children: [
            Positioned(child: Container(
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor
              ),
            )),
            Positioned(child: Center(
              child: Container(
                width: 50,
                height: 30,
                child: ElevatedButton(onPressed: () {
                  BlocProvider.of<Controller>(context).authentication.signOut();
                }, child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black
                  ),
                )),
              ),
            )),
            Positioned(left: navigationWidth*.05, bottom: 30, child: AppNavigationBar(width: navigationWidth, page: 1,))
          ],
        );
      }
      return Container();
    });
  }

}