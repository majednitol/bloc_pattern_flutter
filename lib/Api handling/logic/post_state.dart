import 'package:bloc_pattern/Api%20handling/data/model/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  String errorMessage;
  PostErrorState(this.errorMessage);
}
