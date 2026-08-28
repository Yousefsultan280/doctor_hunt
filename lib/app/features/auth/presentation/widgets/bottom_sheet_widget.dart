import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget inputWidget;
  final Widget buttonWidget;
  BottomSheetWidget({super.key, required this.title, required this.subtitle,required this.buttonWidget,required this.inputWidget});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      decoration:  BoxDecoration(
        color:AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 90,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

           SizedBox(height: height*.035),

           Text(
            title,
            style: AppTextStyles.heading2
          ),

           SizedBox(height: height*.001),

          Text(
            subtitle,
            style: AppTextStyles.bodySmall
          ),

           SizedBox(height: height*.028),
          inputWidget,

           SizedBox(height: height*.02),

          buttonWidget
        ],
      ),
    );
  }
}

