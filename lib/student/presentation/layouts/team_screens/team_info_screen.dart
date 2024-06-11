import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/student/domain/parameters/send_join_request_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/components/width_button.dart';
import 'package:projectpilot/student/presentation/layouts/student_screens/student_info_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/functions/functions.dart';
import '../../../domain/parameters/student_params/get_student_by_id_param.dart';
import '../../components/show_toast.dart';

class TeamInfoScreen extends StatelessWidget {
  String? teamName;
  String? teamLeader;
  String? teamMembersName;
  String? teamMembersImage;
  String teamProposal = 'No Proposal';

  TeamInfoScreen({super.key, required this.teamName});

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          teamName!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {
          if (state is SendJoinRequestErrorState) {
            showToast(message: state.error);
          }
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: cubit.getTeamsByIdSuccess,
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20.w,
                        backgroundImage: const AssetImage(pngPaths.teamImage)),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  FadeInRight(
                    child: Row(
                      children: [
                        Text(
                          "Supevisor:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Text(
                            cubit.getTeamByIdEntity!.data.supervisor == null
                                ? "No SuperVisor"
                                : cubit.getTeamByIdEntity!.data.supervisor!,
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 17.sp,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 4.h,
                  ),
                  FadeInLeft(
                    child: Row(
                      children: [
                        Text(
                          "Engineer:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Text(
                            cubit.getTeamByIdEntity!.data.engineer == null
                                ? "No Engineer"
                                : cubit.getTeamByIdEntity!.data.engineer!,
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 17.sp,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 4.h,
                  ),
                  FadeInRight(
                    child: Row(
                      children: [
                        Text(
                          "Leader:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Text(
                            cubit.getTeamByIdEntity!.data.teamLeader.name,
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 17.sp,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 4.h,
                  ),
                  // FadeInLeft(
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         "Proposal:",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, fontSize: 18.sp),
                  //       ),
                  //       SizedBox(
                  //         width: 2.w,
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => PDFView(
                  //                   filePath:
                  //                       cubit.getTeamByIdEntity!.data.proposal,
                  //                 ),
                  //               ));
                  //         },
                  //         overlayColor:
                  //             const MaterialStatePropertyAll(AppColors.grey1),
                  //         borderRadius: BorderRadius.circular(2.w),
                  //         child: Text(
                  //           "See Proposal",
                  //           style:
                  //               TextStyle(color: AppColors.blue, fontSize: 17.sp),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: 3.h,
                  // ),
                  Text(
                    "Members:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  cubit.getTeamByIdEntity!.data.teamStudents.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 12.h,
                              width: 90.w,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    GetStudentByIdParameters parameters =
                                        GetStudentByIdParameters(
                                            studentID: cubit
                                                .getTeamByIdEntity!
                                                .data
                                                .teamStudents[index]
                                                .studentID);
                                    cubit.getStudentById(parameters);
                                    Functions.navigatorPush(
                                        context: context,
                                        screenNameToNavigate:
                                            const StudentInfoScreen());
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: const AssetImage(
                                            pngPaths.studentProfile),
                                        backgroundColor: AppColors.white,
                                        radius: 7.5.w,
                                      ),
                                      SizedBox(
                                        width: 17.w,
                                        child: Text(
                                          cubit.getTeamByIdEntity!.data
                                              .teamStudents[index].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 2.8.w,
                                ),
                                itemCount: cubit.getTeamByIdEntity!.data
                                    .teamStudents.length,
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            "Sorry..! No Students In the Team",
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Spacer(),
                  ConditionalBuilder(
                    condition: state is! SendJoinRequestLoadingState,
                    builder: (context) => widthButton(
                        paddingSize: 0,
                        textButton: "Join Now!",
                        onPress: () {
                          SendJoinRequestParameters parameters =
                              SendJoinRequestParameters(
                                  reciverID:
                                      cubit.getTeamByIdEntity!.data.teamID);
                          cubit.sendJoinRequest(parameters);
                        }),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
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
    );
  }
}
