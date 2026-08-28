import 'package:doctor_hunt/app/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Icon? prefixicon;
  Icon? sufixicon;
  String hint;
  bool obscureText;
  String? Function(String?)? validator;
  int? maxLines ;
  Color borderColor;

  CustomTextField({
    super.key,
    required this.controller,
    required this.borderColor,
    this.prefixicon,
    this.sufixicon,
    required this.hint,
    this.obscureText=false,
    required this.validator,
    this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: "*",
          validator:validator ,
          decoration: InputDecoration(
            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: borderColor,
                width: 2,
              ),
            ),
            prefixIcon: prefixicon,
            suffixIcon: sufixicon,
            hintText: hint,
            filled: true,
            fillColor: AppColors.white
          ),
        ),
      ],
    );
  }
}
