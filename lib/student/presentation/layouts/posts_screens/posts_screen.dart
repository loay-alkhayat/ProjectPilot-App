import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_cubit.dart';
import 'package:projectpilot/student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/services/service_locators/posts_service_locator.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../domain/parameters/posts_params/get_post_comments_parameters.dart';
import '../../components/post_card_widget.dart';
import 'create_post_screen.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostActionsCubit cubit = PostActionsCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            fontSize: 20.sp),
        title: const Text(
          "Posts",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider(
            create: (context) => sl<PostActionsCubit>(),
            child: BlocConsumer<PostActionsCubit, PostActionsState>(
              listener: (context, state) {
                if (state is AddCommentSuccessState) {
                  GetPostCommentsParameters parameters =
                      GetPostCommentsParameters(
                          postID: PostActionsCubit.get(context).postID);
                  PostActionsCubit.get(context).getPostComments(parameters);
                  PostActionsCubit.get(context).getPosts(const NoParameters());
                }
                if (state is AddLikeSuccessState ||
                    state is UnLikeSuccessState) {
                  PostActionsCubit.get(context).getPosts(const NoParameters());
                }
              },
              builder: (context, state) {
                return ConditionalBuilder(
                    condition: cubit.getPostsSuccess,
                    builder: (context) => Expanded(
                            child: FadeInRight(
                          duration: const Duration(milliseconds: 300),
                          animate: true,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return PostCardWidget(
                                    userType: cubit
                                        .getPostsEntity!.posts[index].userType,
                                    commentsNumber: cubit.getPostsEntity!
                                        .posts[index].postCommentsCount,
                                    postId: cubit
                                        .getPostsEntity!.posts[index].postID,
                                    postStudentName: cubit.getPostsEntity!
                                        .posts[index].postStudentName,
                                    likesNumber: cubit.getPostsEntity!
                                        .posts[index].postLikesCount,
                                    isLiked: cubit
                                        .getPostsEntity!.posts[index].isLiked,
                                    postText: cubit
                                        .getPostsEntity!.posts[index].post);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(),
                              itemCount: cubit.getPostsEntity!.posts.length),
                        )),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ));
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Functions.navigatorPush(
              context: context, screenNameToNavigate: CreatePostScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
