abstract class OnbaordingEvent {
  final int index;

  OnbaordingEvent(this.index);
}

class ChangeOnbaording extends OnbaordingEvent {
  ChangeOnbaording(super.index);
}
