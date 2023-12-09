import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/competition_bloc/competition_event.dart';
import 'package:shamaa/blocs/competition_bloc/competition_state.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  CompetitionBloc() : super(InitialState()) {
    int charCount = 0;
    final List<List<int>> correct = [
      [1, 3, 4, 2, 0],
      [1, 0, 2, 4, 3],
      [0, 3, 1, 4, 2],
      [1, 2, 3, 0, 4]
    ];
    final List<String> words = ["Shirt", "Child", "Chair", "Bread"];
    on<GoNextEvent>((event, emit) {
      if (event.index < 3) {
        emit(NewWordState(wordIndex: event.index + 1, letterIndex: 0));
      }
    });
    on<EnterCharEvent>((event, emit) {
      if (correct[event.wordIndex][charCount] == event.charIndex) {
        if (charCount != 4) {
          charCount++;
          emit(CorrectState(words[event.wordIndex],
              wordIndex: event.wordIndex, letterIndex: charCount));
        } else {
          event.wordIndex != 3
              ? emit(
                  NewWordState(wordIndex: event.wordIndex + 1, letterIndex: 0))
              : emit(EndState(wordIndex: event.wordIndex, letterIndex: 0));
          charCount = 0;
        }
      }
    });
  }
}
