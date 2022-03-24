import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/states/registration_state.dart';
import 'package:projectv/pages/page.dart';

import '../controllers/controllers/controller.dart';
import '../controllers/states/state.dart';
import '../utility/colors.dart';
import '../widgets/button.dart';
import '../widgets/form.dart';

class RegistrationPage extends AppPage {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  int page = 1;
  late List<TextEditingController> controllers;
  String? email, username, password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is RegistrationState) {
        populateTextFields();
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage("images/vividlogo.png"),
                  width: 75,
                  height: 75,
                ),
                const SizedBox(height: 40,),
                AppForm(title: "Register", fields: page == 1 ? ["Email"] : ["Username", "Password"], controllers: controllers),
                const SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(onTap: () {
                        BlocProvider.of<Controller>(context).showLoginState();
                      },
                          backgroundColor: AppColors.backgroundColor,
                          textColor: Colors.white,
                          textSize: 14,
                          text: "Login",
                          width: 100,
                          height: 50,
                          alignment: Alignment.center),
                      AppButton(onTap: () {
                        BlocProvider.of<Controller>(context).authentication.signIn(email, password);
                      },
                          backgroundColor: AppColors.backgroundColor,
                          textColor: AppColors.accentColor,
                          textSize: 14,
                          text: page == 1 ? "Next" : "Submit",
                          width: 100,
                          height: 50,
                          alignment: Alignment.center)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  void populateTextFields() {
    controllers = List.generate(page == 1 ? 1 : 2, (_) => TextEditingController());
    switch (page) {
      case 1:
        if (controllers.length == 1) controllers[0].text = email ?? "";
        break;
      case 2:
        if (controllers.length == 2) {
          controllers[0].text = username ?? "";
          controllers[1].text = password ?? "";
        }
        break;
    }
  }
}
