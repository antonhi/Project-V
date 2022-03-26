import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/states/feed_state.dart';
import 'package:projectv/pages/page.dart';

import '../controllers/controllers/controller.dart';
import '../controllers/states/state.dart';

class FeedPage extends AppPage {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();

}

class _FeedPageState extends State<FeedPage> {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is FeedState) {
        return Center(
          child: ElevatedButton(onPressed: () {
            BlocProvider.of<Controller>(context).authentication.signOut();
          }, child: Container(
            decoration: const BoxDecoration(
              color: Colors.white
            ),
          )),
        );
      }
      return Container();
    });
  }

}