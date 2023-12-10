import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/test_bloc/test_event.dart';
import 'package:shamaa/blocs/test_bloc/test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(InitialState()) {
    on<NextQuestionEvent>((event, emit) {
      emit(NextQuestionState(questionIndex: event.questionIndex + 1));
    });

    on<SelectAnswerEvent>((event, emit) {
      emit(CorrectState(
          choiceIndex: event.choiceIndex,
          isWrong: event.choiceIndex != event.questionIndex,
          questionIndex: event.questionIndex));
    });
  }
}
