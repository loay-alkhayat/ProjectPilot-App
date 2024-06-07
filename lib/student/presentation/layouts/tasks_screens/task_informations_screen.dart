import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/layouts/student_screens/student_info_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_colors.dart';

class TaskInformationsScreen extends StatelessWidget {
  const TaskInformationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cubit.getTaskByIdEntity != null
              ? cubit.getTaskByIdEntity!.data.title
              : "",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<MainCubit, MainStates>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: cubit.getTaskByIdSuccsess == true,
                builder: (context) => cubit
                        .getTaskByIdEntity!.data.subTasks.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => FadeInRight(
                                  child: Card(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 2.h),
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: AppColors.white,
                                    surfaceTintColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.w),
                                    ),
                                    elevation: 3,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: CircleAvatar(
                                              radius: 3.w,
                                              backgroundColor: cubit
                                                          .getTaskByIdEntity!
                                                          .data
                                                          .subTasks[index]
                                                          .subTaskCompleted ==
                                                      1
                                                  ? Colors.green[400]
                                                  : AppColors.grey1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Title Of ${index + 1} SubTask :",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.grey),
                                          ),
                                          SizedBox(height: 1.h),
                                          Padding(
                                            padding: EdgeInsets.only(left: 2.w),
                                            child: Text(
                                              cubit.getTaskByIdEntity!.data
                                                  .subTasks[0].subTaskTitle,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17.sp,
                                              ),
                                            ),
                                          ),
                                          const Divider(),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Description Of ${index + 1} SubTask :",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.grey),
                                          ),
                                          SizedBox(height: 1.h),
                                          Padding(
                                            padding: EdgeInsets.only(left: 2.w),
                                            child: Text(
                                              cubit
                                                  .getTaskByIdEntity!
                                                  .data
                                                  .subTasks[0]
                                                  .subTaskDescription,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17.sp,
                                              ),
                                            ),
                                          ),
                                          const Divider(),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Days Left For ${index + 1} SubTask :",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.grey),
                                          ),
                                          SizedBox(height: 1.h),
                                          Padding(
                                            padding: EdgeInsets.only(left: 2.w),
                                            child: Text(
                                              cubit
                                                  .getTaskByIdEntity!
                                                  .data
                                                  .subTasks[index]
                                                  .subTaskDaysLeft
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17.sp,
                                              ),
                                            ),
                                          ),
                                          const Divider(),
                                          Text(
                                            "Student For ${index + 1} SubTask :",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.grey),
                                          ),
                                          SizedBox(height: 1.h),
                                          InkWell(
                                            onTap: () {
                                              GetStudentByIdParameters
                                                  parameters =
                                                  GetStudentByIdParameters(
                                                      studentID: cubit
                                                          .getTaskByIdEntity!
                                                          .data
                                                          .subTasks[index]
                                                          .subTaskStudent
                                                          .studentID);
                                              cubit.getStudentById(parameters);
                                              Functions.navigatorPush(
                                                  context: context,
                                                  screenNameToNavigate:
                                                      const StudentInfoScreen());
                                            },
                                            child: CircleAvatar(
                                              radius: 5.w,
                                              backgroundImage: const AssetImage(
                                                  pngPaths.studentProfile),
                                              backgroundColor:
                                                  AppColors.lightGrey,
                                            ),
                                          ),
                                          Text(
                                            cubit
                                                .getTaskByIdEntity!
                                                .data
                                                .subTasks[index]
                                                .subTaskStudent
                                                .studentName,
                                            style: const TextStyle(
                                                color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemCount:
                                cubit.getTaskByIdEntity!.data.subTasks.length),
                      )
                    : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              pngPaths.nodata,
                              height: 40.h,
                              width: 70.w,
                            ),
                            Text(
                              "No SubTasks For This Task Found !",
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppColors.grey),
                            ),
                          ],
                        ),
                      ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );
            },
          )
        ],
      ),
    );
  }
}
