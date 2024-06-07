import 'package:flutter/material.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';

class MemberInTeamWidget extends StatelessWidget {
  String studentName;
  String studentSpeciality;
  String? studentImage;

  MemberInTeamWidget(
      {super.key,
      required this.studentName,
      required this.studentSpeciality,
      this.studentImage});

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
                      studentImage!,
                      fit: BoxFit.contain,
                      height: 11.h,
                      width: 37.w,
                    )),
          SizedBox(
            height: 1.h,
          ),
          Text(
            studentName,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            studentSpeciality,
            style: TextStyle(color: AppColors.grey),
          )
        ],
      ),
    );
  }
}
