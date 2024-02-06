import 'package:bloc_pattern/Generated%20route/cubit/first.dart';
import 'package:bloc_pattern/Generated%20route/cubit/second.dart';
import 'package:bloc_pattern/Generated%20route/cubit/third.dart';
import 'package:bloc_pattern/Generated%20route/pages/first_page.dart';
import 'package:bloc_pattern/Generated%20route/pages/second_page.dart';
import 'package:bloc_pattern/Generated%20route/pages/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: const FirstPage(),
                ));

      case "/second":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SecondCubit(),
                  child: SecondPage(
                    title: arguments['title'],
                  ),
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ThirdCubit(),
                  child: const ThirdPage(),
                ));
      default:
        return null;
    }
  }
}
