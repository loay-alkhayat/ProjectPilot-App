import 'package:flutter/material.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/reject_team_join_request_parameters.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/layouts/student_screens/student_info_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../domain/parameters/invitation_params/approve_team_join_request_parameters.dart';

class RequestCardForTeamWidget extends StatelessWidget {
  const RequestCardForTeamWidget(
      {super.key,
      required this.studentID,
      required this.studentName,
      required this.requestID,
      required this.studentMajor});

  final String studentName;
  final String studentMajor;
  final int studentID;
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
                  GetStudentByIdParameters parameters =
                      GetStudentByIdParameters(studentID: studentID);

                  MainCubit.get(context).getStudentById(parameters);
                  Functions.navigatorPush(
                      context: context,
                      screenNameToNavigate: const StudentInfoScreen());
                },
                child: Text(
                  "$studentName speciality $studentMajor Send Join Request For Your Team Do You Accept?",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(4.w),
            onTap: () {
              ApproveTeamJoinRequestParameters parameters =
                  ApproveTeamJoinRequestParameters(requestID: requestID);
              MainCubit.get(context).approveTeamJoinRequest(parameters);
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
                RejectTeamJoinRequestParameters parameters =
                    RejectTeamJoinRequestParameters(requestID: requestID);
                MainCubit.get(context).rejectTeamJoinRequest(parameters);
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
