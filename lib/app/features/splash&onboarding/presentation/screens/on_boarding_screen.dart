import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/choose_role_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/routers/app_router.dart';
import '../../../../core/utils/app_colors.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> photoName = [
      Assets.images.photo1.path,
      Assets.images.photo2.path,
      Assets.images.photo3.path,
    ];
    const List<String> titles = [
      "Find Trusted Doctors",
      "Choose Best Doctors",
      "Easy Appointments",
    ];

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              CustomStackColor(),
              Positioned(
                top: -20,
                left: index == 1 ? 190 : -100,
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Positioned(
                top: size.height * .15,
                left: 20,
                right: 20,
                child: ClipOval(
                  child: SizedBox(
                    width: size.width * .9,
                    height: size.width * .9,
                    child: Image.asset(

                       photoName[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * .60,
                left: 0,
                right: 0,
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style:AppTextStyles.heading1,
                ),
              ),
              Positioned(
                top: size.height * .65,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text(
                    'Contrary to popular belief, Lorem Ipsum is not\n '
                    'simply random text. It has roots in a piece of it\n '
                    'over 2000 years old.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySmall
                  ),
                ),
              ),

              Positioned(
                top: size.height * .8,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: CustomButton(
                    onTap: () {
                      if (index < 2) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        context.go(AppRouter.chooseRole);

                      }
                    },
                    textColor: AppColors.white,
                    borderColor: AppColors.white,
                    text: index == 2 ? "Get Started" : "Next",
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              if (index < 2)
                Positioned(
                  top: size.height * .88,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      context.go(AppRouter.chooseRole);
                    },
                    child: Text(
                      '   Skip',
                      textAlign: TextAlign.center,
                      style:AppTextStyles.bodyLarge
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
