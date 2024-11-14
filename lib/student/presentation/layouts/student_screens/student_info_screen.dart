import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/layouts/supervisors_screen/invites_actions_cubit/invites_actions_cubit.dart';
import 'package:projectpilot/student/presentation/layouts/supervisors_screen/invites_actions_cubit/invites_actions_states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/service_locators/requests_service_locator.dart';

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    InviteActionsCubit cubit = InviteActionsCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primary,
        title: BlocProvider(
          create: (context) => sl<InviteActionsCubit>(),
          child: BlocBuilder<InviteActionsCubit, InviteActionsState>(
            builder: (context, state) {
              return Text(
                cubit.getStudentByIdSuccess
                    ? "${cubit.getStudentByIdEntity!.data.name} Profile"
                    : "",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500),
              );
            },
          ),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(children: [
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.w),
                        topRight: Radius.circular(6.w))),
              ),
            ),
          ]),
          BlocBuilder<MainCubit, MainStates>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: cubit.getStudentByIdSuccess,
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 17.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.w),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 14.w,
                        child: Image.asset(
                          pngPaths.studentProfile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      cubit.getStudentByIdEntity!.data.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 19.sp),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                      child: Text(
                        cubit.getStudentByIdEntity!.data.bio.characters.isEmpty
                            ? "No Bio Found"
                            : cubit.getStudentByIdEntity!.data.bio,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 16.sp, color: AppColors.grey1),
                      ),
                    ),
                  ],
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
