import 'dart:async';

import 'package:doctor_hunt/app/core/routers/app_router.dart';
import 'package:doctor_hunt/app/core/utils/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Timer timer() {
    return Timer(const Duration(seconds: 4), () async {
      context.go(AppRouter.onBoarding);
    });
  }


  @override
  void initState() {
    super.initState();
    timer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomStackColor(),
        Center(child: Image.asset(Assets.images.logo1.path,))
      ],)

    );
  }
}
