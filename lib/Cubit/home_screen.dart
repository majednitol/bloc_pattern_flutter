// import 'package:bloc_pattern/cubit/internet_cubit.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: BlocConsumer<InternetCubit, InternetState>(
//           listener: (context, state) {
//             if (state ==InternetState.Gained) {
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                 content: Text("Connected "),
//                 backgroundColor: Colors.green,
//               ));
//             } else if (state == InternetState.Lost) {
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                 content: Text("Disconnected "),
//                 backgroundColor: Colors.red,
//               ));
//             }
//           },
//           builder: (context, state) {
//             if (state == InternetState.Gained) {
//               return const Text("Internet Connected");
//             } else if (state == InternetState.Lost) {
//               return const Text("Internet Losted");
//             } else {
//               return const Text("Loading...");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
