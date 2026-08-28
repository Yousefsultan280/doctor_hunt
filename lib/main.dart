import 'package:doctor_hunt/app/core/routers/app_router.dart';
import 'package:doctor_hunt/app/features/appointment/presentation/screens/appointment_screen1.dart';
import 'package:doctor_hunt/app/features/appointment/presentation/screens/appointment_screen2.dart';
import 'package:doctor_hunt/app/features/favoirte/presentation/screens/favorite_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/find_doctor_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/select_time_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
