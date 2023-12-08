import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamaa/blocs/athe_bloc/athe_bloc_bloc.dart';
import 'package:shamaa/blocs/onbaording_bloc/onbaording_bloc.dart';

import 'package:shamaa/screens/splash_screen.dart';
import 'package:shamaa/service/supabase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init("authLocalDataBase");
  await GetStorage.init("userLocalDataBase");
  await GetStorage.init();
  supabaseConfig();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnbaordingBloc>(
          create: (BuildContext context) => OnbaordingBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: const MaterialApp(
        locale: Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [Locale('ar')],
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
