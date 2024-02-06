import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
enum InternetState { Initial, Gained, Lost }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? internetSubscription;
  InternetCubit() : super(InternetState.Initial) {
    internetSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.Gained);
      } else {
        emit(InternetState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }
}
