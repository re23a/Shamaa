import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/test_bloc/test_bloc.dart';
import 'package:shamaa/blocs/test_bloc/test_event.dart';
import 'package:shamaa/blocs/test_bloc/test_state.dart';
import 'package:shamaa/screens/tests/test_result_screen.dart';
import 'package:shamaa/service/supabase_request.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/tests_widgets.dart';

class Test1Screen extends StatelessWidget {
  Test1Screen({super.key, this.index});
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text("اختبار عملية القسمة"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 101,
          ),
          BlocBuilder<TestBloc, TestState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  state.questionIndex >= 2
                      ? Image.asset(
                          "assets/yellow star.png",
                        )
                      : Image.asset(
                          "assets/stars.png",
                        ),
                  state.questionIndex >= 1
                      ? Image.asset(
                          "assets/yellow star.png",
                        )
                      : Image.asset(
                          "assets/stars.png",
                        ),
                  state.questionIndex >= 0
                      ? Image.asset(
                          "assets/yellow star.png",
                        )
                      : Image.asset(
                          "assets/stars.png",
                        ),
                ],
              );
            },
          ),
          SizedBox(
            height: 36,
          ),
          Center(
            child: BlocBuilder<TestBloc, TestState>(
              builder: (context, state) {
                return Column(
                  children: [
                    BoxQusetion(
                      Q: state.questionIndex == 0
                          ? '3 ÷ 9'
                          : state.questionIndex == 1
                              ? '5 ÷ 10'
                              : '2 ÷ 12',
                    ),
                    GridView.count(
                      mainAxisSpacing: 20,
                      childAspectRatio: 3,
                      crossAxisSpacing: 17,
                      crossAxisCount: 2,
                      padding:
                          EdgeInsets.symmetric(horizontal: 27, vertical: 24),
                      shrinkWrap: true,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<TestBloc>().add(SelectAnswerEvent(
                                questionIndex: state.questionIndex,
                                choiceIndex: 0));
                          },
                          child: BoxAnswer(
                            isWrong:
                                state is CorrectState && state.choiceIndex == 0
                                    ? state.isWrong
                                    : false,
                            isCorrect: state is CorrectState
                                ? state.questionIndex == 0
                                : false,
                            txt: state.questionIndex == 0
                                ? '3'
                                : state.questionIndex == 1
                                    ? '1'
                                    : '2',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<TestBloc>().add(SelectAnswerEvent(
                                questionIndex: state.questionIndex,
                                choiceIndex: 1));
                          },
                          child: BoxAnswer(
                            isWrong:
                                state is CorrectState && state.choiceIndex == 1
                                    ? state.isWrong
                                    : false,
                            isCorrect: state is CorrectState
                                ? state.questionIndex == 1
                                : false,
                            txt: state.questionIndex == 0
                                ? '2'
                                : state.questionIndex == 1
                                    ? '2'
                                    : '3',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<TestBloc>().add(SelectAnswerEvent(
                                questionIndex: state.questionIndex,
                                choiceIndex: 2));
                          },
                          child: BoxAnswer(
                            isWrong:
                                state is CorrectState && state.choiceIndex == 2
                                    ? state.isWrong
                                    : false,
                            isCorrect: state is CorrectState
                                ? state.questionIndex == 2
                                : false,
                            txt: state.questionIndex == 0
                                ? '1'
                                : state.questionIndex == 1
                                    ? '5'
                                    : '6',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<TestBloc>().add(SelectAnswerEvent(
                                questionIndex: state.questionIndex,
                                choiceIndex: 3));
                          },
                          child: BoxAnswer(
                            isWrong:
                                state is CorrectState && state.choiceIndex == 3
                                    ? state.isWrong
                                    : false,
                            isCorrect: false,
                            txt: state.questionIndex == 0
                                ? '6'
                                : state.questionIndex == 1
                                    ? '3'
                                    : '4',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    BlocBuilder<TestBloc, TestState>(
                      builder: (context, state) {
                        if (state is CorrectState) {
                          return InkWell(
                              onTap: () async {
                                if (state.questionIndex == 2) {
                                  await increaseAccountStars(15, index!);
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TestResultScreen()));
                                }

                                context.read<TestBloc>().add(NextQuestionEvent(
                                    questionIndex: state.questionIndex));
                              },
                              child: CustomButtomBig(
                                  text: state.questionIndex == 2
                                      ? 'عرض النتائج'
                                      : "السؤال التالي",
                                  color: purple));
                        } else {
                          return Container();
                        }
                      },
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


//========================================
