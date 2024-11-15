import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/core/constants/app_constants.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/domain/parameters/get_team_by_id_param.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_supervisor_param.dart';
import 'package:projectpilot/student/domain/parameters/search_engineers_param.dart';
import 'package:projectpilot/student/domain/parameters/search_students_param.dart';
import 'package:projectpilot/student/domain/parameters/search_supervisors_param.dart';
import 'package:projectpilot/student/domain/parameters/search_team_param.dart';
import 'package:projectpilot/student/domain/parameters/send_join_request_param.dart';
import 'package:projectpilot/student/presentation/components/show_toast.dart';
import 'package:projectpilot/student/presentation/layouts/student_screens/student_info_screen.dart';
import 'package:projectpilot/student/presentation/layouts/supervisors_screen/invites_actions_cubit/invites_actions_states.dart';
import 'package:projectpilot/student/presentation/layouts/team_screens/team_info_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/services/service_locators/services_locator.dart';
import '../../../domain/parameters/invitation_params/send_invite_to_engineer_param.dart';
import '../../../domain/parameters/invitation_params/send_invite_to_student_parameters.dart';
import '../../../domain/parameters/student_params/get_student_by_id_param.dart';
import '../../components/engineer_widget.dart';
import '../../components/student_widget.dart';
import '../../components/supervisors_widget.dart';
import '../../components/team_widget.dart';
import '../../components/timer.dart';
import 'invites_actions_cubit/invites_actions_cubit.dart';

class SupervisorsScreen extends StatelessWidget {
  SupervisorsScreen({super.key});

