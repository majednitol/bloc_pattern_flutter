import 'package:bloc_pattern/Generated%20route/cubit/third.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
      ),
      body: BlocBuilder<ThirdCubit, int>(
        builder: (context, state) {
          return Center(child: Text(state.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => BlocProvider.of<ThirdCubit>(context).increment()),
    );
  }
}
