import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/services/service_locators/auth_service_locator.dart';
import '../../../domain/parameters/login_parameters.dart';
import '../../blocs/login/login_cubit.dart';
import '../../blocs/login/login_states.dart';
import '../../components/show_toast.dart';
import '../../components/width_button.dart';
import '../main_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _idController =
      TextEditingController(text: "loay@loay.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "201910202");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light);
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Image.asset(
                pngPaths.login_vector,
                height: 55.h,
              ),
            ),
            Container(
              height: 48.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.w),
                    topRight: Radius.circular(10.w),
                  ),
                  color: AppColors.white),
              child: Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(color: AppColors.primary, fontSize: 22.sp),
                    ),
                    Text(
                      "Your Project is finally here",
                      style: TextStyle(color: AppColors.grey, fontSize: 15.sp),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                      child: FadeInLeft(
                        animate: true,
                        duration: const Duration(milliseconds: 1000),
                        child: TextFormField(
                          selectionWidthStyle: BoxWidthStyle.tight,
                          selectionControls: MaterialTextSelectionControls(),
                          cursorColor: AppColors.greyColor,
                          cursorOpacityAnimates: true,
                          // keyboardType:
                          //     TextInputType.numberWithOptions(decimal: false),
                          textInputAction: TextInputAction.next,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly,
                          //   // LengthLimitingTextInputFormatter(9),
                          // ],
                          controller: _idController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your ID';
                            }
                            // else if (value.length != 9) {
                            //   return 'ID must be 9 digits ';
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Write Your ID",
                              hintStyle: const TextStyle(color: AppColors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                  borderSide: BorderSide.none),
                              fillColor: AppColors.lightGrey,
                              filled: true),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: StatefulBuilder(
                        builder: (context, setState) => FadeInRight(
                          animate: true,
                          duration: Duration(milliseconds: 1000),
                          child: TextFormField(
                            selectionWidthStyle: BoxWidthStyle.tight,
                            selectionControls: MaterialTextSelectionControls(),
                            cursorColor: AppColors.greyColor,
                            cursorOpacityAnimates: true,
                            obscureText: obsecurePassword,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.singleLineFormatter,
                              // LengthLimitingTextInputFormatter(9),
                            ],
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Write Your Password",
                                hintStyle:
                                    const TextStyle(color: AppColors.grey),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obsecurePassword = !obsecurePassword;
                                      });
                                    },
                                    icon: obsecurePassword
                                        ? const Icon(
                                            Icons.visibility,
                                            color: AppColors.grey,
                                          )
                                        : const Icon(Icons.visibility_off,
                                            color: AppColors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.w),
                                    borderSide: BorderSide.none),
                                fillColor: AppColors.lightGrey,
                                filled: true),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    BlocProvider(
                      create: (context) => sl<LoginCubit>(),
                      child: BlocConsumer<LoginCubit, LoginStates>(
                        listener: (context, state) {
                          if (state is LoginSuccessState) {
                            MainCubit.get(context)
                                .getStudentInfo(const NoParameters());
                            // showToast(message: LoginCubit.get(context).loginModel!.message);
                            Functions.navigatorPushAndRemove(
                                context, MainScreen());
                          }
                          if (state is LoginErrorState) {
                            showToast(message: state.error);
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => FadeInUp(
                              duration: const Duration(milliseconds: 1000),
                              animate: true,
                              child: widthButton(
                                textButton: "Login",
                                onPress: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginParameters parameters =
                                        LoginParameters(
                                            email: _idController.text,
                                            password: _passwordController.text);
                                    LoginCubit.get(context).login(parameters);
                                  }
                                },
                              ),
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
