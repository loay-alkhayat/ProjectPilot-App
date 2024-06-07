import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/core/constants/app_constants.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_task_by_id_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/components/proposal_widget.dart';
import 'package:projectpilot/student/presentation/components/request_card_for_team_widget.dart';
import 'package:projectpilot/student/presentation/layouts/student_screens/student_info_screen.dart';
import 'package:projectpilot/student/presentation/layouts/tasks_screens/task_informations_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/member_in_team_widget.dart';
import '../../components/task_widget.dart';

class MyTeamScreen extends StatelessWidget {
  MyTeamScreen({super.key});

  int maxLinesText = 1;
  bool expandedText = false;

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    return DefaultTabController(
      length: AppConstants.userLeader! ? 4 : 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          forceMaterialTransparency: false,
          automaticallyImplyLeading: false,
          actions: [
            AppConstants.userTeam != 0
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat_outlined,
                      color: AppColors.grey,
                    ))
                : Container(),
          ],
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Team",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: AppConstants.userTeam != 0
            ? Column(
                children: [
                  TabBar(
                    physics: const NeverScrollableScrollPhysics(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: AppColors.primary,
                    onTap: (index) {
                      cubit.indexOfTeamScreenTabBar = index;
                      if (index == 0 && cubit.getTasksModel == null) {
                        GetTaskParameters parameters =
                            GetTaskParameters(page: 1, perPage: 10);
                        cubit.getTasks(parameters);
                      } else if (index == 1 &&
                          cubit.getTeamMembersEntity == null) {
                        cubit.getTeamMembers();
                      } else if (index == 2) {
                        cubit.getProposals();
                      } else if (index == 3) {
                        cubit.getTeamJoinRequest();
                      }
                    },
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.grey,
                    tabs: [
                      const Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Tasks",
                              maxLines: 1,
                              strutStyle: StrutStyle(
                                forceStrutHeight: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              " Members",
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      const Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              " Proposals",
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      if (AppConstants.userLeader!)
                        const Tab(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Requests",
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ///TasksScreen
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocConsumer<MainCubit, MainStates>(
                              listener: (context, state) {
                                if (state is CreateTaskSuccessState) {
                                  GetTaskParameters parameters =
                                      GetTaskParameters(page: 1, perPage: 10);
                                  cubit.getTasks(parameters);
                                }
                                if (state is DeleteTaskSuccessState) {
                                  GetTaskParameters parameters =
                                      GetTaskParameters(page: 1, perPage: 10);
                                  cubit.getTasks(parameters);
                                }
                              },
                              builder: (context, state) {
                                return ConditionalBuilder(
                                  condition: cubit.getTasksSuccess,
                                  builder: (context) => cubit
                                          .getTasksModel!.data.isNotEmpty
                                      ? Expanded(
                                          child: ListView.separated(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                GetTaskByIDParameters
                                                    parameters =
                                                    GetTaskByIDParameters(
                                                        taskID: cubit
                                                            .getTasksModel!
                                                            .data[index]
                                                            .taskID);
                                                cubit.getTaskById(parameters);
                                                Functions.navigatorPush(
                                                    context: context,
                                                    screenNameToNavigate:
                                                        const TaskInformationsScreen());
                                              },
                                              child: TaskWidget(
                                                taskNumber: index,
                                                progress: cubit.getTasksModel!
                                                        .data[index].progress /
                                                    100,
                                                taskTitle: cubit.getTasksModel!
                                                    .data[index].title,
                                                numOfstudents: cubit
                                                    .getTasksModel!
                                                    .data[index]
                                                    .taskStudents
                                                    .length,
                                              ),
                                            ),
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              height: 2.h,
                                            ),
                                            itemCount: cubit
                                                .getTasksModel!.data.length,
                                          ).animate().slideY(
                                              begin: 1,
                                              end: 0,
                                              curve: const FlippedCurve(
                                                  Curves.linear),
                                              delay: const Duration(
                                                  microseconds: 5000)),
                                        )
                                      : AppConstants.userLeader!
                                          ? Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    pngPaths.nodata,
                                                    height: 40.h,
                                                    width: 70.w,
                                                  ),
                                                  Text(
                                                    "Create Your First Task",
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: AppColors.grey),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_downward,
                                                    size: 18.w,
                                                    color: AppColors.grey,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    pngPaths.nodata,
                                                    height: 40.h,
                                                    width: 70.w,
                                                  ),
                                                  Text(
                                                    "No Tasks Found !",
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: AppColors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                  fallback: (context) => const Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
                            )
                          ],
                        ),

                        ///MembersScreen
                        Column(
                          children: [
                            Expanded(
                              child: BlocBuilder<MainCubit, MainStates>(
                                builder: (context, state) {
                                  return ConditionalBuilder(
                                    condition: cubit.getTeamsMembersSuccess,
                                    builder: (context) => GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w, vertical: 2.h),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 5.h,
                                              crossAxisSpacing: 2.w,
                                              childAspectRatio: 1.4.w / 5,
                                            ),
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.w),
                                                  splashColor:
                                                      AppColors.lightGrey,
                                                  onTap: () {
                                                    GetStudentByIdParameters
                                                        parameters =
                                                        GetStudentByIdParameters(
                                                            studentID: cubit
                                                                .getTeamMembersEntity!
                                                                .data[index]
                                                                .studentID);
                                                    cubit.getStudentById(
                                                        parameters);
                                                    Functions.navigatorPush(
                                                        context: context,
                                                        screenNameToNavigate:
                                                            const StudentInfoScreen());
                                                  },
                                                  child: MemberInTeamWidget(
                                                    studentName: cubit
                                                        .getTeamMembersEntity!
                                                        .data[index]
                                                        .name,
                                                    studentSpeciality: cubit
                                                        .getTeamMembersEntity!
                                                        .data[index]
                                                        .major,
                                                  ),
                                                ),
                                            itemCount: cubit
                                                .getTeamMembersEntity!
                                                .data
                                                .length)
                                        .animate()
                                        .slideY(
                                            begin: 1,
                                            end: 0,
                                            curve: const FlippedCurve(
                                                Curves.linear),
                                            delay: const Duration(
                                                microseconds: 5000)),
                                    fallback: (context) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),

                        ///ProposalsScreen
                        Column(
                          children: [
                            Expanded(
                              child: BlocBuilder<MainCubit, MainStates>(
                                builder: (context, state) {
                                  return ConditionalBuilder(
                                    condition: cubit.getProposalsSuccess,
                                    builder: (context) => cubit
                                            .getProposalsEntity!
                                            .data
                                            .proposals
                                            .isNotEmpty
                                        ? ListView.separated(
                                            padding:
                                                EdgeInsets.only(bottom: 4.h),
                                            itemBuilder: (context, index) =>
                                                ProposalWidget(
                                                    proposalName: cubit
                                                        .getProposalsEntity!
                                                        .data
                                                        .proposals[index]
                                                        .name,
                                                    proposalDescription: cubit
                                                        .getProposalsEntity!
                                                        .data
                                                        .proposals[index]
                                                        .description,
                                                    proposalPdf: cubit
                                                        .getProposalsEntity!
                                                        .data
                                                        .proposals[index]
                                                        .filePath),
                                            separatorBuilder:
                                                (context, index) =>
                                                    SizedBox(height: 1.h),
                                            itemCount: cubit.getProposalsEntity!
                                                .data.proposals.length,
                                          ).animate().slideY(
                                            begin: 1,
                                            end: 0,
                                            curve: const FlippedCurve(
                                                Curves.linear),
                                            delay: const Duration(
                                                microseconds: 5000))
                                        : Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  pngPaths.nodata,
                                                  height: 40.h,
                                                  width: 70.w,
                                                ),
                                                Text(
                                                  "No Proposals Found !",
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      color: AppColors.grey),
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
                          ],
                        ),

                        ///TeamRequestsScreen
                        Column(
                          children: [
                            Expanded(
                              child: BlocConsumer<MainCubit, MainStates>(
                                listener: (context, state) {
                                  if (state
                                      is RejectTeamJoinRequestSuccessState) {
                                    cubit.getTeamJoinRequest();
                                  }
                                  if (state
                                      is ApproveTeamJoinRequestSuccessState) {
                                    cubit.getTeamJoinRequest();
                                  }
                                },
                                builder: (context, state) {
                                  return ConditionalBuilder(
                                    condition: cubit
                                            .getTeamJoinRequestSuccess &&
                                        state
                                            is! RejectTeamJoinRequestLoadingState &&
                                        state
                                            is! ApproveTeamJoinRequestLoadingState,
                                    builder: (context) => cubit
                                            .getTeamJoinRequestEntity!
                                            .data
                                            .isNotEmpty
                                        ? ListView.separated(
                                            itemBuilder: (context, index) {
                                              return RequestCardForTeamWidget(
                                                studentName: cubit
                                                    .getTeamJoinRequestEntity!
                                                    .data[index]
                                                    .studentData
                                                    .studentName,
                                                studentMajor: cubit
                                                    .getTeamJoinRequestEntity!
                                                    .data[index]
                                                    .studentData
                                                    .major,
                                                studentID: cubit
                                                    .getTeamJoinRequestEntity!
                                                    .data[index]
                                                    .studentData
                                                    .studentId,
                                                requestID: cubit
                                                    .getTeamJoinRequestEntity!
                                                    .data[index]
                                                    .requestID,
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(),
                                            itemCount: cubit
                                                .getTeamJoinRequestEntity!
                                                .data
                                                .length,
                                          ).animate().slideY(
                                            begin: 1,
                                            end: 0,
                                            curve: const FlippedCurve(
                                                Curves.linear),
                                            delay: const Duration(
                                                microseconds: 5000))
                                        : Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  pngPaths.nodata,
                                                  height: 40.h,
                                                  width: 70.w,
                                                ),
                                                Text(
                                                  "No Requests Found !",
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      color: AppColors.grey),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
                      "Join Or Create Team",
                      style: TextStyle(fontSize: 20.sp, color: AppColors.grey),
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 18.w,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
