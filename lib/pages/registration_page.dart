import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/states/registration_state.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/widgets/error.dart';

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
  List<TextEditingController>? controllers;
  String? email, username, password, error;

  @override
  void initState() {
    if (controllers == null) {
      initializeControllers();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    populateTextFields();
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is RegistrationState) {
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
                AppForm(title: 'Register', fields: page == 1 ? ['Email'] : ['Username', 'Password'], controllers: controllers!),
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
                          text: 'Login',
                          width: 100,
                          height: 50,
                          alignment: Alignment.center,
                          image: null,),
                      AppButton(onTap: () {
                        if (page == 2) {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          persistTextFields();
                          setState(() {
                            page = 1;
                          });
                        }
                      },
                        backgroundColor: AppColors.backgroundColor,
                        textColor: AppColors.accentColor,
                        textSize: 14,
                        text: '',
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        image: page == 1 ? null : const Icon(Icons.arrow_back, size: 20, color: Colors.white,),),
                      AppButton(onTap: () async {
                        if (page == 1) {
                          persistTextFields();
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          setState(() {
                            page = 2;
                          });
                        } else {
                          persistTextFields();
                          String? res = await BlocProvider.of<Controller>(context).authentication.signUp(email, password, username);
                          if (res != null) {
                            setState(() {
                              error = res;
                            });
                          }
                        }
                      },
                          backgroundColor: AppColors.inputColor,
                          textColor: AppColors.accentColor,
                          textSize: 14,
                          text: page == 1 ? 'Next' : 'Submit',
                          width: 100,
                          height: 50,
                          alignment: Alignment.center,
                          image: null,)
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

  void initializeControllers() {
    controllers = List.generate(2, (_) => TextEditingController());
  }

  void populateTextFields() {
    switch (page) {
      case 1:
        controllers![0].text = email ?? '';
        break;
      case 2:
        controllers![0].text = username ?? '';
        controllers![1].text = password ?? '';
        break;
    }
  }

  void persistTextFields() {
    if (page == 1) {
      email = controllers![0].text;
    } else {
      username = controllers![0].text;
      password = controllers![1].text;
    }
  }
}
