import 'package:firebase_storage/firebase_storage.dart';

import '../../controllers/controllers/controller.dart';

class Storage {

  late FirebaseStorage storage;
  Controller? controller;

  Storage() {
    storage = FirebaseStorage.instance;
  }

  void setController(Controller controller) { this.controller = controller; }

  Future<String?> getURL() async {
    String? url;
    try {
      Reference reference = storage.ref().child('videos/default/example.mp4');
      url = await reference.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
    }
    print(url);
    return url;
  }

}