abstract class ChatEvent {}

class AddChatEvent extends ChatEvent {
  final String text;

  AddChatEvent({required this.text});
}
