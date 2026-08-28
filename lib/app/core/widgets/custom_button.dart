import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
  String text;
  Color? color;
  Widget? icon;
  Color borderColor;
  Color textColor;
  CustomButton({super.key, required this.onTap,required this.textColor,this.icon,required this.borderColor, required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * .06,
        decoration: BoxDecoration(color: color,border: BoxBorder.all(color: borderColor,width: 1.5),borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?icon,
            SizedBox(width: widht*.03,),
            Text(text,style: TextStyle(color: textColor,fontSize: 22,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
