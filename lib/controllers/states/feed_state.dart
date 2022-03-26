import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectv/controllers/states/state.dart';

class FeedState extends AppState {

  final User user;

  FeedState({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];


}