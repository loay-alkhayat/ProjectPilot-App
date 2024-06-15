import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../domain/parameters/posts_params/get_post_comments_parameters.dart';
import '../../components/post_card_widget.dart';
import 'create_post_screen.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
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
          BlocConsumer<MainCubit, MainStates>(
            listener: (context, state) {
              if (state is AddCommentSuccessState) {
                GetPostCommentsParameters parameters =
                    GetPostCommentsParameters(
                        postID: MainCubit.get(context).postID);
                MainCubit.get(context).getPostComments(parameters);
                MainCubit.get(context).getPosts(const NoParameters());
              }
              if (state is AddLikeSuccessState || state is UnLikeSuccessState) {
                MainCubit.get(context).getPosts(const NoParameters());
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
                                  postId:
                                      cubit.getPostsEntity!.posts[index].postID,
                                  postStudentName: cubit.getPostsEntity!
                                      .posts[index].postStudentName,
                                  likesNumber: cubit.getPostsEntity!
                                      .posts[index].postLikesCount,
                                  isLiked: cubit
                                      .getPostsEntity!.posts[index].isLiked,
                                  postText:
                                      cubit.getPostsEntity!.posts[index].post);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemCount: cubit.getPostsEntity!.posts.length),
                      )),
                  fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ));
            },
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
