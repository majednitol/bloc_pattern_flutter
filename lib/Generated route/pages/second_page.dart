import 'package:bloc_pattern/Generated%20route/cubit/second.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatefulWidget {
  final String title;

  const SecondPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/third')},
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: BlocBuilder<SecondCubit, int>(
        builder: (context, state) {
          return Center(child: Text(state.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => BlocProvider.of<SecondCubit>(context).increment()),
    );
  }
}
