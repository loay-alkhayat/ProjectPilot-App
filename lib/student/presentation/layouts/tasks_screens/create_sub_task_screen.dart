import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/create_sub_task_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/components/show_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../domain/parameters/tasks_params/get_tasks_param.dart';
import '../../components/width_button.dart';

class CreateSubTaskScreen extends StatelessWidget {
  int taskID;

  CreateSubTaskScreen({super.key, required this.taskID});

  TextEditingController subTaskTitleController = TextEditingController();

  TextEditingController subTaskDescriptionController = TextEditingController();
  int studentIndex = -1;
  int selectedDuration = 1;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              "SubTask",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
            centerTitle: true,
          ),
          body: BlocConsumer<MainCubit, MainStates>(
            listener: (context, state) {
              if (state is CreateSubTaskSuccessState) {
                showToast(
                    message:
                        MainCubit.get(context).createSubTaskEntity!.message);
                GetTaskParameters parameters =
                    GetTaskParameters(page: 1, perPage: 10);
                MainCubit.get(context).getTasks(parameters);
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ConditionalBuilder(
                condition: MainCubit.get(context).getTeamsMembersSuccess,
                builder: (context) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        selectionWidthStyle: BoxWidthStyle.tight,
                        selectionControls: MaterialTextSelectionControls(),
                        cursorColor: AppColors.greyColor,
                        cursorOpacityAnimates: true,
                        textInputAction: TextInputAction.next,
                        controller: subTaskTitleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter SubTask Title';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Write SubTask Title",
                            hintStyle: const TextStyle(color: AppColors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.w),
                                borderSide: BorderSide.none),
                            fillColor: AppColors.lightGrey,
                            filled: true),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: TextFormField(
                          maxLines: 5,
                          selectionWidthStyle: BoxWidthStyle.tight,
                          selectionControls: MaterialTextSelectionControls(),
                          cursorColor: AppColors.greyColor,
                          cursorOpacityAnimates: true,
                          textInputAction: TextInputAction.done,
                          controller: subTaskDescriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Task Description';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Write Your Task Description",
                            hintStyle: const TextStyle(color: AppColors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.w),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: AppColors.lightGrey,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "New Duration Of Task :",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          StatefulBuilder(
                            builder: (context, setState) => DropdownButton<int>(
                              menuMaxHeight: 20.h,
                              isDense: true,
                              borderRadius: BorderRadius.circular(4.w),
                              value: selectedDuration,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedDuration = newValue!;
                                });
                              },
                              items: List.generate(30, (index) => index + 1)
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text('$value days'),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Choose Student :",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 12.h,
                            width: 90.w,
                            child: StatefulBuilder(
                              builder: (context, setState) =>
                                  ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                  radius: 4.w,
                                  borderRadius: BorderRadius.circular(4.w),
                                  splashColor: AppColors.lightGrey,
                                  onTap: () {
                                    setState(() {
                                      studentIndex = index;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: const AssetImage(
                                            pngPaths.studentProfile),
                                        backgroundColor: studentIndex == index
                                            ? AppColors.primary
                                            : AppColors.white,
                                        radius: 8.w,
                                      ),
                                      SizedBox(
                                        width: 17.w,
                                        child: Text(
                                          MainCubit.get(context)
                                              .getTeamMembersEntity!
                                              .data[index]
                                              .name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 2.8.w,
                                ),
                                itemCount: MainCubit.get(context)
                                    .getTeamMembersEntity!
                                    .data
                                    .length,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ConditionalBuilder(
                        condition: state is! CreateSubTaskLoadingState,
                        builder: (context) => widthButton(
                            paddingSize: 0,
                            textButton: "Create SubTask",
                            onPress: () {
                              if (formKey.currentState!.validate() &&
                                  studentIndex != -1) {
                                CreateSubTaskParameters parameters =
                                    CreateSubTaskParameters(
                                  durationOftask: selectedDuration,
                                  studentID: MainCubit.get(context)
                                      .getTeamMembersEntity!
                                      .data[studentIndex]
                                      .studentID,
                                  taskID: taskID!,
                                  subTaskDescription:
                                      subTaskDescriptionController.text,
                                  subTaskTitle: subTaskTitleController.text,
                                );
                                MainCubit.get(context)
                                    .createSubTask(parameters);
                              }
                              if (formKey.currentState!.validate() &&
                                  studentIndex == -1) {
                                showToast(message: "Please Choose Student");
                              }
                            }),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )),
    );
  }
}
