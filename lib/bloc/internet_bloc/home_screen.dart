
import 'package:bloc_pattern/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_pattern/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Connected "),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Disconnected "),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Internet Connected");
            } else if (state is InternetLostState) {
              return const Text("Internet Losted");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
