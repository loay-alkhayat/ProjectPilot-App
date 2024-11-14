import 'package:flutter/material.dart';
import 'package:projectpilot/student/domain/parameters/get_team_by_id_param.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/approve_student_join_request_param.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/reject_student_join_request_param.dart';
import 'package:projectpilot/student/presentation/layouts/team_screens/team_info_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/functions/functions.dart';
import '../layouts/supervisors_screen/invites_actions_cubit/invites_actions_cubit.dart';

class RequestCardForStudentWidget extends StatelessWidget {
  const RequestCardForStudentWidget(
      {super.key,
      required this.leaderName,
      required this.leaderMajor,
      required this.requestID,
      required this.teamID,
      required this.teamName});

  final String leaderName;
  final String leaderMajor;
  final String teamName;
  final int teamID;
  final int requestID;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: AppColors.white,
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(3.w),
      ),
      elevation: 1,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 6.w,
            child: const Icon(
              Icons.notifications_active,
              color: AppColors.primary,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: InkWell(
                onTap: () {
                  GetTeamByIdParameters parameters =
                      GetTeamByIdParameters(teamID: teamID);

                  InviteActionsCubit.get(context).getTeamById(parameters);
                  Functions.navigatorPush(
                      context: context,
                      screenNameToNavigate: TeamInfoScreen(teamName: teamName));
                },
                child: Text(
                  "$leaderName speciality $leaderMajor Send for you Request to join $teamName Team Do You Accept?",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(4.w),
            onTap: () {
              ApproveStudentJoinRequestParameters parameters =
                  ApproveStudentJoinRequestParameters(requestID: requestID);
              InviteActionsCubit.get(context)
                  .approveStudentJoinRequest(parameters);
            },
            child: Icon(
              Icons.check_circle_outline,
              color: AppColors.green,
              size: 8.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: InkWell(
              borderRadius: BorderRadius.circular(4.w),
              onTap: () {
                RejectStudentJoinRequestParameters parameters =
                    RejectStudentJoinRequestParameters(requestID: requestID);
                InviteActionsCubit.get(context)
                    .rejectStudentJoinRequest(parameters);
              },
              child: Icon(
                Icons.cancel_outlined,
                color: AppColors.red,
                size: 8.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
