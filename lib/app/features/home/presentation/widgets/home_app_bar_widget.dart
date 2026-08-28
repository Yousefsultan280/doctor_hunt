import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    this.icon,
    this.title="",
    super.key,
  });
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Color(0xff7B8794),
          ),
        ),

        const SizedBox(width: 12),

         Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff3B4552),
          ),
        ),
        Spacer(),
        Icon(icon),
      ],
    );
  }
}