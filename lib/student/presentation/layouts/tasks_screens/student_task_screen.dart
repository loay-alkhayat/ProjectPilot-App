import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/complete_sub_task_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/components/show_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/service_locators/services_locator.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../components/width_button.dart';

class StudentTasksScreen extends StatelessWidget {
  const StudentTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: const IconThemeData(color: AppColors.black),
        title: Text(
          "My Tasks",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => sl<MainCubit>(),
        child: BlocConsumer<MainCubit, MainStates>(
          listener: (context, state) {
            if (state is CompleteSubTaskErrorState) {
              showToast(message: state.error);
            }
            if (state is CompleteSubTaskSuccessState ||
                state is DeleteSubTaskSuccessState) {
              cubit.getStudentTasks(const NoParameters());
            }
          },
          builder: (context, state) {
            return ConditionalBuilder(
              condition: state is! GetStudentTasksLoadingState,
              builder: (context) => cubit.getStudentTasksEntity!.data.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.all(4.w),
                      child: FadeInRight(
                        duration: Duration(milliseconds: 300),
                        animate: true,
                        child: ListView.builder(
                          itemCount: cubit.getStudentTasksEntity!.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: TaskCard(
                                estimatedTime: cubit.getStudentTasksEntity!
                                    .data[index].studentTasks[0].estimatedTime,
                                subTaskID: cubit.getStudentTasksEntity!
                                    .data[index].studentTasks[0].taskID,
                                completed: cubit.getStudentTasksEntity!
                                    .data[index].studentTasks[0].progress,
                                mainTaskTitle: cubit.getStudentTasksEntity!
                                    .data[index].mainTaskTitle,
                                title: cubit.getStudentTasksEntity!.data[index]
                                    .studentTasks[0].title,
                                description: cubit.getStudentTasksEntity!
                                    .data[index].studentTasks[0].description,
                                daysLeft: cubit.getStudentTasksEntity!
                                    .data[index].studentTasks[0].daysLeft,
                              ),
                            );
                          },
                        ),
                      ),
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
                            "No Tasks Found !",
                            style: TextStyle(
                                fontSize: 20.sp, color: AppColors.grey),
                          ),
                        ],
                      ),
                    ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String mainTaskTitle;
  final String description;
  final int daysLeft;
  final int completed;
  final int subTaskID;
  final String estimatedTime;

  const TaskCard({
    super.key,
    required this.title,
    required this.completed,
    required this.mainTaskTitle,
    required this.description,
    required this.daysLeft,
    required this.subTaskID,
    required this.estimatedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.w),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                mainTaskTitle,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Title:",
              style: TextStyle(fontSize: 15.sp, color: AppColors.grey),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp,
                ),
              ),
            ),
            const Divider(),
            SizedBox(height: 1.h),
            Text(
              "Description:",
              style: TextStyle(fontSize: 15.sp, color: AppColors.grey),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.sp,
                ),
              ),
            ),
            const Divider(),
            SizedBox(height: 1.h),
            Text(
              "Estemated Time:",
              style: TextStyle(fontSize: 15.sp, color: AppColors.grey),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Text(
                "$estimatedTime",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.sp,
                ),
              ),
            ),
            const Divider(),
            Text(
              "Days Left:",
              style: TextStyle(fontSize: 15.sp, color: AppColors.grey),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Text(
                completed == 0 && daysLeft < 0 ? "0" : "$daysLeft",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.sp,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            completed == 1
                ? Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: Colors.green[400],
                          ),
                          child: Center(
                            child: Text(
                              "Completed !",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : completed == 0 && daysLeft < 0
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 4.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.w),
                                color: Colors.red[400],
                              ),
                              child: Center(
                                child: Text(
                                  "TimeOut !",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: widthButton(
                              textButton: "Done",
                              onPress: () {
                                CompleteSubTaskParameters parameters =
                                    CompleteSubTaskParameters(
                                        subTaskID: subTaskID);
                                MainCubit.get(context)
                                    .completeSubTask(parameters);
                              },
                              paddingSize: 5.w,
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
