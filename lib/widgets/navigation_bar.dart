import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/controllers/controller.dart';
import '../utility/colors.dart';

class AppNavigationBar extends StatefulWidget {

  final double width;
  final int page;

  const AppNavigationBar({Key? key, required this.width, required this.page}) : super(key: key);

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.width*0.9,
      decoration: BoxDecoration(
          color: AppColors.inputColor.withOpacity(0.75),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(child: Icon(Icons.play_arrow_rounded, color: widget.page == 1 ? AppColors.accentColor : Colors.white, size: widget.page == 1 ? 30 : 25,),
          onTap: () => BlocProvider.of<Controller>(context).showFeedState(),),
          GestureDetector(child: Icon(Icons.person, color: widget.page == 2 ? AppColors.accentColor : Colors.white, size: widget.page == 2 ? 30 : 25,),
          onTap: () => BlocProvider.of<Controller>(context).showProfileState(),),
          GestureDetector(child: Icon(Icons.mail_outline_rounded, color: widget.page == 3 ? AppColors.accentColor : Colors.white, size: widget.page == 3 ? 30 : 25,),
          onTap: () => BlocProvider.of<Controller>(context).showInboxState(),),
        ],
      ),
    );
  }
}

