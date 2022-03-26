import 'package:projectv/models/user.dart';

import '../../models/post.dart';

class Cache {

  AppUser? user;
  late List<Post> recommendedPosts;
  late List<Post> followingPosts;
  late List<Post> trendingPosts;

  Cache() {
    recommendedPosts = [];
    followingPosts = [];
    trendingPosts = [];
  }

  void setUser(AppUser? user) {
    this.user = user;
    print(this.user != null ? this.user!.username : 'User is null');
  }

  Future<bool> refreshRecommended() async {
    throw UnimplementedError();
  }

  Future<bool> refreshFollowing() async {
    throw UnimplementedError();
  }

  Future<bool> refreshTrending() async {
    throw UnimplementedError();
  }

}