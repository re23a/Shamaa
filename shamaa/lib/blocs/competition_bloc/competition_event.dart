abstract class CompetitionEvent {}

class EnterCharEvent extends CompetitionEvent {
  final int charIndex;
  final int wordIndex;

  EnterCharEvent({required this.wordIndex, required this.charIndex});
}

class GoNextEvent extends CompetitionEvent {
  final String word;
  final int index;

  GoNextEvent({required this.word, required this.index});
}
