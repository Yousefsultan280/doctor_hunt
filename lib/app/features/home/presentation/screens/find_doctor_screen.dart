import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class FindDoctorsScreen extends StatelessWidget {
  const FindDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController=TextEditingController();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      body: Stack(
        children: [
          CustomStackColor(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: Column(
                children: [
                  CustomAppBarWidget(title: "Find Doctors",),

                  SizedBox(height: height * .02),

                  CustomTextField(
                    controller: searchController,
                    prefixicon: Icon(
                      Icons.search,
                      size: width * .06,
                    ),
                    sufixicon: Icon(
                      Icons.close,
                      size: width * .06,
                    ),
                    borderColor: AppColors.white,
                    hint: "Dentist",
                    validator: (v) {},
                  ),

                  SizedBox(height: height * .02),


                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(

                        vertical: height * .005,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          name: "Dr. Balestra",
                          specialty: "Toths Dentist",
                          image: Assets.images.doc2.path,
                          experience:'6 Years experience' ,
                          available: '12:00 AM tomorrow',
                          rating: '90%',
                          patients: '80 Patient Stories',
                          favorite: false,
                        );
                      },
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

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final String experience;
  final String available;
  final String rating;
  final String patients;
  final bool favorite;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.image,
    required this.experience,
    required this.available,
    required this.rating,
    required this.patients,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * .205,
      margin: EdgeInsets.only(
        bottom: height * .015,
      ),
      padding: EdgeInsets.all(width * .04),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.82),
        borderRadius: BorderRadius.circular(width * .025),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    width * .015,
                  ),
                  child: Image.asset(
                    image,
                    width: width * .23,
                    height: width * .23,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: width * .035),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * .042,
                          color: const Color(0xff3F4854),
                        ),
                      ),

                      SizedBox(height: height * .003),

                      Text(
                        specialty,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: width * .03,
                        ),
                      ),

                      SizedBox(height: height * .01),

                      Text(
                        experience,
                        style: TextStyle(
                          color: const Color(0xff94A0AF),
                          fontSize: width * .028,
                        ),
                      ),

                      SizedBox(height: height * .01),

                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 7,
                            color: AppColors.primaryColor,
                          ),

                          SizedBox(width: width * .01),

                          Text(
                            rating,
                            style: TextStyle(
                              fontSize: width * .025,
                              color: const Color(0xff6F7B8A),
                            ),
                          ),

                          SizedBox(width: width * .04),

                           Icon(
                            Icons.circle,
                            size: 7,
                            color: AppColors.primaryColor,
                          ),

                          SizedBox(width: width * .01),

                          Expanded(
                            child: Text(
                              patients,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width * .023,
                                color: const Color(0xff9AA4B0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Icon(
                  favorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: favorite
                      ? Colors.red
                      : const Color(0xff718096),
                  size: width * .055,
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Available',
                    style: TextStyle(
                      color: const Color(0xff168E73),
                      fontWeight: FontWeight.w600,
                      fontSize: width * .035,
                    ),
                  ),

                  SizedBox(height: height * .004),

                  Text(
                    available,
                    style:AppTextStyles.bodySmall
                  ),
                ],
              ),
              CustomButton(onTap: (){}, textColor: AppColors.white, borderColor: AppColors.primaryColor, text: "Book Now  ", color: AppColors.primaryColor)


            ],
          ),
        ],
      ),
    );
  }
}