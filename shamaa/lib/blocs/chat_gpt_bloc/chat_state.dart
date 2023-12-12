abstract class ChatState {}

class InitialState extends ChatState {}

class GetChatState extends ChatState {
  final String text;

  GetChatState({required this.text});
}
