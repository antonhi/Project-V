import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/controllers/states/authentication_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/utility/colors.dart';
import 'package:projectv/widgets/button.dart';
import 'package:projectv/widgets/form.dart';

class AuthenticationPage extends AppPage {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override

  late List<TextEditingController> controllers;
  int page = 1;
  bool isSignIn = true;
  String? email, username, password, error;

  Widget build(BuildContext context) {
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is AuthenticationState) {
        controllers = getControllers();
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
                AppForm(title: getTitle(),
                    fields: getFields(),
                    controllers: controllers),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.alternateInputColor,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: getInputBarItems(context),
                  ),
                ),
                SizedBox(height: 20,),
                error == null ? Container() : Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(error!, style: TextStyle(color: Colors.red),),
                )
              ],
            ),
          ),
        );
      }
      return Container();
    });
  }

  String getTitle() {
    return isSignIn ? "Sign In" : "Register";
  }

  List<String> getFields() {
    return isSignIn ? ["Email", "Password"] : (page == 1 ? ["Email"] : ["Username", "Password"]);
  }

  List<TextEditingController> getControllers() {
    List<TextEditingController> controllers;
    controllers = List.generate(getFields().length, (_) => TextEditingController());
    if (isSignIn && controllers.length == 2) {
      controllers[0].text = email ?? "";
      controllers[1].text = password ?? "";
    } else if (controllers.length == 1) {
      controllers[0].text = email ?? "";
    } else if (controllers.length == 2 && page == 2){
      controllers[0].text = username ?? "";
      controllers[1].text = password ?? "";
    }
    return controllers;
  }

  List<Widget> getInputBarItems(BuildContext context) {
    return isSignIn ? [AppButton(onTap: () => toggleMethod(setState),
        backgroundColor: null,
        textColor: Colors.white,
        textSize: 14,
        text: "Register",
        width: 120,
        height: 50,
        alignment: Alignment.center,), AppButton(onTap: () => processSubmission(setState, context),
        backgroundColor: null,
        textColor: AppColors.accentColor,
        textSize: 14,
        text: "Submit",
        width: 100,
        height: 50,
      alignment: Alignment.center,)] : [AppButton(onTap: () => toggleMethod(setState),
      backgroundColor: null,
      textColor: Colors.white,
      textSize: 14,
      text: "Log In",
      width: 100,
      height: 50,
      alignment: Alignment.center,), AppButton(onTap: () => togglePage(setState),
      backgroundColor: AppColors.alternateInputColor,
      textColor: Colors.white,
      textSize: 14,
      text: page == 1 ? "" : "<--",
      width: 100,
      height: 50,
      alignment: Alignment.center,), AppButton(onTap: () => processSubmission(setState, context),
      backgroundColor: AppColors.alternateInputColor,
      textColor: Colors.white,
      textSize: 14,
      text: page == 1 ? "Next" : "Submit",
      width: 100,
      height: 50,
      alignment: Alignment.center,)];
  }

  toggleMethod (setState) {
    setState(() {
      isSignIn = !isSignIn;
      email = null;
      username = null;
      password = null;
      page = 1;
      error = null;
    });
  }

  togglePage (setState) {
    String username = controllers.isEmpty ? "" : (controllers[0].text);
    String password = controllers.length < 2 ? "" : (controllers[1].text);
    setState(() {
      page = page == 1 ? 2 : 1;
      this.username = username;
      this.password = password;
    });
  }

  processSubmission(setState, context) {
    if (isSignIn || page == 2) {
      String email = controllers.isEmpty ? "" : (controllers[0].text);
      String password = controllers.length < 2 ? "" : (controllers[1].text);
      String? result = BlocProvider.of<Controller>(context).authentication.signIn(email, password);
      if (result != null) {
        setState(() {
          error = result;
        });
      }
    } else if (page == 1) {
      String email = controllers.isEmpty ? "" : (controllers[0].text);
      setState(() {
        this.email = email;
        page = 2;
      });
    }
  }

}