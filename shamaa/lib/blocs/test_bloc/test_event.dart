abstract class TestEvent {
  final int questionIndex;

  TestEvent({required this.questionIndex});
}

class SelectAnswerEvent extends TestEvent {
  final int choiceIndex;
  SelectAnswerEvent({required this.choiceIndex, required super.questionIndex});
}

class NextQuestionEvent extends TestEvent {
  NextQuestionEvent({required super.questionIndex});
}
