import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/models/models/message_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({super.key});
  TextEditingController messageController = TextEditingController();
  ScrollController controllerScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    return Builder(
      builder: (context) {
        cubit.getMessages();
        return BlocConsumer<MainCubit, MainStates>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  forceMaterialTransparency: true,
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: const AssetImage(pngPaths.teamImage),
                        radius: 6.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "projectPilot",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp),
                      ),
                    ],
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConditionalBuilder(
                        condition: cubit.getMessagesSuccess == true,
                        builder: (context) => Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              controller: controllerScroll,
                              itemBuilder: (context, index) {
                                // int senderID = int.parse(MainCubit.get(context)
                                //     .messages[index]
                                //     .senderId!);
                                // GetStudentByIdParameters parameters =
                                //     GetStudentByIdParameters(
                                //         studentID: senderID);
                                // cubit.getStudentById(parameters);
                                if (cubit.getStudentInfoEntity!.data.studentID
                                        .toString() ==
                                    cubit.messages[index].senderId) {
                                  return myMessageBuild(
                                      context, cubit.messages[index]);
                                }
                                return reciverMessageBuild(
                                  context,
                                  cubit.messages[index],
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 3.h,
                                  ),
                              itemCount: cubit.messages.length),
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2.w),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.w),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: TextField(
                                  textInputAction: TextInputAction.send,
                                  autofocus: true,
                                  canRequestFocus: true,
                                  autocorrect: false,
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Write Your Message...",
                                    hintStyle: TextStyle(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  onSubmitted: (value) async {
                                    controllerScroll.animateTo(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.ease,
                                        controllerScroll
                                            .position.maxScrollExtent);
                                    if (messageController.text.isNotEmpty) {
                                      cubit.sendMessage(
                                          text: messageController.text);
                                      messageController.clear();
                                    }
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: AppColors.grey,
                              child: IconButton(
                                  onPressed: () {
                                    controllerScroll.animateTo(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.ease,
                                        controllerScroll
                                            .position.maxScrollExtent);
                                    if (messageController.text.isNotEmpty) {
                                      cubit.sendMessage(
                                          text: messageController.text);
                                    }
                                    messageController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: AppColors.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
          listener: (context, state) {},
        );
      },
    );
  }
}

Widget reciverMessageBuild(BuildContext context, MessageModel model) {
  return Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Text(
        model.text ?? '', // Make sure model.text is not null
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
      ),
    ),
  );
}

Widget myMessageBuild(BuildContext context, MessageModel model) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      padding: EdgeInsets.all(3.w),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Text(model.text!,
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15.sp)),
    ));
