import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/controllers/states/authentication_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/utility/colors.dart';
import 'package:projectv/widgets/form.dart';

class AuthenticationPage extends AppPage {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override

  late List<TextEditingController> controllers;

  Widget build(BuildContext context) {
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is AuthenticationState) {
        controllers = getControllers(state.isSignIn, state.page);
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  width: 75,
                  height: 75,
                  image: AssetImage("images/vividlogo.png"),
                ),
                SizedBox(height: 40,),
                AppForm(title: getTitle(state.isSignIn),
                    fields: getFields(state.isSignIn, state.page),
                    controllers: controllers),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
        );
      }
      return Container();
    });
  }

  String getTitle(bool isSignIn) {
    return isSignIn ? "Sign In" : "Join";
  }

  List<String> getFields(bool isSignIn, int page) {
    return isSignIn ? ["Email", "Password"] : (page == 1 ? ["Email"] : ["Username", "Password"]);
  }

  List<TextEditingController> getControllers(bool isSignIn, int page) {
    return List.generate(getFields(isSignIn, page).length, (_) => TextEditingController());
  }

}