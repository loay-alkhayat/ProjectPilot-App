import 'package:flutter/material.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../blocs/main_bloc/cubit.dart';

class TeamWidget extends StatelessWidget {
  TeamWidget({
    super.key,
    required this.teamName,
    this.teamImage,
    this.onPressJoin,
    this.onTapWidget,
    required this.isLeader,
    required this.inTeam,
    this.stateLoading = false,
    this.index,
  });

  bool stateLoading;
  int? index = 0;
  bool isLeader;
  bool inTeam;
  String teamName;
  String? teamImage;
  VoidCallback? onPressJoin;
  VoidCallback? onTapWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4.w),
      radius: 4.w,
      onTap: onTapWidget,
      child: Card(
        surfaceTintColor: AppColors.white,
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: teamImage == null
                    ? Image.asset(
                        pngPaths.teamImage,
                        fit: BoxFit.contain,
                        height: !isLeader || !inTeam ? 11.h : 13.h,
                        width: 37.w,
                      )
                    : Image.network(
                        teamImage!,
                        fit: BoxFit.contain,
                        height: 10.h,
                        width: 37.w,
                      )),
            SizedBox(
              height: 2.h,
            ),
            Text(
              teamName,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 1.h,
            ),
            !isLeader || !inTeam
                ? stateLoading &&
                        index == MainCubit.get(context).indexOfSupervisors
                    ? CircularProgressIndicator()
                    : index == MainCubit.get(context).indexOfSupervisors &&
                            MainCubit.get(context).invited
                        ? Icon(
                            Icons.check_outlined,
                            color: AppColors.green,
                            size: 10.w,
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(3.w)),
                            width: 18.w,
                            height: 4.h,
                            child: TextButton(
                                onPressed: onPressJoin,
                                child: const Text(
                                  "Join",
                                  style: TextStyle(color: AppColors.white),
                                )),
                          )
                : Container(),
          ],
        ),
      ),
    );
  }
}
