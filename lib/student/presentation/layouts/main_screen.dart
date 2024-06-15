import 'dart:io';
import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/parameters/search_supervisors_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/create_task_parameters.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/components/show_toast.dart';
import 'package:projectpilot/student/presentation/components/width_button.dart';
import 'package:projectpilot/student/presentation/layouts/student_screens/profile_screen.dart';
import 'package:projectpilot/student/presentation/layouts/supervisors_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../domain/parameters/create_team_param.dart';
import '../../domain/parameters/tasks_params/get_tasks_param.dart';
import '../../domain/parameters/upload_pdf_parameters.dart';
import 'home_screen.dart';
import 'team_screens/my_team_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final TextEditingController teamNameController;
  late final TextEditingController taskNameController;
  late final TextEditingController proposalNameController;
  late final TextEditingController proposalDescriptionController;
  late final TextEditingController taskDescriptionController;
  late PageController _pageController;
  File? file;
  int selectedDuration = 1;
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Widget> screens = [
    HomeScreen(),
    SupervisorsScreen(),
    MyTeamScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    teamNameController = TextEditingController();
    proposalNameController = TextEditingController();
    proposalDescriptionController = TextEditingController();
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
    _pageController = PageController(initialPage: currentIndex);

    super.initState();
  }

  @override
  void dispose() {
    teamNameController.dispose();
    taskNameController.dispose();
    proposalNameController.dispose();
    proposalDescriptionController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    return BlocConsumer<MainCubit, MainStates>(
      builder: (context, state) => Form(
        key: formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          body: PageView.builder(
            scrollBehavior: const ScrollBehavior(),
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: 4,
            onPageChanged: (index) => setState(() {
              currentIndex = index;
            }),
            itemBuilder: (context, index) => screens[index],
          ),
          floatingActionButton: FloatingActionButton(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              onPressed: () {
                scaffoldKey.currentState!.showBottomSheet((context) {
                  return StatefulBuilder(
                    builder: (context, setState) => Container(
                      color: AppColors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                            ],
                          ),
                          // Title
                          AppConstants.userLeader == true
                              ? currentIndex == 2 &&
                                      cubit.indexOfTeamScreenTabBar == 2
                                  ? Column(
                                      children: [
                                        const ListTile(
                                          title: Text(
                                            'Upload Proposal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: TextFormField(
                                            selectionWidthStyle:
                                                BoxWidthStyle.tight,
                                            selectionControls:
                                                MaterialTextSelectionControls(),
                                            cursorColor: AppColors.greyColor,
                                            cursorOpacityAnimates: true,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.next,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .singleLineFormatter,
                                              LengthLimitingTextInputFormatter(
                                                  20),
                                            ],
                                            controller: proposalNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your Proposal Name';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Write Your Proposal Name",
                                              hintStyle: const TextStyle(
                                                  color: AppColors.grey),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                borderSide: BorderSide.none,
                                              ),
                                              fillColor: AppColors.lightGrey,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 2.h),
                                          child: TextFormField(
                                            maxLines: 3,
                                            selectionWidthStyle:
                                                BoxWidthStyle.tight,
                                            selectionControls:
                                                MaterialTextSelectionControls(),
                                            cursorColor: AppColors.greyColor,
                                            cursorOpacityAnimates: true,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.next,
                                            controller:
                                                proposalDescriptionController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your Proposal Description';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Write Your Proposal Description",
                                              hintStyle: const TextStyle(
                                                  color: AppColors.grey),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                borderSide: BorderSide.none,
                                              ),
                                              fillColor: AppColors.lightGrey,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: TextButton(
                                            onPressed: () {
                                              showFiles();
                                            },
                                            child: Text(
                                              "Choose Your Pdf",
                                              style: TextStyle(fontSize: 17.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        const ListTile(
                                          title: Text(
                                            'Create Task',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: TextFormField(
                                            selectionWidthStyle:
                                                BoxWidthStyle.tight,
                                            selectionControls:
                                                MaterialTextSelectionControls(),
                                            cursorColor: AppColors.greyColor,
                                            cursorOpacityAnimates: true,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.next,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .singleLineFormatter,
                                              LengthLimitingTextInputFormatter(
                                                  20),
                                            ],
                                            controller: taskNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your Task Title';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Write Your Task Title",
                                              hintStyle: const TextStyle(
                                                  color: AppColors.grey),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                borderSide: BorderSide.none,
                                              ),
                                              fillColor: AppColors.lightGrey,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 2.h),
                                          child: TextFormField(
                                            maxLines: 5,
                                            selectionWidthStyle:
                                                BoxWidthStyle.tight,
                                            selectionControls:
                                                MaterialTextSelectionControls(),
                                            cursorColor: AppColors.greyColor,
                                            cursorOpacityAnimates: true,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.next,
                                            controller:
                                                taskDescriptionController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your Task Description';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Write Your Task Description",
                                              hintStyle: const TextStyle(
                                                  color: AppColors.grey),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                borderSide: BorderSide.none,
                                              ),
                                              fillColor: AppColors.lightGrey,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 2.h),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'choose Duration of Task :',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              DropdownButton<int>(
                                                menuMaxHeight: 15.h,
                                                isDense: true,
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                value: selectedDuration,
                                                onChanged: (int? newValue) {
                                                  setState(() {
                                                    selectedDuration =
                                                        newValue!;
                                                  });
                                                },
                                                items: List.generate(30,
                                                        (index) => index + 1)
                                                    .map<DropdownMenuItem<int>>(
                                                        (int value) {
                                                  return DropdownMenuItem<int>(
                                                    value: value,
                                                    child: Text('$value days'),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                              : Column(
                                  children: [
                                    const ListTile(
                                      title: Text(
                                        'Create Your Team',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: TextFormField(
                                        selectionWidthStyle:
                                            BoxWidthStyle.tight,
                                        selectionControls:
                                            MaterialTextSelectionControls(),
                                        cursorColor: AppColors.greyColor,
                                        cursorOpacityAnimates: true,
                                        // obscureText: obsecurePassword,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textInputAction: TextInputAction.next,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                          LengthLimitingTextInputFormatter(9),
                                        ],
                                        controller: teamNameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Team Name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Write Your Team Name",
                                          hintStyle: const TextStyle(
                                              color: AppColors.grey),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.w),
                                            borderSide: BorderSide.none,
                                          ),
                                          fillColor: AppColors.lightGrey,
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          widthButton(
                              textButton: AppConstants.userLeader == false
                                  ? "Submit"
                                  : currentIndex == 2 &&
                                          cubit.indexOfTeamScreenTabBar == 2 &&
                                          AppConstants.userLeader == true
                                      ? "Submit Proposal"
                                      : "Create Task",
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  AppConstants.userLeader == false
                                      ? createTeamButton(context)
                                      : currentIndex == 2 &&
                                              cubit.indexOfTeamScreenTabBar ==
                                                  2 &&
                                              AppConstants.userLeader == true
                                          ? file != null
                                              ? uploadPdfFile()
                                              : showToast(
                                                  message:
                                                      "Please Choose Pdf First")
                                          : createTaskButton(context);
                                }
                              }),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
              child: state is CreateTeamLoadingState ||
                      state is CreateTaskLoadingState ||
                      state is UploadProposalsLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 4,
            tabBuilder: (int index, bool isActive) {
              List<IconData> icons = [
                Icons.home,
                Icons.group,
                Icons.groups,
                Icons.person,
              ];
              return Icon(
                icons[index],
                color: isActive ? Colors.blueAccent : Colors.grey,
              );
            },
            activeIndex: currentIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            onTap: (index) => setState(() {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
              currentIndex = index;
              if (currentIndex == 1 && cubit.supervisorEntity == null) {
                SearchSupervisorsParameters parameters =
                    SearchSupervisorsParameters(supervisorsName: "");
                cubit.getSupervisors(parameters);
              }
              if (currentIndex == 2) {
                cubit.indexOfTeamScreenTabBar = 0;
                GetTaskParameters parameters =
                    GetTaskParameters(page: 1, perPage: 10);
                AppConstants.userTeam != 0 ? cubit.getTasks(parameters) : null;
              }
              if (currentIndex == 3 && cubit.getStudentInfoEntity == null) {
                cubit.getStudentInfo(const NoParameters()).then((value) {
                  AppConstants.userLeader =
                      cubit.getStudentInfoEntity!.data.isLeader;
                  AppConstants.userTeam =
                      cubit.getStudentInfoEntity!.data.teamID;
                });
              }
            }),
          ),
        ),
      ),
      listener: (context, state) {
        if (state is CreateTeamSuccessState) {
          showToast(message: cubit.createTeamEntity!.message);
          teamNameController.clear();
          scaffoldKey.currentState!.showBottomSheet((context) {
            return const SizedBox();
          });
          if (state is UploadProposalsSuccessState) {
            showToast(message: cubit.uploadProposalEntity!.message);
            proposalDescriptionController.clear();
            proposalNameController.clear();
            file!.delete();
            scaffoldKey.currentState!.showBottomSheet((context) {
              return const SizedBox();
            });
          }

          cubit.getStudentInfo(const NoParameters()).then((value) {
            AppConstants.userLeader = cubit.getStudentInfoEntity!.data.isLeader;
            AppConstants.userTeam = cubit.getStudentInfoEntity!.data.teamID;
          }).then((value) {
            GetTaskParameters parameters =
                GetTaskParameters(page: 1, perPage: 10);
            cubit.getTasks(parameters);
          });
        }
        if (state is CreateTeamErrorState) {
          showToast(message: state.error);
        }
        if (state is CreateTaskSuccessState) {
          showToast(message: cubit.createTaskEntity!.message);
          taskNameController.text = "";
          taskDescriptionController.text = "";
          scaffoldKey.currentState!.showBottomSheet((context) {
            return const SizedBox();
          });
        }
        if (state is CreateTaskErrorState) {
          showToast(message: state.error);
        }
      },
    );
  }

  createTeamButton(BuildContext context) {
    CreateTeamParameters createTeamParameters =
        CreateTeamParameters(teamName: teamNameController.text);
    MainCubit.get(context).createTeam(createTeamParameters);
  }

  createTaskButton(BuildContext context) {
    CreateTaskParameters createTaskParameters = CreateTaskParameters(
        duration: selectedDuration,
        taskTitle: taskNameController.text,
        taskDescription: taskDescriptionController.text);
    MainCubit.get(context).createTask(createTaskParameters);
  }

  Future<void> showFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
    }
  }

  Future<void> uploadPdfFile() async {
    UploadProposalParameters parameters = UploadProposalParameters(
        pdfDescription: proposalDescriptionController.text,
        pdfName: proposalNameController.text,
        file: file!);
    MainCubit.get(context).uploadProposals(parameters);
  }
}
