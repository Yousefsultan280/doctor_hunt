import 'package:doctor_hunt/app/core/utils/app_style.dart';
import 'package:doctor_hunt/app/core/widgets/custom_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_stack_color.dart';
import 'package:doctor_hunt/app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/app/features/auth/presentation/controller/auth_state.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/bottom_sheet_widget.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/routers/app_router.dart';
import '../../../../core/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomStackColor(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: height * .12),
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heading1,
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
                             if( state is AuthSuccess ){
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
                    SizedBox(height: height * .015),
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

                    SizedBox(height: height * .005),

                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return EnterEmailWidget(context);
                          },
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(height: height * .08),
                    CustomButton(
                      onTap: () {
                        context.go(AppRouter.bottomWidget);
                      },
                      textColor: AppColors.white,
                      borderColor: AppColors.primaryColor,
                      text: "Login",
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        context.go(AppRouter.signUp);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Don’t have an account? Join us',
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

  BottomSheetWidget EnterEmailWidget(BuildContext context) {
    return BottomSheetWidget(
      title: 'Forget Password',
      subtitle:
          'Enter your email for the verification proccesss'
          'we will send 4 digits code to your email.',
      inputWidget: CustomTextField(
        controller: controller,
        borderColor: Colors.grey,
        hint: "Email",
        validator: (v) {},
      ),
      buttonWidget: CustomButton(
        textColor: AppColors.white,
        borderColor: AppColors.primaryColor,
        text: "Continue",
        color: AppColors.primaryColor,
        onTap: () {
          Navigator.pop(context);

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return EnterCodeWidget(context);
            },
          );
        },
      ),
    );
  }

  BottomSheetWidget EnterCodeWidget(BuildContext context) {
    return BottomSheetWidget(
      title: 'Enter 4 Digits Code',
      subtitle:
          "Enter the 4 digits code that you received on"
          "your email.",
      inputWidget: CustomTextField(
        controller: controller,
        borderColor: Colors.grey,
        hint: "Code",
        validator: (v) {},
      ),
      buttonWidget: CustomButton(
        textColor: AppColors.white,
        borderColor: AppColors.primaryColor,
        text: "Continue",
        color: AppColors.primaryColor,
        onTap: () {
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return ResetPasswordWidget();
            },
          );
        },
      ),
    );
  }

  BottomSheetWidget ResetPasswordWidget() {
    return BottomSheetWidget(
      title: 'Reset Password',
      subtitle:
          'Set the new password for your account so you can login'
          ' and access all the features.',
      inputWidget: Column(
        children: [
          CustomTextField(
            controller: controller,
            borderColor: Colors.grey,
            hint: "New Password",
            sufixicon: Icon(Icons.remove_red_eye),
            validator: (v) {},
          ),
          SizedBox(height: 15),
          CustomTextField(
            controller: controller,
            borderColor: Colors.grey,
            sufixicon: Icon(Icons.remove_red_eye),
            hint: "Confirm New Password",
            validator: (v) {},
          ),
        ],
      ),
      buttonWidget: CustomButton(
        textColor: AppColors.white,
        borderColor: AppColors.primaryColor,
        text: "Update Password",
        color: AppColors.primaryColor,
        onTap: () {},
      ),
    );
  }
}
