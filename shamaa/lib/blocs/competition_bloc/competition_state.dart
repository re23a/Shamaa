abstract class CompetitionState {
  final int wordIndex;
  final int letterIndex;

  CompetitionState({required this.wordIndex, required this.letterIndex});
}

class InitialState extends CompetitionState {
  InitialState({super.wordIndex = 0, super.letterIndex = 0});
}

class NewWordState extends CompetitionState {
  NewWordState({
    required super.wordIndex,
    required super.letterIndex,
  });
}

class EndState extends CompetitionState {
  EndState({
    required super.wordIndex,
    required super.letterIndex,
  });
}

class CorrectState extends CompetitionState {
  final String word;
  CorrectState(this.word,
      {required super.wordIndex, required super.letterIndex});
}

// class WrongState extends CompetitionState {
//   WrongState({required super.word, required super.index});
// }
