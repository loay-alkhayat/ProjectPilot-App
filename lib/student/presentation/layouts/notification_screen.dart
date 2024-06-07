import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/components/request_card_for_student_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/usecase/base_usecase.dart';
import '../components/show_toast.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: BlocConsumer<MainCubit, MainStates>(
            listener: (context, state) {
              if (state is ApproveStudentJoinRequestErrorState) {
                showToast(message: state.error);
              }
              if (state is ApproveStudentJoinRequestSuccessState) {
                cubit.getStudentJoinRequest(const NoParameters());
                cubit.getStudentInfo(const NoParameters()).then((value) {
                  AppConstants.userLeader =
                      cubit.getStudentInfoEntity!.data.isLeader;
                  AppConstants.userTeam =
                      cubit.getStudentInfoEntity!.data.teamID;
                });
                showToast(message: "You Are In Team Right Now!");
              }
              if (state is ApproveStudentJoinRequestErrorState) {
                showToast(message: state.error);
              }
            },
            builder: (context, state) {
              return ConditionalBuilder(
                condition: cubit.getStudentJoinRequestSuccsess,
                builder: (context) =>
                    cubit.getStudentJoinRequestEntity!.data.isNotEmpty
                        ? ListView.separated(
                            itemBuilder: (context, index) =>
                                RequestCardForStudentWidget(
                                    teamName: cubit.getStudentJoinRequestEntity!
                                        .data[index].teamData.teamName,
                                    leaderMajor: cubit
                                        .getStudentJoinRequestEntity!
                                        .data[index]
                                        .teamData
                                        .teamLeaderInfo
                                        .leaderMajor,
                                    requestID: cubit
                                        .getStudentJoinRequestEntity!
                                        .data[index]
                                        .requestID,
                                    teamID: cubit.getStudentJoinRequestEntity!
                                        .data[index].teamData.teamID,
                                    leaderName: cubit
                                        .getStudentJoinRequestEntity!
                                        .data[index]
                                        .teamData
                                        .teamLeaderInfo
                                        .leaderName),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 1.h,
                                ),
                            itemCount:
                                cubit.getStudentJoinRequestEntity!.data.length)
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
                                  "No Notifications Found !",
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
          )),
        ],
      ),
    );
  }
}
