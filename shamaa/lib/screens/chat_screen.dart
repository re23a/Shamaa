import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shamaa/blocs/chat_gpt_bloc/chat_bloc.dart';
import 'package:shamaa/blocs/chat_gpt_bloc/chat_event.dart';
import 'package:shamaa/blocs/chat_gpt_bloc/chat_state.dart';
import 'package:shamaa/service/openai_api.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/textFeild_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: const Text("مساعدك الشخصي"),
          backgroundColor: purple,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        bottomSheet: ChatTextField(
          controller: textController,
          onPressed: () {
            context
                .read<ChatBloc>()
                .add(AddChatEvent(text: textController.text));
            textController.text = '';
          },
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 100),
          children: [
            const ChatContainer(
              isMine: false,
              message: 'مرحبا, كيف يمكنني مساعدتك؟',
            ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is GetChatState) {
                  return Column(
                    children: [
                      ChatContainer(
                        isMine: true,
                        message: state.text,
                      ),
                      FutureBuilder(
                          future: chatGPT(state.text),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ChatContainer(
                                isMine: false,
                                message: snapshot.data!,
                              );
                            } else {
                              return Center(
                                child: JumpingDotsProgressIndicator(
                                  fontSize: 50.0,
                                ),
                              );
                            }
                          })
                    ],
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
