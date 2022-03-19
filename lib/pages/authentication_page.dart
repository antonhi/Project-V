import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/controllers/states/authentication_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/pages/page.dart';
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
        controllers = getControllers(state.isSignIn);
        return AppForm(title: getTitle(state.isSignIn),
            submitText: getSubmitText(state.isSignIn),
            fields: getFields(state.isSignIn),
            controllers: controllers);
      }
      return Container();
    });
  }

  String getTitle(bool isSignIn) {
    return isSignIn ? "Sign In" : "Join";
  }

  String getSubmitText(bool isSignIn) {
    return isSignIn ? "Submit" : "Sign Up";
  }

  List<String> getFields(bool isSignIn) {
    return isSignIn ? ["Email", "Password"] : ["Username", "Email", "Password"];
  }

  List<TextEditingController> getControllers(bool isSignIn) {
    return List.generate(getFields(isSignIn).length, (_) => TextEditingController());
  }


}