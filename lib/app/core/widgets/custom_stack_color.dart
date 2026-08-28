import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomStackColor extends StatelessWidget {
  const CustomStackColor({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: height,
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.0, 0.6, 1.0],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                AppColors.stackColor1,
                AppColors.white,
                AppColors.stackColor2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
