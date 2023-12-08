import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/account_bloc/account_bloc_bloc.dart';
import 'package:shamaa/model/account.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/app_bar.dart';

class LeaderboardsScreen extends StatelessWidget {
  const LeaderboardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purple, // Replace with your color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        leading: const ChatGPTBottom(), // Your widget
        title: const title(), // Your widget
      ),
      body: BlocBuilder<AccountBlocBloc, AccountBlocState>(
        builder: (context, state) {
          if (state is AccountLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetUsersSuccessState) {
            if (state.accounts.isNotEmpty) {
              return Column(
                children: [
                  const SizedBox(height: 14),
                  _buildTopLeaderboard(state.accounts.first),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.accounts.length - 1,
                      itemBuilder: (context, index) {
                        final account = state.accounts[
                            index + 1]; // Adjust index to skip the first
                        return _buildLeaderboardRow(
                            account.name,
                            account.stars.toString(),
                            "assets/c${account.creatureIndex}.png", // Assuming you have logic to choose correct asset
                            "assets/6666.png" // Assuming you have logic for star assets
                            );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No data'));
            }
          } else if (state is AccountErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            print("____________________________");
            print("____________________________");
            return const Center(child: Text('No d111ata'));
          }
        },
      ),
    );
  }

  Widget _buildTopLeaderboard(Account account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            "assets/c${account.creatureIndex}.png"), // Assuming logic for correct asset
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(account.name),
            const SizedBox(width: 5),
            Text(account.stars.toString()),
            Image.asset(
                "assets/text with three stars.png") // Assuming logic for star assets
          ],
        ),
        Image.asset("assets/win.png"),
      ],
    );
  }

  Widget _buildLeaderboardRow(
      String name, String score, String avatarAsset, String starsAsset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 57,
                height: 57,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(width: 0.39, color: Color(0xFF3A3A3A)),
                  ),
                ),
                child: Image.asset(avatarAsset),
              ),
              const SizedBox(width: 6),
              Text(name),
            ],
          ),
          Row(
            children: [
              Text(score),
              const SizedBox(width: 5),
              Image.asset(starsAsset),
            ],
          ),
        ],
      ),
    );
  }
}
