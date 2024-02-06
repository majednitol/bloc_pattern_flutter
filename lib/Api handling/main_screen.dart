import 'package:bloc_pattern/Api%20handling/data/model/post_model.dart';
import 'package:bloc_pattern/Api%20handling/logic/post_cubit.dart';
import 'package:bloc_pattern/Api%20handling/logic/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Handing with dio"),
      ),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state is PostErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostLoadedState) {
            return buildPostListView(state.posts);
          }
          return const Center(child: Text("An error occured!"));
        },
      ),
    );
  }
}

Widget buildPostListView(List<PostModel> posts) {
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, index) {
        PostModel post = posts[index];
        return ListTile(
          title: Text(post.title.toString()),
          subtitle: Text(post.body.toString()),
        );
      });
}
