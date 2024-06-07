import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_comment_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/delete_like_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostCardWidget extends StatefulWidget {
  PostCardWidget({
    super.key,
    required this.postText,
    required this.postStudentName,
    required this.postId,
    required this.isLiked,
    required this.likesNumber,
    required this.commentsNumber,
  });

  bool isLiked;
  final int likesNumber;
  final int commentsNumber;
  int postId;
  String postStudentName;
  String? postText;

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  bool pressExpand = false;

  int maxLines = 2;

  bool pressLike = false;

  TextEditingController commentController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: AppColors.white,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(3.w),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 5.w,
                  backgroundColor: AppColors.white,
                  child: Image.asset(
                    pngPaths.studentProfile,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  widget.postStudentName,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                ),
              ],
            ),
          ),
          StatefulBuilder(
            builder: (context, setState) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.w),
                onTap: () {
                  setState(() {
                    pressExpand = !pressExpand;
                    pressExpand == true ? maxLines = 8 : maxLines = 2;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedSize(
                      alignment: Alignment.centerLeft,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      reverseDuration: const Duration(milliseconds: 500),
                      child: Text(
                        widget.postText!,
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 17.sp),
                      ),
                    ),
                    if (maxLines == 2 &&
                        widget.postText!.characters.length > 90)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Read More...",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 13.sp,
                          ),
                          softWrap: true,
                        ),
                      )
                    else
                      Container(),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Row(
              children: [
                Expanded(
                  child: StatefulBuilder(
                    builder: (context, setState) => InkWell(
                      splashColor: AppColors.grey1,
                      radius: 50.w,
                      borderRadius: BorderRadius.circular(2.w),
                      onTap: () {
                        if (!widget.isLiked) {
                          AddLikeParameters parameters =
                              AddLikeParameters(postID: widget.postId);
                          MainCubit.get(context).addLike(parameters);
                          setState(() {
                            pressLike = true;
                          });
                        } else {
                          UnLikeParameters parameters =
                              UnLikeParameters(postID: widget.postId);
                          MainCubit.get(context).unLike(parameters);
                          setState(() {
                            pressLike = false;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: (widget.isLiked || pressLike)
                                ? AppColors.red
                                : AppColors.grey1,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "${widget.likesNumber} Like",
                            style: const TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.grey,
                  height: 3.h,
                  width: 0.3.w,
                ),
                Expanded(
                  child: InkWell(
                    splashColor: AppColors.grey1,
                    radius: 50.w,
                    borderRadius: BorderRadius.circular(2.w),
                    onTap: () {
                      MainCubit.get(context).postID = widget.postId;
                      GetPostCommentsParameters parameters =
                          GetPostCommentsParameters(postID: widget.postId);
                      MainCubit.get(context).getPostComments(parameters);
                      _showCommentsDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.comment,
                          color: AppColors.grey1,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "${widget.commentsNumber} Comment",
                          style: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCommentsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(3.w)),
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Form(
            key: formKey,
            child: SizedBox(
              width: double.maxFinite,
              height: 60.h,
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<MainCubit, MainStates>(
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition:
                              MainCubit.get(context).getPostCommentsSuccess &&
                                  state is! AddCommentLoadingState,
                          builder: (context) => MainCubit.get(context)
                                  .getPostCommentsEntity!
                                  .comments
                                  .isNotEmpty
                              ? ListView.separated(
                                  padding: EdgeInsets.all(2.w),
                                  itemCount: MainCubit.get(context)
                                      .getPostCommentsEntity!
                                      .comments
                                      .length,
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 4.w,
                                            backgroundColor:
                                                AppColors.lightGrey,
                                            backgroundImage: const AssetImage(
                                                pngPaths.studentProfile),
                                          ),
                                          SizedBox(width: 2.w),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  MainCubit.get(context)
                                                      .getPostCommentsEntity!
                                                      .comments[index]
                                                      .commentStudentName,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                AnimatedSize(
                                                  duration: const Duration(
                                                      microseconds: 500),
                                                  child: Text(
                                                    MainCubit.get(context)
                                                        .getPostCommentsEntity!
                                                        .comments[index]
                                                        .comment,
                                                    style: TextStyle(
                                                        fontSize: 15.sp),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            MainCubit.get(context)
                                                .getPostCommentsEntity!
                                                .comments[index]
                                                .commentDate
                                                .split(" ")
                                                .first,
                                            style: const TextStyle(
                                                color: AppColors.grey),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        pngPaths.nodata,
                                        height: 40.h,
                                        width: 70.w,
                                      ),
                                      Text(
                                        "No Comments !",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: AppColors.grey),
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
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            selectionWidthStyle: BoxWidthStyle.tight,
                            selectionControls: MaterialTextSelectionControls(),
                            cursorColor: AppColors.greyColor,
                            cursorOpacityAnimates: true,
                            textInputAction: TextInputAction.next,
                            controller: commentController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Comment';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Write Your Comment",
                                hintStyle:
                                    const TextStyle(color: AppColors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.w),
                                    borderSide: BorderSide.none),
                                fillColor: AppColors.lightGrey,
                                filled: true),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.send,
                                color: AppColors.primary),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AddCommentParameters parameters =
                                    AddCommentParameters(
                                        comment: commentController.text,
                                        postID: widget.postId);
                                MainCubit.get(context).addComment(parameters);

                                commentController.clear();
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
