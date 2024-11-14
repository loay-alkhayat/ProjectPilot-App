import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/presentation/blocs/login/login_cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/components/profile_content_container.dart';
import 'package:projectpilot/student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_cubit.dart';
import 'package:projectpilot/student/presentation/layouts/posts_screens/posts_screen.dart';
import 'package:projectpilot/student/presentation/layouts/tasks_screens/student_task_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/service_locators/services_locator.dart';
import '../auth_screen/login_screen.dart';
import '../supervisors_screen/invites_actions_cubit/invites_actions_cubit.dart';
import 'edit_bio_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    InviteActionsCubit inviteActionsCubit = InviteActionsCubit.get(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Column(children: [
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: Text(
                "Profile",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.w),
                        topRight: Radius.circular(6.w))),
              ),
            ),
          ]),
          BlocProvider(
            create: (context) => sl<MainCubit>(),
            child: BlocBuilder<MainCubit, MainStates>(
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: cubit.getStudentInfosuccess,
                  builder: (context) => Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.w),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 14.w,
                          child: Image.asset(
                            pngPaths.studentProfile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        cubit.getStudentInfoEntity!.data.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 1.h),
                        child: Text(
                          cubit.getStudentInfoEntity!.data.bio,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp, color: AppColors.grey1),
                        ),
                      ),
                      FadeInRight(
                        duration: const Duration(milliseconds: 1000),
                        animate: true,
                        child: ProfileInfoCard(
                          icona: Icons.person_pin,
                          iconColor: AppColors.primary,
                          txt: "Edit Bio",
                          onPress: () => Functions.navigatorPush(
                              context: context,
                              screenNameToNavigate: EditBioScreen()),
                        ),
                      ),
                      FadeInLeft(
                        duration: const Duration(milliseconds: 1000),
                        animate: true,
                        child: ProfileInfoCard(
                            icona: Icons.task,
                            iconColor: AppColors.primary,
                            txt: "My Tasks",
                            onPress: () {
                              Functions.navigatorPush(
                                  context: context,
                                  screenNameToNavigate:
                                      const StudentTasksScreen());
                              cubit.getStudentTasks(const NoParameters());
                            }),
                      ),
                      FadeInRight(
                        duration: const Duration(milliseconds: 1000),
                        animate: true,
                        child: ProfileInfoCard(
                            icona: Icons.post_add,
                            iconColor: AppColors.primary,
                            txt: "Posts",
                            onPress: () {
                              PostActionsCubit.get(context)
                                  .getPosts(const NoParameters());
                              Functions.navigatorPush(
                                  context: context,
                                  screenNameToNavigate: PostsScreen());
                            }),
                      ),
                      FadeInLeft(
                        duration: const Duration(milliseconds: 1000),
                        animate: true,
                        child: ProfileInfoCard(
                            icona: Icons.logout_outlined,
                            iconColor: AppColors.primary,
                            txt: "LogOut",
                            onPress: () {
                              cubit.getStudentInfoEntity = null;
                              cubit.getStudentTasksEntity = null;
                              inviteActionsCubit.getTeamsEntity = null;
                              inviteActionsCubit.supervisorEntity = null;
                              inviteActionsCubit.engineerEntity = null;
                              inviteActionsCubit.getStudentJoinRequestEntity =
                                  null;
                              inviteActionsCubit.getTeamJoinRequestEntity =
                                  null;
                              LoginCubit.get(context)
                                  .logout(const NoParameters());
                              Functions.navigatorPushAndRemove(
                                  context, LoginScreen());
                            }),
                      ),
                    ],
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
    );
  }
}
