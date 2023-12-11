import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/account_bloc/account_bloc_bloc.dart';
import 'package:shamaa/screens/settings_screen.dart';
import 'package:shamaa/screens/switch_account_screen.dart';
import 'package:shamaa/style/custom_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void initState() {
    super.initState();
    context.read<AccountBlocBloc>().add(FetchAccount());
  }

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
        title: Text("الحساب الشخصي"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                },
                child: Icon(Icons.settings)),
          )
        ],
      ),
      body: BlocBuilder<AccountBlocBloc, AccountBlocState>(
        builder: (context, state) {
          if (state is GetUserSuccessState) {
            return Column(
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 28),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SwitchAccountScreen()));
                        },
                        child: Container(
                          width: 92.15,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.62),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'تبديل الحساب',
                              style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 147,
                        height: 147,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(
                            side: BorderSide(
                                width: 0.69, color: Color(0xFF3A3A3A)),
                          ),
                        ),
                        child: Image.asset(
                            "assets/c${state.account.creatureIndex + 1}.png"),
                      ),
                      Text(
                        state.account.name,
                        style: TextStyle(
                          color: black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        state.account.studentClass,
                        style: TextStyle(
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.account.stars.toString(),
                            style: TextStyle(
                              color: black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Image.asset("assets/yellow star.png"),
                        ],
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextStyle(
                          color: purple,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        labelColor: purple,
                        unselectedLabelColor: grey,
                        indicatorWeight: 4,
                        indicatorColor: purple,
                        tabs: const [
                          Tab(text: "الدروس والمسابقات"),
                          Tab(text: "المراجع"),
                        ],
                      ),
                    ),
                    Container(
                        color: white,
                        height: 350,
                        child: TabBarView(children: [
                          Icon(Icons.add_a_photo),
                          Icon(Icons.access_alarm)
                        ]))
                  ]),
                ),
              ],
            );
          } else if (state is AccountErrorState) {
            return const Text("error!!");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
