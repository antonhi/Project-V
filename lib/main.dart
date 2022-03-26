import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/controllers/routes/router.dart';
import 'package:projectv/services/authentication/authentication.dart';
import 'package:projectv/services/cache/cache.dart';
import 'package:projectv/services/database/database.dart';
import 'package:projectv/services/storage/storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light
        )
      ),
      home: BlocProvider<Controller>(
        create: (context) => Controller(authentication: Authentication(), database: Database(), storage: Storage(), cache: Cache()),
        child: Routes(),
      ),
    );
  }
}
