import 'package:doctor_hunt/app/core/utils/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/routers/app_router.dart';
import '../../../../core/widgets/custom_stack_color.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = 'Patient';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          CustomStackColor(),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: height * .01),
                Image.asset(Assets.images.logo1.path),
                SizedBox(height: height * .036),
                Text(
                  'Choose your role',
                  style: AppTextStyles.heading1
                ),
                SizedBox(height: height * .008),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'The selected role determines the experience and\n'
                    'available features.',
                    textAlign: TextAlign.center,
                    style:AppTextStyles.bodySmall
                  ),
                ),
                SizedBox(height: height * .02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: _roleCard(
                    role: 'Patient',
                    description:
                        'Find doctors, book appointments,and manage your medical records.',
                    icon: Icons.person_outline,
                    selected: selectedRole == 'Patient',
                  ),
                ),
                SizedBox(height: height * .01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: _roleCard(
                    role: 'Admin',
                    description:
                        'Manage doctors, appointments,\nusers, and the platform.',
                    icon: Icons.grid_view_rounded,
                    selected: selectedRole == 'Admin',
                  ),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: CustomButton(
                    onTap: () {
                      context.go(AppRouter.login);

                    },
                    textColor: AppColors.white,
                    borderColor: AppColors.primaryColor,
                    text: "Continue",
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(height: height * .021),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _roleCard({
    required String role,
    required String description,
    required IconData icon,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: role == 'Patient' ? 120 : 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.white : AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.white,
            width: selected ? 1.3 : 1,
          ),
          boxShadow: selected
              ? []
              : [
                  BoxShadow(
                    color: AppColors.black.withOpacity(.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                color: selected ? AppColors.white : const Color(0xFFEAF1ED),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 17,
                color: selected
                    ? AppColors.primaryColor
                    : const Color(0xFF87958F),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: AppTextStyles.heading2
                  ),

                  const SizedBox(height: 4),

                  Text(
                    description,
                    style: AppTextStyles.bodySmall
                  ),
                ],
              ),
            ),

            if (selected)
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 11,
                  color: AppColors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
