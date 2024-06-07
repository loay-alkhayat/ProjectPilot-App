import 'package:flutter/material.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';

class SupervisorWidget extends StatelessWidget {
  SupervisorWidget({
    super.key,
    required this.doctorName,
    required this.doctorSpeciality,
    this.doctorImage,
    this.onPress,
    this.stateLoading = false,
    this.index,
    required this.isLeader,
  });

  bool isLeader;
  String doctorName;
  String doctorSpeciality;
  String? doctorImage;
  VoidCallback? onPress;
  bool stateLoading;
  int? index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.centerRight,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundColor: AppColors.lightGrey,
                backgroundImage: doctorImage == null
                    ? const NetworkImage(
                        "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
                    : NetworkImage(doctorImage!),
                backgroundColor: AppColors.lightGrey,
                radius: 9.w,
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    doctorSpeciality,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
                  ),
                ],
              ),
            ],
          ),
          isLeader
              ? stateLoading &&
                      index == MainCubit.get(context).indexOfSupervisors
                  ? const CircularProgressIndicator()
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
