import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_pattern/bloc/internet_bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? internetSubscription;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    internetSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    internetSubscription!.cancel();
    return super.close();
  }
}
