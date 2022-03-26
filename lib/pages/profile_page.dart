import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/states/profile_state.dart';
import 'package:projectv/pages/page.dart';

import '../controllers/controllers/controller.dart';
import '../controllers/states/state.dart';
import '../utility/colors.dart';
import '../widgets/navigation_bar.dart';

class ProfilePage extends AppPage {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<Controller, AppState>(builder: (context, state) {
      if (state is ProfileState) {
        return Stack(
          children: [
            Positioned(child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.backgroundColor
              ),
            )),
            Positioned(left: navigationWidth*.05, bottom: 30, child: AppNavigationBar(width: navigationWidth, page: 2,))
          ],
        );
      }
      return Container();
    });
  }
}
