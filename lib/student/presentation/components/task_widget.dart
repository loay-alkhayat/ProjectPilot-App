import 'package:flutter/material.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/core/constants/app_constants.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/delete_task_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/layouts/tasks_screens/create_sub_task_screen.dart';
import 'package:projectpilot/student/presentation/layouts/tasks_screens/edit_task_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TaskWidget extends StatelessWidget {
  double? progress;

  String? taskTitle;
  int? numOfstudents;
  int? taskNumber;
  String? studentImage;

  TaskWidget(
      {super.key,
      required this.progress,
      required this.taskTitle,
      required this.numOfstudents,
      this.studentImage,
      this.taskNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: AppColors.white,
      color: AppColors.white,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(3.w),
      ),
      elevation: 3,
      child: Row(
        children: [
          Container(
            color: AppColors.grey1,
            height: 15.h,
            width: 4.w,
            child: LinearProgressIndicator(
              minHeight: 16.h,
              value: progress,
              backgroundColor: AppColors.grey1,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Task ${taskNumber! + 1}",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey),
                      ),
                      const Spacer(),
                      AppConstants.userLeader!
                          ? PopupMenuButton(
                              color: AppColors.white,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              surfaceTintColor: AppColors.lightGrey,
                              iconColor: AppColors.grey,
                              splashRadius: 20,
                              popUpAnimationStyle: AnimationStyle(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                                reverseCurve: Curves.linear,
                                reverseDuration:
                                    const Duration(milliseconds: 500),
                              ),
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text('Add Sub-Task'),
                                ),
                                const PopupMenuItem(
                                  value: 2,
                                  child: Text('Edit Task'),
                                ),
                                const PopupMenuItem(
                                  value: 3,
                                  child: Text('Delete Task'),
                                ),
                              ],
                              onSelected: (value) {
                                // Handle item selection here
                                switch (value) {
                                  case 1:
                                    Functions.navigatorPush(
                                        context: context,
                                        screenNameToNavigate:
                                            CreateSubTaskScreen(
                                          taskID: MainCubit.get(context)
                                              .getTasksModel!
                                              .data[taskNumber!]
                                              .taskID,
                                        ));

                                    MainCubit.get(context).getTeamMembers();
                                  case 2:
                                    Functions.navigatorPush(
                                        context: context,
                                        screenNameToNavigate: EditTaskScreen(
                                          taskID: MainCubit.get(context)
                                              .getTasksModel!
                                              .data[taskNumber!]
                                              .taskID,
                                          taskDescription:
                                              MainCubit.get(context)
                                                  .getTasksModel!
                                                  .data[taskNumber!]
                                                  .description,
                                          taskTitle: MainCubit.get(context)
                                              .getTasksModel!
                                              .data[taskNumber!]
                                              .title,
                                        ));
                                    break;
                                  case 3:
                                    DeleteTaskParameters parameters =
                                        DeleteTaskParameters(
                                            taskID: MainCubit.get(context)
                                                .getTasksModel!
                                                .data[taskNumber!]
                                                .taskID);
                                    MainCubit.get(context)
                                        .deleteTask(parameters);
                                  default:
                                    break;
                                }
                              },
                            )
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Text(
                      taskTitle!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 6.h,
                        width: 80.w,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CircleAvatar(
                            backgroundColor: AppColors.white,
                            radius: 4.w,
                            child: Image.asset(
                              pngPaths.studentProfile,
                              width: 12.w,
                              height: 6.h,
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 1.w,
                          ),
                          itemCount: numOfstudents!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
