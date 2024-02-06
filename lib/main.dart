import 'package:bloc_pattern/Api%20handling/data/repositories/post_repo.dart';
import 'package:bloc_pattern/Api%20handling/logic/post_cubit.dart';
import 'package:bloc_pattern/Api%20handling/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // onGenerateRoute: Routes.onGenerateRoute,
      // initialRoute: '/first',

      title: "Bloc",
      home: BlocProvider(
        create: (context) => PostCubit(),
        child: const MainScreen(),
      ),
    );
  }
}
