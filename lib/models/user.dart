import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectv/models/model.dart';

import '../services/database/database.dart';

class AppUser extends Model {

  late String username;
  String? bio;
  List<String>? posts, followers, following;

  AppUser({required this.username, this.bio, this.posts, this.followers, this.following});

  Future<bool> addUser(Database database, String uid) async {
    bool success = true;
    await database.firestore.collection('users').doc(uid).set({'username': username, 'bio': '','posts': [], 'followers': [], 'following': []})
        .catchError((error) => success = false);
    return success;
  }

  Future<bool> updateUsername(Database database, String newUsername) async {
    Query query = database.firestore.collection('users').where('username', isEqualTo: username);
    QuerySnapshot querySnapshot = await query.get();
    bool success = false;
    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      if (documentSnapshot.exists) {
        DocumentReference reference = documentSnapshot.reference;
        await reference.update({'username': newUsername}).then((value) => success = true);
        break;
      }
    }
    if (success) username = newUsername;
    return success;
  }

  static Future<AppUser?> getAppUserFromUser(Database database, User? user) async {
    if (user == null) return null;
    DocumentSnapshot<Map<String, dynamic>> snapshot = await database.firestore.collection('users').doc(user.uid).get();
    if (snapshot.exists && snapshot.data() != null) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return AppUser(username: data['username'], bio: data['bio'], posts: data['posts'], followers: data['followers']);
    }
    return null;
  }

  static Future<bool> userExists(Database database, String username) async {
    Query query = database.firestore.collection('users').where('username', isEqualTo: username);
    QuerySnapshot querySnapshot = await query.get();
    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      if (documentSnapshot.exists) return true;
    }
    return false;
  }

}