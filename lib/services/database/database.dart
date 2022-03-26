import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controllers/controllers/controller.dart';

class Database {

  late final FirebaseFirestore firestore;
  Controller? controller;

  Database() {
    firestore = FirebaseFirestore.instance;
  }

  void setController(Controller controller) {
    this.controller = controller;
  }



}