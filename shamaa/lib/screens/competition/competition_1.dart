import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/competition_bloc/competition_bloc.dart';
import 'package:shamaa/blocs/competition_bloc/competition_event.dart';
import 'package:shamaa/blocs/competition_bloc/competition_state.dart';
import 'package:shamaa/screens/competition/gamification_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/letters_container.dart';

class Competition1 extends StatelessWidget {
  const Competition1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: const Text("مسابقة المفردات الانجليزية"),
      ),
      //==========================================
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<CompetitionBloc, CompetitionState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  state.wordIndex >= 3
                      ? Image.asset(
                          "assets/yellow star.png",
                        )
                      : Image.asset(
                          "assets/stars.png",
                        ),
                  state.wordIndex >= 2
                      ? Image.asset(
                          "assets/yellow star.png",
                        )
                      : Image.asset(
                          "assets/stars.png",
                        ),
                  state.wordIndex >= 1
                      ? Image.asset(
                          "assets/yellow star.png",
                        )
                      : Image.asset(
                          "assets/stars.png",
                        ),
                  Image.asset(
                    "assets/yellow star.png",
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                BlocBuilder<CompetitionBloc, CompetitionState>(
                  builder: (context, state) {
                    return Container(
                      width: 336,
                      height: 227,
                      decoration: ShapeDecoration(
                        color: state.wordIndex == 0
                            ? lightgreen
                            : state.wordIndex == 1
                                ? yellow
                                : state.wordIndex == 2
                                    ? purple
                                    : blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 119,
                          ),
                          Container(
                            width: 307,
                            height: 64,
                            decoration: ShapeDecoration(
                              color: white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child:
                                BlocBuilder<CompetitionBloc, CompetitionState>(
                              buildWhen: (oldState, newState) {
                                if (newState is CorrectState ||
                                    newState is NewWordState) {
                                  return true;
                                }
                                return false;
                              },
                              builder: (context, state) {
                                if (state is CorrectState) {
                                  return Center(
                                      child: Text(
                                    state.word.substring(0, state.letterIndex),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ));
                                }
                                return Container();
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: ShapeDecoration(
                      color: white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: BlocBuilder<CompetitionBloc, CompetitionState>(
                      builder: (context, state) {
                        return state.wordIndex == 0
                            ? Image.asset("assets/t-shirt on a hanger.png")
                            : state.wordIndex == 1
                                ? Image.asset("assets/small child.png")
                                : state.wordIndex == 2
                                    ? Image.asset("assets/blue chair.png")
                                    : Image.asset(
                                        "assets/toaster with bread.png");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Center(
              child: BlocBuilder<CompetitionBloc, CompetitionState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LettersContainer(
                        onTap: () {
                          context.read<CompetitionBloc>().add(EnterCharEvent(
                              wordIndex: state.wordIndex, charIndex: 0));
                        },
                        color: state.wordIndex == 0
                            ? lightgreen
                            : state.wordIndex == 1
                                ? yellow
                                : state.wordIndex == 2
                                    ? purple
                                    : blue,
                        text: state.wordIndex == 0
                            ? "T"
                            : state.wordIndex == 1
                                ? "H"
                                : state.wordIndex == 2
                                    ? "C"
                                    : "A",
                      ),
                      LettersContainer(
                        onTap: () {
                          context.read<CompetitionBloc>().add(EnterCharEvent(
                              wordIndex: state.wordIndex, charIndex: 1));
                        },
                        color: state.wordIndex == 0
                            ? lightgreen
                            : state.wordIndex == 1
                                ? yellow
                                : state.wordIndex == 2
                                    ? purple
                                    : blue,
                        text: state.wordIndex == 0
                            ? "S"
                            : state.wordIndex == 1
                                ? "C"
                                : state.wordIndex == 2
                                    ? "A"
                                    : "B",
                      ),
                      LettersContainer(
                        onTap: () {
                          context.read<CompetitionBloc>().add(EnterCharEvent(
                              wordIndex: state.wordIndex, charIndex: 2));
                        },
                        color: state.wordIndex == 0
                            ? lightgreen
                            : state.wordIndex == 1
                                ? yellow
                                : state.wordIndex == 2
                                    ? purple
                                    : blue,
                        text: state.wordIndex == 0
                            ? "R"
                            : state.wordIndex == 1
                                ? "I"
                                : state.wordIndex == 2
                                    ? "R"
                                    : "R",
                      ),
                      LettersContainer(
                        onTap: () {
                          context.read<CompetitionBloc>().add(EnterCharEvent(
                              wordIndex: state.wordIndex, charIndex: 3));
                        },
                        color: state.wordIndex == 0
                            ? lightgreen
                            : state.wordIndex == 1
                                ? yellow
                                : state.wordIndex == 2
                                    ? purple
                                    : blue,
                        text: state.wordIndex == 0
                            ? "H"
                            : state.wordIndex == 1
                                ? "D"
                                : state.wordIndex == 2
                                    ? "H"
                                    : "E",
                      ),
                      LettersContainer(
                        onTap: () {
                          context.read<CompetitionBloc>().add(EnterCharEvent(
                              wordIndex: state.wordIndex, charIndex: 4));
                        },
                        color: state.wordIndex == 0
                            ? lightgreen
                            : state.wordIndex == 1
                                ? yellow
                                : state.wordIndex == 2
                                    ? purple
                                    : blue,
                        text: state.wordIndex == 0
                            ? "I"
                            : state.wordIndex == 1
                                ? "L"
                                : state.wordIndex == 2
                                    ? "I"
                                    : "D",
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          BlocBuilder<CompetitionBloc, CompetitionState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  if (state.wordIndex < 3) {
                    context
                        .read<CompetitionBloc>()
                        .add(GoNextEvent(word: 'word', index: state.wordIndex));
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GamificationScreen()),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                child: Container(),
              );
            },
          ),
          BlocListener<CompetitionBloc, CompetitionState>(
            listener: (context, state) {
              if (state is EndState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GamificationScreen()),
                  (Route<dynamic> route) => false,
                );
              }
            },
            child: Container(),
          )
        ],
      ),
    );
  }
}
