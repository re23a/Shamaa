import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/onbaording_bloc/onbaording_event.dart';
import 'package:shamaa/blocs/onbaording_bloc/onbaording_state.dart';

class OnbaordingBloc extends Bloc<OnbaordingEvent, OnbaordingState> {
  OnbaordingBloc() : super(NextOnbaording(0)) {
    on<ChangeOnbaording>((event, emit) {
      emit(NextOnbaording(event.index + 1));
    });
  }
}
