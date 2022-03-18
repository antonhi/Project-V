import 'package:flutter/src/widgets/framework.dart';
import 'package:projectv/pages/page.dart';

class AuthenticationPage extends AppPage {
  final bool? isSignIn;
  const AuthenticationPage({Key? key, required this.isSignIn}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}