import 'package:doctor_hunt/app/core/utils/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../widgets/home_app_bar_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          CustomStackColor(),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: height * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CustomAppBarWidget(title: "Doctor Details",icon: Icons.search,),
                  SizedBox(height: height * .02),
                  DoctorWidget(),
                  SizedBox(height: height * .025),
                  DoctorNumbers(),
                  SizedBox(height: height * .03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * .06,
                    ),
                    child: Text(
                      'Services',
                      style: TextStyle(
                        fontSize: width * .05,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff3E4855),
                      ),
                    ),
                  ),
                  SizedBox(height: height * .01),
                  const ServiceItem(
                    number: '1.',
                    text:
                    'Patient care should be the number one priority.',
                  ),
                  const ServiceItem(
                    number: '2.',
                    text:
                    'If you run your practice you know how frustrating.',
                  ),
                  const ServiceItem(
                    number: '3.',
                    text:
                    'That’s why some of appointment reminder system.',
                  ),
                  SizedBox(height: height * .025),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * .02,
                    ),
                    child: Container(
                      height: height * .23,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(Assets.images.map.path),fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          width * .03,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorNumbers extends StatelessWidget {
  const DoctorNumbers({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .06,
      ),
      child: Container(
        height: height * .1,
        padding: EdgeInsets.all(width * .015),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.8),
          borderRadius: BorderRadius.circular(
            width * .035,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: StatCard(
                number: '100',
                title: 'Runing',
                width: width,
              ),
            ),

            SizedBox(width: width * .02),

            Expanded(
              child: StatCard(
                number: '500',
                title: 'Ongoing',
                width: width,
              ),
            ),

            SizedBox(width: width * .02),

            Expanded(
              child: StatCard(
                number: '700',
                title: 'Patient',
                width: width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .05,
      ),
      child: Container(
        padding: EdgeInsets.all(width * .04),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.85),
          borderRadius: BorderRadius.circular(width * .03),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    width * .025,
                  ),
                  child: Image.asset(
                    Assets.images.doc2.path,
                    width: width * .24,
                    height: width * .24,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: width * .035),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Pediatrician',
                        style: TextStyle(
                          fontSize: width * .043,
                          fontWeight: FontWeight.bold,
                          color:
                          const Color(0xff434C58),
                        ),
                      ),

                      SizedBox(height: height * .005),

                      Text(
                        'Specialist Cardiologist',
                        style: TextStyle(
                          fontSize: width * .032,
                          color:
                          const Color(0xff8490A0),
                        ),
                      ),

                      SizedBox(height: height * .012),

                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: width * .04,
                            color: const Color(
                              0xffF4C542,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: width * .04,
                            color: const Color(
                              0xffF4C542,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: width * .04,
                            color: const Color(
                              0xffF4C542,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: width * .04,
                            color: const Color(
                              0xffF4C542,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: width * .04,
                            color: const Color(
                              0xffD7DCE2,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                  color: const Color(0xff1AA47F),
                                  fontSize: width * .045,
                                ),
                              ),

                              Text(
                                ' 28.00/hr',
                                style: TextStyle(
                                  color: const Color(0xff718096),
                                  fontSize: width * .037,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: width * .06,
                ),
              ],
            ),

            SizedBox(height: height * .015),


            SizedBox(height: height * .012),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  90.0),
              child: CustomButton(onTap: (){}, textColor: AppColors.white, borderColor: AppColors.primaryColor, text: "Book Now", color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}


class StatCard extends StatelessWidget {
  final String number;
  final String title;
  final double width;

  const StatCard({
    super.key,
    required this.number,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF3F5F7),
        borderRadius: BorderRadius.circular(width * .025),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: width * .045,
              fontWeight: FontWeight.bold,
              color: const Color(0xff4B5563),
            ),
          ),
          SizedBox(height: width * .01),
          Text(
            title,
            style: TextStyle(
              fontSize: width * .028,
              color: const Color(0xff7D8998),
            ),
          ),
        ],
      ),
    );
  }
}


class ServiceItem extends StatelessWidget {
  final String number;
  final String text;

  const ServiceItem({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style:  TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xff788494),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            color: Color(0xffE6E9EC),
          ),
        ],
      ),
    );
  }
}