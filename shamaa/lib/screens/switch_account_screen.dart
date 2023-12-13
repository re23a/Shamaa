import 'package:flutter/material.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/screens/sign_up/inf_acc_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/account_bloc/account_bloc_bloc.dart';
import 'package:shamaa/model/account.dart';
import 'package:shamaa/style/custom_colors.dart';

class SwitchAccountScreen extends StatefulWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);
  @override
  _SwitchAccountScreenState createState() => _SwitchAccountScreenState();
}

class _SwitchAccountScreenState extends State<SwitchAccountScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AccountBlocBloc>().add(FetchAccountId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text("تبديل الحساب"),
        leading: Container(),
      ),
      body: BlocBuilder<AccountBlocBloc, AccountBlocState>(
        builder: (context, state) {
          if (state is AccountLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetUsersSuccessState) {
            return _buildSuccessState(state.accounts);
          } else if (state is AccountErrorState) {
            return _buildErrorState(state.message);
          }
          return _buildUnknownState();
        },
      ),
    );
  }

  Widget _buildSuccessState(List<Account> accounts) {
    return Column(
      children: [
        Expanded(
            child: _buildAccountsList(accounts)), // Fixed: use sortedAccounts
        _buildAddAccountTile(),
      ],
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          _buildAddAccountTile(),
        ],
      ),
    );
  }

  Widget _buildUnknownState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Unknown state'),
          _buildAddAccountTile(),
        ],
      ),
    );
  }

  Widget _buildAccountsList(List<Account> accounts) {
    return ListView.builder(
      itemCount: accounts.length, // Use sortedAccounts for itemCount
      itemBuilder: (BuildContext context, int index) {
        var account = accounts[index]; // Use sortedAccounts for each item

        return InkWell(
          onTap: () {
            context.read<AccountBlocBloc>().add(FetchAccount(Numaber: index));
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NavBar(index: index)),
              (Route<dynamic> route) => false,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(
                      side: BorderSide(width: 0.69, color: Color(0xFF3A3A3A)),
                    ),
                  ),
                  child:
                      Image.asset("assets/c${account.creatureIndex + 1}.png"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        account.studentClass,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text(
                      account.stars.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset("assets/yellow star.png"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddAccountTile() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const InfAccScreen()));
      },
      child: Container(
        width: 335.92,
        height: 84,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey, // Assuming this is the color
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 36,
              child: Icon(Icons.add, size: 36),
            ),
            SizedBox(width: 10),
            Text(
              "اضافة حساب جديد",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
