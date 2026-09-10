import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/core/widgets/custom_text_field.dart';
import 'package:doctor_hunt/app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/app/features/auth/presentation/controller/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/Lists.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          const CustomStackColor(),
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: height * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppHeader(),
                SizedBox(height: height * .05),
                SectionTitle(
                  title: 'Live Doctors',
                  fontSize: width * .048,
                  horizontalPadding: width * .05,
                ),
                SizedBox(height: height * .015),
                SizedBox(
                  height: width * .42,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return LiveDoctorCard(image: doctorImages[index]);
                    },
                  ),
                ),

                SizedBox(height: height * .025),

                SizedBox(
                  height: width * .25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        color: categeoryColors[index],
                        icon: categeoryIcons[index],
                      );
                    },
                  ),
                ),

                SizedBox(height: height * .03),

                SectionTitle(
                  title: 'Popular Doctor',
                  action: 'See all ›',
                  fontSize: width * .048,
                  horizontalPadding: width * .05,
                ),

                SizedBox(height: height * .018),

                SizedBox(
                  height: width * .72,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: width * .05),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return PopularDoctorCard(
                        image: popularDoctors[index],
                        name: index == 0 ? 'Dr. Fillerup Grab' : 'Dr. Blessing',
                        specialty: index == 0
                            ? 'Medicine Specialist'
                            : 'Dentist Specialist',
                      );
                    },
                  ),
                ),

                SizedBox(height: height * .025),

                SectionTitle(
                  title: 'Feature Doctor',
                  action: 'See all ›',
                  fontSize: width * .048,
                  horizontalPadding: width * .05,
                ),

                SizedBox(height: height * .016),

                SizedBox(
                  height: width * .36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: width * .05),
                    itemCount: featureDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = featureDoctors[index];

                      return FeatureDoctorCard(
                        name: doctor['name']!,
                        rating: doctor['rating']!,
                        price: doctor['price']!,
                        image: doctor['image']!,
                      );
                    },
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

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final TextEditingController searchController = TextEditingController();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height * .25,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(width * .1),
              bottomLeft: Radius.circular(width * .1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .032,
              vertical: height * .024,
            ),
            child:

              BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {

            if (state is! AuthGoogleSuccess) {
              return const SizedBox();
            }

            final String displayName = state.displayName;
            final String photoUrl = state.photo;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .06,
                    ),

                    Row(
                      children: [
                        Text(
                          'Hi, ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: width * .048,
                          ),
                        ),

                        Text(
                          displayName,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: width * .048,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: height * .003,
                    ),

                    Text(
                      'Find Your Doctor',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: width * .072,
                      ),
                    ),
                  ],
                ),

                Container(
                  width: width * .15,
                  height: width * .15,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: width * .005,
                    ),
                  ),

                  child: ClipOval(
                    child: photoUrl != null &&
                        photoUrl.isNotEmpty
                        ? Image.network(
                      photoUrl,
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      Assets.images.myself.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          },
          )



            // BlocBuilder<AuthCubit, AuthState>(
            //   builder: (context, state) {
            //     if(state is AuthGoogleSuccess) {
            //       final String photo=state.photo;
            //       final String displayName=state.displayName;
            //       return Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(height: height * .06),
            //
            //               Row(
            //                 children: [
            //                   Text(
            //                     'Hi, ',
            //                     style: TextStyle(
            //                       color: Colors.white70,
            //                       fontSize: width * .048,
            //                     ),
            //                   ),
            //                   Text(
            //                     displayName,
            //                     style: TextStyle(
            //                       color: Colors.white70,
            //                       fontSize: width * .048,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //
            //               SizedBox(height: height * .003),
            //
            //               Text(
            //                 'Find Your Doctor',
            //                 style: TextStyle(
            //                   color: AppColors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: width * .072,
            //                 ),
            //               ),
            //             ],
            //           ),
            //
            //           Container(
            //             width: width * .15,
            //             height: width * .15,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               border: Border.all(
            //                 color: AppColors.white,
            //                 width: width * .005,
            //               ),
            //               image: DecorationImage(
            //                 fit: BoxFit.cover,
            //                 image: NetworkImage(photo),
            //               ),
            //             ),
            //           ),
            //         ],
            //       );
            //     } else{return const SizedBox();}
            //   },
            ),

          ),
        Positioned(
          left: width * .05,
          right: width * .05,
          bottom: -height * .018,
          child: CustomTextField(
            controller: searchController,
            prefixicon: Icon(Icons.search, size: width * .06),
            sufixicon: Icon(Icons.close, size: width * .06),
            borderColor: AppColors.white,
            hint: "Search...",
            validator: (v) {},
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final double fontSize;
  final double horizontalPadding;

  const SectionTitle({
    super.key,
    required this.title,
    this.action,
    required this.fontSize,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xff394150),
            ),
          ),

          const Spacer(),

          if (action != null)
            Text(
              action!,
              style: TextStyle(
                fontSize: fontSize * .65,
                color: const Color(0xff7A8493),
              ),
            ),
        ],
      ),
    );
  }
}

class LiveDoctorCard extends StatelessWidget {
  final String image;

  const LiveDoctorCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: width * .4,
      width: width * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * .018),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width * .018),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Color color;
  final IconData icon;

  const CategoryCard({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: width * .04),
      child: Container(
        height: width * .23,
        width: width * .21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * .02),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color.withOpacity(.55)],
          ),
        ),
        child: Center(
          child: Icon(icon, color: AppColors.white, size: width * .11),
        ),
      ),
    );
  }
}

class PopularDoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;

  const PopularDoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * .5,
      margin: EdgeInsets.only(right: width * .04),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.85),
        borderRadius: BorderRadius.circular(width * .03),
      ),
      child: Column(
        children: [
          SizedBox(
            height: width * .47,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(width * .03),
              ),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),

          SizedBox(height: width * .03),

          Text(
            name,
            style: TextStyle(
              fontSize: width * .045,
              fontWeight: FontWeight.bold,
              color: const Color(0xff444B57),
            ),
          ),

          SizedBox(height: width * .008),

          Text(
            specialty,
            style: TextStyle(
              color: const Color(0xff9AA2AF),
              fontSize: width * .035,
            ),
          ),

          SizedBox(height: width * .01),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: const Color(0xffF7C843),
                size: width * .045,
              ),
              Icon(
                Icons.star,
                color: const Color(0xffF7C843),
                size: width * .045,
              ),
              Icon(
                Icons.star,
                color: const Color(0xffF7C843),
                size: width * .045,
              ),
              Icon(
                Icons.star,
                color: const Color(0xffF7C843),
                size: width * .045,
              ),
              Icon(
                Icons.star,
                color: const Color(0xffD9DCE2),
                size: width * .045,
              ),
            ],
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
      margin: EdgeInsets.only(right: width * .03),
      padding: EdgeInsets.all(width * .02),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(width * .018),
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

              Text(' $rating', style: TextStyle(fontSize: width * .03)),
            ],
          ),

          SizedBox(height: width * .01),

          CircleAvatar(
            radius: width * .065,
            backgroundImage: AssetImage(image),
          ),

          SizedBox(height: width * .01),

          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: width * .03,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: width * .015),

          Text(
            price,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: width * .024,
            ),
          ),
        ],
      ),
    );
  }
}
