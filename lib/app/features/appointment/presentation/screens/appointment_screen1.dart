import 'package:doctor_hunt/app/core/routers/app_router.dart';
import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/widgets/home_app_bar_widget.dart';


class AppointmentScreen1 extends StatelessWidget {
   AppointmentScreen1({super.key});
  TextEditingController controller1=TextEditingController();
   TextEditingController controller2=TextEditingController();


   @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
     final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomStackColor(),
          SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              // Doctor Card
               CustomAppBarWidget(title: "Appointment"),
              SizedBox(height: height*.02,),
              DoctorWidget(),

               SizedBox(height: height*.024),

              // Form Fields
               Text(
                'Appointment For',
                style:AppTextStyles.heading2,
              ),
               SizedBox(height: height*.012),
              CustomTextField(controller: controller1, borderColor: Colors.grey, hint: "Patient Name", validator: (v){}),

              SizedBox(height: height*.012),
              CustomTextField(controller: controller2, borderColor: Colors.grey, hint: "Contact Number", validator: (v){}),


              SizedBox(height: height*.024),

               Text(
                'Who is this patient?',
                style:AppTextStyles.heading2,
              ),
              SizedBox(height: height*.012),

              SizedBox(
                height: height*.14,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Add Button
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(Icons.add, color: AppColors.primaryColor, size: 36),
                          SizedBox(height: height*.008),
                          Text(
                            'Add',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Patient 1
                    _buildPatientAvatar(
                      'My Self',
                      Assets.images.myself.path,
                    ),

                    // Patient 2
                    _buildPatientAvatar(
                      'My child',
                      Assets.images.mychild.path,
                    ),
                  ],
                ),
              ),

              SizedBox(height: height*.032),

              // Next Button
              CustomButton(onTap: (){
                context.go(AppRouter.appointment2);
              }, textColor: AppColors.white, borderColor: AppColors.primaryColor, text: "Next", color: AppColors.primaryColor),

            ],
          ),
                ),
      ]
      ),
    );
  }


  Widget _buildPatientAvatar(String title, String imagepath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagepath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
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
    return Container(
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
                                color: AppColors.primaryColor,
                                fontSize: width * .045,
                              ),
                            ),

                            Text(
                              ' 28.00/hr',
                              style: AppTextStyles.bodyLarge
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

        ],
      ),
    );
  }
}