import 'package:bloc_pattern/Api%20handling/data/model/post_model.dart';
import 'package:bloc_pattern/Api%20handling/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  Future<List<PostModel>> fetchPosts() async {
    Api api = Api();
    try {
      Response response = await api.request.get('/posts');
      List<dynamic> postMap = response.data;
      return postMap.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
