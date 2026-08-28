import 'package:doctor_hunt/app/features/message/presentation/screens/message_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../book/presentation/screens/book_screen.dart';
import '../../../favoirte/presentation/screens/favorite_screen.dart';
import '../screens/home_screen.dart';


class BottomNavigationBarWidget extends StatefulWidget{
  const BottomNavigationBarWidget({super.key,});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  List<Widget> screens=[HomeScreen(),FavoriteScreen(),BookScreen(),MessageScreen()];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: screens[currentIndex],

        bottomNavigationBar:  BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 32,
          type: BottomNavigationBarType.fixed,
          onTap: (v){
            setState(() {
              currentIndex=v;

            });
          },
          currentIndex:currentIndex,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.chat),label: "")

          ],)
    );


  }
}