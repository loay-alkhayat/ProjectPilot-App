import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/create_post_param.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/components/width_button.dart';
import 'package:projectpilot/student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_cubit.dart';
import 'package:projectpilot/student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/service_locators/posts_service_locator.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../components/show_toast.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});

  final TextEditingController postController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "Create Post",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 7.w,
                  backgroundColor: AppColors.lightGrey,
                  child: Image.asset(pngPaths.studentProfile),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Text(
                    MainCubit.get(context).getStudentInfoEntity!.data.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: TextFormField(
                  showCursor: true,
                  controller: postController,
                  maxLines: 20,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "What`s On Your Mind..",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => sl<PostActionsCubit>(),
              child: BlocConsumer<PostActionsCubit, PostActionsState>(
                listener: (context, state) {
                  if (state is CreatePostSuccessState) {
                    showToast(message: "Post Successfully");
                    PostActionsCubit.get(context)
                        .getPosts(const NoParameters());
                    Navigator.pop(context);
                  }
                  if (state is CreatePostErrorState) {
                    showToast(message: state.error);
                  }
                },
                builder: (context, state) {
                  return ConditionalBuilder(
                    condition: state is! CreatePostLoadingState,
                    builder: (context) => widthButton(
                      onPress: () {
                        CreatePostParameters parameters = CreatePostParameters(
                            postDescription: postController.text);
                        PostActionsCubit.get(context).createPost(parameters);
                      },
                      textButton: "Post Now!",
                      paddingSize: 0,
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
      ),
    );
  }
}
