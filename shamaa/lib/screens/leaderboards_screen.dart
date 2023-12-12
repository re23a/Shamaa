import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/account_bloc/account_bloc_bloc.dart';
import 'package:shamaa/model/account.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/app_bar.dart';

class LeaderboardsScreen extends StatefulWidget {
  const LeaderboardsScreen({Key? key}) : super(key: key);
  @override
  _LeaderboardsScreenState createState() => _LeaderboardsScreenState();
}

class _LeaderboardsScreenState extends State<LeaderboardsScreen> {
  void initState() {
    super.initState();
    context.read<AccountBlocBloc>().add(FetchAccounts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        leading: const ChatGPTBottom(),
        title: const title(),
      ),
      body: BlocBuilder<AccountBlocBloc, AccountBlocState>(
        builder: (context, state) {
          if (state is GetUsersSuccessState) {
            if (state.accounts.isNotEmpty) {
              var sortedAccounts = List<Account>.from(state.accounts);
              sortedAccounts.sort((a, b) => b.stars.compareTo(a.stars));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildThirdLeaderboard(sortedAccounts[2]),
                      _buildTopLeaderboard(sortedAccounts[0]),
                      _buildSecondLeaderboard(sortedAccounts[1]),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 20),
                      itemCount: sortedAccounts.length - 1,
                      itemBuilder: (context, index) {
                        final account = sortedAccounts[index];
                        return _buildLeaderboardRow(
                            account.name,
                            account.stars.toString(),
                            "assets/c${account.creatureIndex + 1}.png",
                            "assets/6666.png");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      color: white,
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: Text('No data'));
            }
          } else if (state is AccountErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildTopLeaderboard(Account account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/c${account.creatureIndex + 1}.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(account.name),
            const SizedBox(width: 5),
            Text(account.stars.toString()),
            Image.asset("assets/text with three stars.png")
          ],
        ),
        Image.asset("assets/win.png"),
      ],
    );
  }

  Widget _buildSecondLeaderboard(Account account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/c${account.creatureIndex + 1}.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(account.name),
            const SizedBox(width: 5),
            Text(account.stars.toString()),
            Image.asset("assets/text with three stars.png")
          ],
        ),
        Image.asset("assets/Group 632712.png"),
      ],
    );
  }

  Widget _buildThirdLeaderboard(Account account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/c${account.creatureIndex + 1}.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(account.name),
            const SizedBox(width: 5),
            Text(account.stars.toString()),
            Image.asset("assets/text with three stars.png")
          ],
        ),
        Image.asset("assets/Group 632711.png"),
      ],
    );
  }

  Widget _buildLeaderboardRow(
      String name, String score, String avatarAsset, String starsAsset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
