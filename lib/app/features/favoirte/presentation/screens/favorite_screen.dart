import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/widgets/home_app_bar_widget.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({super.key});

  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          CustomStackColor(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: height*.05,),
                // appBar
                CustomAppBarWidget(title: "Favorite Doctors",),
                SizedBox(height: height*.02,),

                //search
                CustomTextField(controller: controller,sufixicon: Icon(Icons.close) ,prefixicon: Icon(Icons.search), borderColor:AppColors.primaryColor, hint: "Dentist", validator: (v){}),

                 SizedBox(height: height*.001),

                // Doctors Grid
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              return DoctorCard();
                            },
                          ),
                        ),

                        SizedBox(height: height*.018,),

                        // Feature doctor title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: [
                              const Text(
                                "Feature Doctor",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff46505C),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "See all ›",
                                style: AppTextStyles.bodySmall
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: height*.012,),

                        // feature doctor
                        SizedBox(
                          height: height*.15,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(
                              left: 14,
                              right: 14,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: width*.001,),
                            itemBuilder: (context, index) {
                              return FeatureDoctorCard(
                                 name: 'Dr.Rick', rating: '3.7', price: '25', image: Assets.images.doc1.path,
                              );
                            },
                          ),
                        ),

                        SizedBox(height: height*.001,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}


class DoctorCard extends StatelessWidget {

  const DoctorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.85),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
             Icons.favorite_border,
              size: 17,
              color: Colors.grey.shade400,
            ),
          ),

          CircleAvatar(
            radius: 40,
            backgroundColor: const Color(0xffEAF1F4),
            backgroundImage: AssetImage(Assets.images.doc1.path),
          ),

          SizedBox(height: height*.003,),
          Text(
            "Dr.Shouey",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),

          SizedBox(height: height*.004,),

          Text(
            "Specialist Medicine",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}


class FeatureDoctorCard extends StatelessWidget {
  final String name;
  final String rating;
  final String price;
  final String image;

  const FeatureDoctorCard({
    super.key,
    required this.name,
    required this.rating,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * .26,
      margin: EdgeInsets.only(
        right: width * .03,
      ),
      padding: EdgeInsets.all(
        width * .02,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(
          width * .018,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                size: width * .035,
                color: const Color(0xff718096),
              ),

              const Spacer(),

              Icon(
                Icons.star,
                size: width * .035,
                color: const Color(0xffF7C843),
              ),

              Text(
                ' $rating',
                style: TextStyle(
                  fontSize: width * .03,
                ),
              ),
            ],
          ),

          SizedBox(
            height: width * .01,
          ),

          CircleAvatar(
            radius: width * .065,
            backgroundImage: AssetImage(image),
          ),

          SizedBox(
            height: width * .01,
          ),

          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: width * .03,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(
            height: width * .015,
          ),

          Text(
            price,
            style: TextStyle(
              color: const Color(0xff2DAE83),
              fontSize: width * .024,
            ),
          ),
        ],
      ),
    );
  }
}

