import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/pages/page_factory.dart';

import '../states/state.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Controller, AppState>(
        builder: (context, state) {
          return PageFactory.getPage(state) ?? Container();
        }),
      );
  }
}

