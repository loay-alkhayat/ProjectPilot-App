import 'package:flutter/material.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../layouts/supervisors_screen/invites_actions_cubit/invites_actions_cubit.dart';

class StudentWidget extends StatelessWidget {
  bool isLeader;
  String studentName;
  String studentSpeciality;
  String? studentImage;
  VoidCallback? onPress;
  bool stateLoading;
  int? index = 0;

  StudentWidget({
    super.key,
    required this.studentName,
    required this.studentSpeciality,
    this.studentImage,
    this.onPress,
    this.stateLoading = false,
    this.index,
    required this.isLeader,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.white,
      elevation: 4,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: studentImage == null
                  ? Image.asset(
                      pngPaths.studentProfile,
                      fit: BoxFit.contain,
                      height: 11.h,
                      width: 37.w,
                    )
                  : Image.network(
                      "https://www.freepik.com/icon/teacher_9721084#fromView=keyword&page=1&position=40&uuid=48abe811-5a8c-44d6-b1fc-2fbf45f5ca36",
                      fit: BoxFit.cover,
                      height: 10.h,
                      width: 37.w,
                    )),
          SizedBox(
            height: 1.h,
          ),
          Text(
            studentName,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            studentSpeciality,
            style: TextStyle(color: AppColors.grey),
          ),
          SizedBox(
            height: 1.h,
          ),
          isLeader
              ? stateLoading &&
                      index ==
                          InviteActionsCubit.get(context).indexOfSupervisors
                  ? const CircularProgressIndicator()
                  : index ==
                              InviteActionsCubit.get(context)
                                  .indexOfSupervisors &&
                          InviteActionsCubit.get(context).invited
                      ? Icon(
                          Icons.check_outlined,
                          color: AppColors.green,
                          size: 10.w,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(3.w)),
                          width: 20.w,
                          height: 5.h,
                          child: TextButton(
                              onPressed: onPress,
                              child: const Text(
                                "INVITE",
                                style: TextStyle(color: AppColors.white),
                              )),
                        )
              : Container(),
        ],
      ),
    );
  }
}