  TextEditingController searchController = TextEditingController();
  final debouncer = Debouncer(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    InviteActionsCubit cubit = InviteActionsCubit.get(context);
    return DefaultTabController(
      length: 4,
      child: BlocProvider(
        create: (context) => sl<InviteActionsCubit>(),
        child: BlocConsumer<InviteActionsCubit, InviteActionsState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              forceMaterialTransparency: true,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: SearchBar(
                  autoFocus: false,
                  controller: searchController,
                  onChanged: (value) async {
                    if (value.isEmpty) {
                      if (cubit.indexOfTabBarInSupervisorsScreen == 3) {
                        SearchTeamParameters parameters =
                            SearchTeamParameters(teamName: "");
                        cubit.getTeams(parameters);
                      } else if (cubit.indexOfTabBarInSupervisorsScreen == 1) {
                        SearchEngineersParameters parameters =
                            SearchEngineersParameters(engineersName: "");
                        cubit.getEngineers(parameters);
                      } else if (cubit.indexOfTabBarInSupervisorsScreen == 0) {
                        SearchSupervisorsParameters parameters =
                            SearchSupervisorsParameters(supervisorsName: "");
                        cubit.getSupervisors(parameters);
                      } else if (cubit.indexOfTabBarInSupervisorsScreen == 2) {
                        SearchStudentsParameters parameters =
                            SearchStudentsParameters(studentsName: "");
                        cubit.getStudents(parameters);
                      }
                    }
                    await debouncer.run(() {
                      if (value.length > 2) {
                        if (cubit.indexOfTabBarInSupervisorsScreen == 3) {
                          SearchTeamParameters parameters =
                              SearchTeamParameters(
                                  teamName: searchController.text);
                          cubit.getTeams(parameters);
                        }
                        if (cubit.indexOfTabBarInSupervisorsScreen == 1) {
                          SearchEngineersParameters parameters =
                              SearchEngineersParameters(
                                  engineersName: searchController.text);
                          cubit.getEngineers(parameters);
                        }
                        if (cubit.indexOfTabBarInSupervisorsScreen == 0) {
                          SearchSupervisorsParameters parameters =
                              SearchSupervisorsParameters(
                                  supervisorsName: searchController.text);
                          cubit.getSupervisors(parameters);
                        }
                        if (cubit.indexOfTabBarInSupervisorsScreen == 2) {
                          SearchStudentsParameters parameters =
                              SearchStudentsParameters(
                                  studentsName: searchController.text);
                          cubit.getStudents(parameters);
                        }
                      }
                    });
                  },
                  hintText: "Search",
                  side: const WidgetStatePropertyAll(
                    BorderSide(
                      color: AppColors.grey1,
                    ),
                  ),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.white),
                  overlayColor: const WidgetStatePropertyAll(AppColors.white),
                  surfaceTintColor: const WidgetStatePropertyAll(Colors.amber),
                  shadowColor: const WidgetStatePropertyAll(AppColors.grey),
                  elevation: const WidgetStatePropertyAll(0),
                  leading: const Icon(
                    Icons.search,
                    color: AppColors.grey,
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.only(left: 10),
                  ),
                  textStyle: const WidgetStatePropertyAll(
                    TextStyle(color: AppColors.black),
                  ),
                  hintStyle: const WidgetStatePropertyAll(
                      TextStyle(color: AppColors.grey)),
                  textInputAction: TextInputAction.search,
                  constraints:
                      const BoxConstraints(maxWidth: 350, minHeight: 40),
                ),
              ),
            ),
            body: Column(
              children: [
                TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.primary,
                  onTap: (index) {
                    FocusScope.of(context).unfocus();
                    searchController.clear();
                    cubit.indexOfSupervisors = -1;
                    cubit.indexOfTabBarInSupervisorsScreen = index;
                    // cubit.changeTapBarIndex(index);
                    if (index == 0) {
                      cubit.getTeamsSuccess = false;
                      cubit.getEngineersSuccess = false;
                      cubit.getStudentsSuccess = false;
                      SearchSupervisorsParameters parameters =
                          SearchSupervisorsParameters(supervisorsName: "");
                      cubit.getSupervisors(parameters);
                    } else if (index == 1) {
                      cubit.getSupervisorsSuccess = false;
                      cubit.getTeamsSuccess = false;
                      cubit.getStudentsSuccess = false;
                      SearchEngineersParameters parameters =
                          SearchEngineersParameters(engineersName: "");
                      cubit.getEngineers(parameters);
                    } else if (index == 2) {
                      cubit.getSupervisorsSuccess = false;
                      cubit.getTeamsSuccess = false;
                      cubit.getEngineersSuccess = false;
                      SearchStudentsParameters parameters =
                          SearchStudentsParameters(studentsName: "");
                      cubit.getStudents(parameters);
                    } else if (index == 3) {
                      cubit.getSupervisorsSuccess = false;
                      cubit.getEngineersSuccess = false;
                      cubit.getStudentsSuccess = false;
                      SearchTeamParameters parameters =
                          SearchTeamParameters(teamName: "");

                      cubit.getTeams(parameters);
                    }
                  },
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.grey,
                  tabs: [
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.5.w),
                            child: const Text(
                              "Doctors",
                              maxLines: 1,
                              strutStyle: StrutStyle(
                                forceStrutHeight: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.5.w),
                            child: const Text(
                              " Engineer",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.5.w),
                            child: const Text(
                              " Students",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.5.w),
                            child: const Text(
                              " Teams",
                            ),
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
                      ///SuperVisorsScreen
                      ConditionalBuilder(
                        condition: cubit.getSupervisorsSuccess,
                        builder: (context) => Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 2.w),
                                child: cubit.supervisorEntity!.data.supervisor
                                        .isNotEmpty
                                    ? GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing:
                                                  AppConstants.userLeader!
                                                      ? 2.h
                                                      : 1.h,
                                              crossAxisSpacing: 2.w,
                                              childAspectRatio:
                                                  AppConstants.userLeader!
                                                      ? Device.height <= 960
                                                          ? 1.3.w / 6
                                                          : 0.165.w
                                                      : 1.4.w / 5,
                                            ),
                                            itemBuilder: (context, index) =>
                                                SupervisorsWidget(
                                                  index: index,
                                                  isLeader:
                                                      AppConstants.userLeader!,
                                                  doctorName: cubit
                                                      .supervisorEntity!
                                                      .data
                                                      .supervisor[index]
                                                      .name,
                                                  stateLoading: state
                                                          is SendInviteToSupervisorLoadingState
                                                      ? true
                                                      : false,
                                                  doctorSpeciality: cubit
                                                      .supervisorEntity!
                                                      .data
                                                      .supervisor[index]
                                                      .userType,
                                                  onPress: () {
                                                    print(Device.height);
                                                    cubit.indexOfSupervisors =
                                                        index;
                                                    SendInviteToSuperVisorParameters
                                                        parameters =
                                                        SendInviteToSuperVisorParameters(
                                                            supevisorID: cubit
                                                                .supervisorEntity!
                                                                .data
                                                                .supervisor[
                                                                    index]
                                                                .id);
                                                    cubit
                                                        .sendInviteToSupervisor(
                                                            parameters);
                                                  },
                                                ),
                                            itemCount: cubit.supervisorEntity!
                                                .data.supervisor.length)
                                        .animate()
                                        .slideY(
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
                                              "No Supervisor Found!",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: AppColors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),

                      ///EngineersScreen
                      ConditionalBuilder(
                        condition: cubit.getEngineersSuccess,
                        builder: (context) => Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 2.w),
                                child: cubit.engineerEntity!.data.engineer
                                        .isNotEmpty
                                    ? GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing:
                                                  AppConstants.userLeader!
                                                      ? 2.h
                                                      : 1.h,
                                              crossAxisSpacing: 2.w,
                                              childAspectRatio:
                                                  AppConstants.userLeader!
                                                      ? Device.height <= 960
                                                          ? 1.3.w / 6
                                                          : 0.165.w
                                                      : 1.4.w / 5,
                                            ),
                                            itemBuilder: (context, index) {
                                              return EngineerWidget(
                                                  index: index,
                                                  stateLoading: state
                                                          is SendInviteToEngineerLoadingState
                                                      ? true
                                                      : false,
                                                  isLeader:
                                                      AppConstants.userLeader!,
                                                  onPress: () {
                                                    cubit.indexOfSupervisors =
                                                        index;
                                                    SendInviteToEngineerParameters
                                                        parameters =
                                                        SendInviteToEngineerParameters(
                                                            engineerID: cubit
                                                                .engineerEntity!
                                                                .data
                                                                .engineer[index]
                                                                .id);
                                                    cubit.sendInviteToEngineer(
                                                        parameters);
                                                  },
                                                  engineerName: cubit
                                                      .engineerEntity!
                                                      .data
                                                      .engineer[index]
                                                      .name,
                                                  engineerSpeciality: cubit
                                                      .engineerEntity!
                                                      .data
                                                      .engineer[index]
                                                      .userType);
                                            },
                                            itemCount: cubit.engineerEntity!
                                                .data.engineer.length)
                                        .animate()
                                        .slideY(
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
                                              "No Engineers Found!",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: AppColors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),

                      ///StudentsScreen
                      ConditionalBuilder(
                        condition: cubit.getStudentsSuccess,
                        builder: (context) => Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 2.w),
                                child: cubit.getStudentEntity!.data.student
                                        .isNotEmpty
                                    ? GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing:
                                                  AppConstants.userLeader!
                                                      ? 2.h
                                                      : 1.h,
                                              crossAxisSpacing: 2.w,
                                              childAspectRatio:
                                                  AppConstants.userLeader!
                                                      // 0.8.w
                                                      ? Device.height <= 960
                                                          ? 1.3.w / 6
                                                          : 0.165.w
                                                      : 1.4.w / 5,
                                            ),
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                                  onTap: () {
                                                    GetStudentByIdParameters
                                                        parameters =
                                                        GetStudentByIdParameters(
                                                            studentID: cubit
                                                                .getStudentEntity!
                                                                .data
                                                                .student[index]
                                                                .studentID);
                                                    cubit.getStudentById(
                                                        parameters);
                                                    Functions.navigatorPush(
                                                        context: context,
                                                        screenNameToNavigate:
                                                            const StudentInfoScreen());
                                                  },
                                                  child: StudentWidget(
                                                      index: index,
                                                      stateLoading: state
                                                              is SendInviteLoadingState
                                                          ? true
                                                          : false,
                                                      isLeader: AppConstants
                                                          .userLeader!,
                                                      onPress: () {
                                                        cubit.indexOfSupervisors =
                                                            index;
                                                        SendInviteParameters
                                                            sendInviteParameters =
                                                            SendInviteParameters(
                                                                reciverID: cubit
                                                                    .getStudentEntity!
                                                                    .data
                                                                    .student[
                                                                        index]
                                                                    .studentID);
                                                        cubit.sendInvite(
                                                            sendInviteParameters);
                                                      },
                                                      studentName: cubit
                                                          .getStudentEntity!
                                                          .data
                                                          .student[index]
                                                          .name,
                                                      studentSpeciality: cubit
                                                          .getStudentEntity!
                                                          .data
                                                          .student[index]
                                                          .major),
                                                ),
                                            itemCount: cubit.getStudentEntity!
                                                .data.student.length)
                                        .animate()
                                        .slideY(
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
                                              "No Student Found!",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: AppColors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),

                      ///TeamScreen
                      ConditionalBuilder(
                        condition: cubit.getTeamsSuccess,
                        builder: (context) => Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 2.w),
                                child: cubit.getTeamsEntity!.data.isNotEmpty
                                    ? GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing:
                                                  !AppConstants.userLeader!
                                                      ? 2.h
                                                      : 1.h,
                                              crossAxisSpacing: 2.w,
                                              childAspectRatio:
                                                  !AppConstants.userLeader!
                                                      ? Device.height <= 960
                                                          ? 1.3.w / 6
                                                          : 0.165.w
                                                      : 1.4.w / 5,
                                              // : 1.w / 5,
                                            ),
                                            itemBuilder: (context, index) =>
                                                TeamWidget(
                                                  onTapWidget: () async {
                                                    FocusScope.of(context)
                                                        .unfocus();

                                                    GetTeamByIdParameters
                                                        parameters =
                                                        GetTeamByIdParameters(
                                                            teamID: cubit
                                                                .getTeamsEntity!
                                                                .data[index]
                                                                .teamID);
                                                    cubit.getTeamById(
                                                        parameters);
                                                    Functions.navigatorPush(
                                                        context: context,
                                                        screenNameToNavigate:
                                                            TeamInfoScreen(
                                                          teamName: cubit
                                                              .getTeamsEntity!
                                                              .data[index]
                                                              .teamName,
                                                        ));
                                                  },
                                                  index: index,
                                                  stateLoading: state
                                                          is SendJoinRequestLoadingState
                                                      ? true
                                                      : false,
                                                  isLeader:
                                                      AppConstants.userLeader!,
                                                  inTeam:
                                                      AppConstants.userTeam == 0
                                                          ? false
                                                          : true,
                                                  onPressJoin: () {
                                                    cubit.indexOfSupervisors =
                                                        index;
                                                    SendJoinRequestParameters
                                                        sendJoinRequestParameters =
                                                        SendJoinRequestParameters(
                                                            reciverID: cubit
                                                                .getTeamsEntity!
                                                                .data[index]
                                                                .teamID);
                                                    cubit.sendJoinRequest(
                                                        sendJoinRequestParameters);
                                                  },
                                                  teamName: cubit
                                                      .getTeamsEntity!
                                                      .data[index]
                                                      .teamName,
                                                ),
                                            itemCount: cubit
                                                .getTeamsEntity!.data.length)
                                        .animate()
                                        .slideY(
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
                                              "No Team Found!",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: AppColors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          listener: (context, state) {
            if (state is SendInviteSuccessState) {
              showToast(message: cubit.sendInviteEntity!.message);
            }
            if (state is SendInviteToEngineerErrorState) {
              showToast(message: state.error);
            }
            if (state is SendInviteToEngineerSuccessState) {
              showToast(message: cubit.sendInviteToEngineerEntity!.message);
            }
            if (state is SendInviteToSupervisorErrorState) {
              showToast(message: state.error);
            }
            if (state is SendInviteToSupervisorSuccessState) {
              showToast(message: cubit.sendInviteToSuperVisorEntity!.message);
            }
            if (state is SendInviteErrorState) {
              showToast(message: state.error);
            }
            if (state is GetStudentsErrorState) {
              showToast(message: state.error);
            }
            if (state is GetEngineersErrorState) {
              showToast(message: state.error);
            }
            if (state is GetSupervisorsErrorState) {
              showToast(message: state.error);
            }
            if (state is SendJoinRequestErrorState) {
              showToast(message: state.error);
            }
            if (state is SendJoinRequestSuccessState) {
              showToast(message: cubit.sendJoinRequestEntity!.message);
            }
          },
        ),
      ),
    );
  }
}
