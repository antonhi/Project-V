import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/states/login_state.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/widgets/button.dart';
import 'package:projectv/widgets/error.dart';
import 'package:projectv/widgets/form.dart';

import '../controllers/controllers/controller.dart';
import '../controllers/states/state.dart';
import '../utility/colors.dart';

class LoginPage extends AppPage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? email, password, error;
  late List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is LoginState) {
        populateTextFields();
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                error == null ? const SizedBox(height: 0,) : AppError(error: error!),
                const Image(
                  image: AssetImage("images/vividlogo.png"),
                  width: 75,
                  height: 75,
                ),
                const SizedBox(height: 40,),
                AppForm(title: "Log In", fields: const ["Email", "Password"], controllers: controllers),
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
                        BlocProvider.of<Controller>(context).showRegistrationState();
                      },
                          backgroundColor: AppColors.backgroundColor,
                          textColor: Colors.white,
                          textSize: 14,
                          text: "Register",
                          width: 100,
                          height: 50,
                          alignment: Alignment.center,
                          image: null,),
                      AppButton(onTap: () async {
                        String? res = await BlocProvider.of<Controller>(context).authentication.signIn(email, password);
                        if (res != null) {
                          setState(() {
                            error = res;
                          });
                        }
                      },
                          backgroundColor: AppColors.inputColor,
                          textColor: AppColors.accentColor,
                          textSize: 14,
                          text: "Submit",
                          width: 120,
                          height: 50,
                          alignment: Alignment.center,
                          image: null)
                    ],
                  ),
                ),
                const SizedBox(height: 20,)
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
    controllers = List.generate(2, (_) => TextEditingController());
    if (controllers.length != 2) return;
    controllers[0].text = email ?? "";
    controllers[1].text = password ?? "";
  }
}
