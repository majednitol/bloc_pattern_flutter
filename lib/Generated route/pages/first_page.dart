import 'package:bloc_pattern/Generated%20route/cubit/first.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
        actions: [
          IconButton(
              onPressed: () => {Navigator.pushNamed(context, "/second",arguments: {
                'title':'DYNAMIC TITLE'
              })},
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: BlocBuilder<FirstCubit, int>(
        builder: (context, state) {
          return Center(child: Text(state.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => BlocProvider.of<FirstCubit>(context).increment()),
    );
  }
}
