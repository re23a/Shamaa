abstract class TestState {
  final int questionIndex;

  TestState({required this.questionIndex});
}

class InitialState extends TestState {
  InitialState({super.questionIndex = 0});
}

class CorrectState extends TestState {
  final bool isWrong;
  final int choiceIndex;
  CorrectState(
      {required this.choiceIndex,
      required this.isWrong,
      required super.questionIndex});
}

class WrongState extends TestState {
  WrongState({required super.questionIndex});
}

class NextQuestionState extends TestState {
  NextQuestionState({required super.questionIndex});
}
