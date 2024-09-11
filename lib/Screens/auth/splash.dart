import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:i_learn/Screens/doctor/doctor_home_screen.dart';
import 'package:i_learn/Screens/auth/selectloginscreen.dart';
import 'package:i_learn/Screens/student/student_home_screen.dart';
import 'package:i_learn/services/shared_pref_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedSplashScreen(
          splash: Column(
            children: [
              Lottie.asset(height: 200, width: 200, 'animations/as.json'),
              const Text(
                'Smart Learn',
                style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.blueAccent,
                          blurRadius: 40,
                          offset: Offset(4, 7)),
                      Shadow(
                          color: Colors.blueAccent,
                          blurRadius: 40,
                          offset: Offset(-4, -7)),
                    ],
                    fontSize: 40,
                    fontFamily: 'Pacifico',
                    color: Colors.blueAccent),
              ),
            ],
          ),
          nextScreen: (SharedPref.getDate(key: 'kLogin')??false)? (!(SharedPref.getDate(key: 'kAccountStudent')??false))?  DoctorHomeScreen(): StudentHomeScreen()   : SelectLoginScreen(),
          backgroundColor: Colors.white,
          splashIconSize: 300,
          duration: 4000,
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
