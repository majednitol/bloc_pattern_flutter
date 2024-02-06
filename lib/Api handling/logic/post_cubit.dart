import 'package:bloc_pattern/Api%20handling/data/model/post_model.dart';
import 'package:bloc_pattern/Api%20handling/data/repositories/post_repo.dart';
import 'package:bloc_pattern/Api%20handling/logic/post_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPost();
  }
  PostRepository getPostRepository = PostRepository();
  void fetchPost() async {
    try {
      List<PostModel> posts = await getPostRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
