import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/chat_gpt_bloc/chat_event.dart';
import 'package:shamaa/blocs/chat_gpt_bloc/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(InitialState()) {
    on<AddChatEvent>((event, emit) {
      emit(GetChatState(text: event.text));
    });
  }
}
