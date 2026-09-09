import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/app/features/auth/presentation/controller/auth_state.dart';
import 'package:doctor_hunt/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/routers/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  bool agreeToTerms = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomStackColor(),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * .12),
                    Text(
                      'Join us to start searching',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heading2,
                    ),

                    SizedBox(height: height * .012),

                    Text(
                      'You can search a course, apply course and find\n'
                      'scholarship for abroad studies',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall,
                    ),

                    SizedBox(height: height * .07),

                    Row(
                      children: [
                        Expanded(
                          child: BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthSuccess) {
                                context.go(AppRouter.home);
                              }
                              if (state is AuthError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.msg),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return CustomButton(
                                    onTap: () async {
                                      context
                                          .read<AuthCubit>()
                                          .signInWithGoogle();
                                    },

                                    textColor: AppColors.detailsText,
                                    icon: Image.asset(
                                      Assets.images.google.path,
                                    ),
                                    borderColor: AppColors.white,
                                    text: "Google",
                                    color: AppColors.white,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: width * .012),
                        Expanded(
                          child: CustomButton(
                            onTap: () {},
                            textColor: AppColors.detailsText,
                            icon: Icon(
                              Icons.facebook,
                              color: Color(0xFF4267A9),
                              size: 45,
                            ),
                            borderColor: AppColors.white,
                            text: "Facebook",
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                    CustomTextField(
                      controller: nameController,
                      hint: "Name",
                      borderColor: AppColors.primaryColor,
                      validator: (v) {},
                    ),
                    SizedBox(height: 15),

                    CustomTextField(
                      controller: emailController,
                      hint: "Email",
                      borderColor: AppColors.primaryColor,
                      validator: (v) {},
                    ),
                    SizedBox(height: 15),

                    CustomTextField(
                      controller: passwordController,
                      hint: "Password",
                      sufixicon: Icon(Icons.remove_red_eye),
                      borderColor: AppColors.primaryColor,
                      obscureText: true,
                      validator: (v) {},
                    ),
                    const SizedBox(height: 10),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              agreeToTerms = !agreeToTerms;
                            });
                          },
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: agreeToTerms
                                  ? AppColors.primaryColor
                                  : const Color(0xFFADB5C8),
                              shape: BoxShape.circle,
                            ),
                            child: agreeToTerms
                                ? const Icon(
                                    Icons.check,
                                    size: 10,
                                    color: AppColors.white,
                                  )
                                : null,
                          ),
                        ),

                        SizedBox(width: width * .008),

                        Expanded(
                          child: Text(
                            'I agree with the Terms of Service & Privacy Policy',
                            style: AppTextStyles.bodySmall,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * .08),
                    CustomButton(
                      onTap: () {
                        context.go(AppRouter.bottomWidget);
                      },
                      textColor: AppColors.white,
                      borderColor: AppColors.primaryColor,
                      text: "Sign up",
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(height: height * .012),
                    InkWell(
                      onTap: () {
                        context.go(AppRouter.login);
                      },
                      child: const Text(
                        'Have an account? Log in',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
