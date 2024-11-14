import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/service_locators/services_locator.dart';
import '../../../domain/parameters/tasks_params/create_task_parameters.dart';
import '../../../domain/parameters/tasks_params/get_tasks_param.dart';
import '../../components/show_toast.dart';
import '../../components/width_button.dart';

class EditTaskScreen extends StatelessWidget {
  final int taskID;
  final String taskTitle;
  final String taskDescription;
  final TextEditingController taskTitleController;
  final TextEditingController taskDescriptionController;

  EditTaskScreen({
    super.key,
    required this.taskID,
    required this.taskDescription,
    required this.taskTitle,
  })  : taskTitleController = TextEditingController(text: taskTitle),
        taskDescriptionController =
            TextEditingController(text: taskDescription);

  final int studentIndex = -1;
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
              "Edit Task",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text(
                    "New Task Title:",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  selectionWidthStyle: BoxWidthStyle.tight,
                  selectionControls: MaterialTextSelectionControls(),
                  cursorColor: AppColors.greyColor,
                  cursorOpacityAnimates: true,
                  textInputAction: TextInputAction.next,
                  controller: taskTitleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Task Title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Write Task Title",
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
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text(
                    "New Task Description:",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 1.h,
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
                    controller: taskDescriptionController,
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
                  height: 4.h,
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
                const Spacer(),
                BlocProvider(
                  create: (context) => sl<MainCubit>(),
                  child: BlocConsumer<MainCubit, MainStates>(
                    listener: (context, state) {
                      if (state is CreateTaskSuccessState) {
                        showToast(message: "Successfully Updated!");
                        GetTaskParameters parameters =
                            GetTaskParameters(page: 1, perPage: 10);
                        MainCubit.get(context).getTasks(parameters);
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return ConditionalBuilder(
                        condition: state is! CreateTaskLoadingState,
                        builder: (context) => widthButton(
                            paddingSize: 0,
                            textButton: "Edit Task",
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                CreateTaskParameters parameters =
                                    CreateTaskParameters(
                                  duration: selectedDuration,
                                  id: taskID,
                                  taskDescription:
                                      taskDescriptionController.text,
                                  taskTitle: taskTitleController.text,
                                );
                                MainCubit.get(context).createTask(parameters);
                              }
                            }),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
