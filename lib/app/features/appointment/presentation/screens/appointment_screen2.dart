import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/utils/app_colors.dart';

class AppointmentScreen2 extends StatefulWidget {
  const AppointmentScreen2({super.key});

  @override
  State<AppointmentScreen2> createState() => _AppointmentScreen2State();
}

class _AppointmentScreen2State extends State<AppointmentScreen2> {
  String _selectedTime = '02:00 PM';
  String _selectedReminder = '25 Minit';

  final List<String> _availableTimes = [
    '10:00 AM',
    '12:00 AM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
  ];

  final List<String> _reminderOptions = [
    '30 Minit',
    '40 Minit',
    '25 Minit',
    '10 Minit',
    '35 Minit',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children:[
          CustomStackColor(),
          SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Card
              SizedBox(height: height*.04,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomAppBarWidget(title: "Appointment",),
              ),
              SizedBox(height: height*.012,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 4,
                          color: Color.fromARGB(255, 216, 214, 214),
                        ),
                      ],
                    ),
                    child: TableCalendar(
                      calendarStyle: CalendarStyle(selectedDecoration: BoxDecoration( color: AppColors.primaryColor)),
                      headerStyle: HeaderStyle(formatButtonVisible: false,decoration: BoxDecoration(color: AppColors.primaryColor),titleTextStyle: TextStyle(color: AppColors.white,fontSize: 20)),
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2027, 12, 31),


                    ),
                  ),
              ),
              
               SizedBox(height: height*.005),

              Container(
                decoration: BoxDecoration(color: AppColors.white,boxShadow: const [
                BoxShadow(
                  offset: Offset(1,-3),
                  blurRadius: 4,
                  color: Color.fromARGB(255, 216, 214, 214),
                )],borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: height*.001,),
                   Text(
                    'Available Time',
                    style: AppTextStyles.heading2,
                  ),
                   SizedBox(height: height*.016),


                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _availableTimes.map((time) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTime = time;
                              });
                            },
                            child: _buildTimeSlot(time),
                          );
                        }).toList(),
                      ),
                    ),

                   SizedBox(height: height*.032),

                  // Reminder Me Before Section
                   Text(
                    'Reminder Me Before',
                    style: AppTextStyles.heading2,
                  ),
                   SizedBox(height: height*.016),

                  // Reminder Options (Horizontal Scrollable)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _reminderOptions.map((option) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedReminder = option;
                            });
                          },
                          child: _buildReminderSlot(option),
                        );
                      }).toList(),
                    ),
                  ),

                   SizedBox(height: height*.045),

                  CustomButton(onTap: (){
                    Dialog(context);
                  }, textColor: AppColors.white, borderColor: AppColors.primaryColor, text: "Confirm", color: AppColors.primaryColor)
                                ],
                                ),
                ),),
             ]
          ),
        ),
    ]
      ),
    );
  }
  

  Widget _buildTimeSlot(String time) {
    bool isSelected = time == _selectedTime;
    List<String> timeParts = time.split(' '); // ['02:00', 'PM']

    return Container(
      width: 76,
      height: 76,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor: const Color(0xFFE8F5E9),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeParts[0],
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              timeParts[1],
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF00C853),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderSlot(String option) {
    bool isSelected = option == _selectedReminder;
    List<String> optionParts = option.split(' ');

    return Container(
      width: 76,
      height: 76,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isSelected ?AppColors.primaryColor: const Color(0xFFE8F5E9),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              optionParts[0],
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              optionParts[1],
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.primaryColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> Dialog(BuildContext context,) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 10,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Color(0xffE7F8F2),
                              child: Image.asset(Assets.images.like.path),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Thank You !",
                              style: AppTextStyles.heading2
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text(
                                "Your Appointment Successful",
                                textAlign: TextAlign.center,
                                style:AppTextStyles.bodyLarge
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "You booked an appointment with Dr."
                                "Pediatrician Purpieson on February 21,"
                                "at 02:00 PM",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyLarge
                              ),
                            ),
                            SizedBox(height: 40),
                            CustomButton(onTap: () {  }, textColor: AppColors.white, borderColor: AppColors.primaryColor, text: 'Done', color: AppColors.primaryColor,),
                            SizedBox(height: 20,),
                            Text("Edit Your Appointment")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );

  }



}