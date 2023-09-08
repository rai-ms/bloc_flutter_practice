import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState{GAINED, LOST, INITIAL}

class InternetCubit extends Cubit<InternetState>
{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetCubit():super(InternetState.INITIAL){
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile)
        {
          emit(InternetState.GAINED);
        }
      else
        {
          emit(InternetState.LOST);
        }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}