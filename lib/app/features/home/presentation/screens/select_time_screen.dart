import 'package:doctor_hunt/app/core/utils/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../widgets/home_app_bar_widget.dart';

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({super.key});

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  int selectedDay = 1;

  final List<Map<String, String>> days = [
    {
      "day": "Today, 23 Feb",
      "slots": "No slots available",
    },
    {
      "day": "Tomorrow, 24 Feb",
      "slots": "9 slots available",
    },
    {
      "day": "Thu, 25 Feb",
      "slots": "10 slots available",
    },
    {
      "day": "Today, 23 Feb",
      "slots": "No slots available",
    },
    {
      "day": "Tomorrow, 24 Feb",
      "slots": "9 slots available",
    },
    {
      "day": "Thu, 25 Feb",
      "slots": "10 slots available",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final bool noSlots = selectedDay == 0;

    return Scaffold(
      body: Stack(
        children: [
          CustomStackColor(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= HEADER =================
                SizedBox(height: height*.04,),
                    CustomAppBarWidget(title: "Select Time",),


                SizedBox(height: height*.02,),

                // ================= DOCTOR CARD =================

            Container(
                    height: height*.12,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.9),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.08),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            Assets.images.doc2.path,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(width: width*.04,),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                             Text(
                              "Dr. Shruti Kedia",
                              style: AppTextStyles.heading2
                            ),


                             Text(
                              "Upsana Dental Clinic, sat lake",
                              style:AppTextStyles.bodySmall
                            ),

                            SizedBox(height: height*.004,),

                            Row(
                              children: List.generate(
                                5,
                                    (index) => const Icon(
                                  Icons.star,
                                  color: Color(0xffF4B942),
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 17,
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: height*.015,),

                // ================= DAYS =================

                SizedBox(
                  height: height*.06,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: days.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemBuilder: (context, index) {
                      final isSelected =
                          selectedDay == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = index;
                          });
                        },
                        child: DayCard(
                          day: days[index]["day"]!,
                          slots: days[index]["slots"]!,
                          isSelected: isSelected,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: height*.018,),

                // ================= CONTENT =================

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: noSlots
                      ? const NoSlotsView()
                      : const AvailableSlotsView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class DayCard extends StatelessWidget {
  final String day;
  final String slots;
  final bool isSelected;

  const DayCard({
    super.key,
    required this.day,
    required this.slots,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width*.3,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor
            : const Color(0xffF5FAFB),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isSelected
              ?  AppColors.primaryColor
              : const Color(0xffE5ECEF),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? Colors.white
                  : const Color(0xff56616D),
            ),
          ),


          Text(
            slots,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? Colors.white70
                  : const Color(0xff9AA3AE),
            ),
          ),
        ],
      ),
    );
  }
}


class NoSlotsView extends StatelessWidget {
  const NoSlotsView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      key: const ValueKey("noSlots"),
      children: [
        const Text(
          "Today, 23 Feb",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff4A5561),
          ),
        ),

         SizedBox(height: height*.018),

         Text(
          "No slots available",
          style: AppTextStyles.bodySmall
        ),

        SizedBox(height: height*.014),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  18.0),
          child: CustomButton(onTap: (){}, textColor: AppColors.white, borderColor: AppColors.primaryColor, text: "Next availability on wed, 24 Feb", color: AppColors.primaryColor),
        ),


        SizedBox(height: height*.018),

         Text(
          "OR",
          style:AppTextStyles.bodySmall
        ),

        SizedBox(height: height*.018),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
          CustomButton(onTap: (){}, textColor: AppColors.primaryColor, borderColor: AppColors.primaryColor, text: "Contact Clinic", color: AppColors.white)
        ),
      ],
    );
  }
}


class AvailableSlotsView extends StatelessWidget {
  const AvailableSlotsView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      key: const ValueKey("availableSlots"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Today, 23 Feb",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4A5561),
                ),
              ),
            ),

            SizedBox(height: height*.025),

             Text(
              "Afternoon 7 slots",
              style:AppTextStyles.bodySmall
            ),

            SizedBox(height: height*.008),

            const TimeGrid(
              times: [
                "1:00 PM",
                "1:30 PM",
                "2:00 PM",
                "2:30 PM",
                "3:00 PM",
                "3:30 PM",
                "4:00 PM",
              ],
            ),

             SizedBox(height: height*.02),

             Text(
              "Evening 5 slots",
              style: AppTextStyles.bodySmall
            ),

             SizedBox(height: height*.01),

            const TimeGrid(
              times: [
                "5:00 PM",
                "5:30 PM",
                "6:00 PM",
                "6:30 PM",
                "7:00 PM",
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class TimeGrid extends StatefulWidget {
  final List<String> times;

  const TimeGrid({
    super.key,
    required this.times,
  });

  @override
  State<TimeGrid> createState() => _TimeGridState();
}

class _TimeGridState extends State<TimeGrid> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 8,
      children: widget.times.map((time) {
        final isSelected = selectedTime == time;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTime = time;
            });
          },
          child: Container(
            width: 65,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : const Color(0xffEAF5F4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Colors.white
                    :  AppColors.primaryColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}