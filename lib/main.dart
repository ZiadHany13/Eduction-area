import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/auth/splash.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/services/shared_pref_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider (create: (BuildContext context) => AppCubit()),
        ],
        child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const SplashScreen(),
    });
  }
}
