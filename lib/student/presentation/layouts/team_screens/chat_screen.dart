import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/models/models/message_model.dart';
import '../../../../core/services/service_locators/services_locator.dart';
import 'chat_cubit/chat_cubit.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({super.key});
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MessagesCubit cubit = MessagesCubit.get(context);
    return Builder(
      builder: (context) {
        cubit.getMessages();
        cubit.listenToTypingStatus();
        return BlocProvider(
          create: (context) => sl<MainCubit>(),
          child: BlocConsumer<MainCubit, MainStates>(
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
                      SizedBox(width: 4.w),
                      Text(
                        "GroupChat",
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
                        condition: cubit.getMessagesSuccess,
                        builder: (context) => Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            controller: cubit.controllerScroll,
                            itemBuilder: (context, index) {
                              if (cubit.getStudentInfoEntity!.data.studentID
                                      .toString() ==
                                  cubit.messages[index].senderId) {
                                return myMessageBuild(
                                    context, cubit.messages[index]);
                              }
                              return reciverMessageBuild(
                                  context, cubit.messages[index]);
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 3.h),
                            itemCount: cubit.messages.length,
                          ),
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      if (cubit.otherUserIsTyping)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: const Text(
                            "Someone is typing...",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      SizedBox(height: 2.h),
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
                                  onChanged: (text) {
                                    cubit.updateTypingStatus(true);
                                  },
                                  onSubmitted: (value) async {
                                    cubit.controllerScroll.animateTo(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.ease,
                                      cubit.controllerScroll.position
                                              .maxScrollExtent +
                                          9.h,
                                    );
                                    if (messageController.text.isNotEmpty) {
                                      cubit.sendMessage(
                                          text: messageController.text);
                                      messageController.clear();
                                      cubit.updateTypingStatus(false);
                                    }
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: AppColors.grey,
                              child: IconButton(
                                onPressed: () {
                                  cubit.controllerScroll.animateTo(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.ease,
                                    cubit.controllerScroll.position
                                            .maxScrollExtent +
                                        9.h,
                                  );
                                  if (messageController.text.isNotEmpty) {
                                    cubit.sendMessage(
                                        text: messageController.text);
                                    messageController.clear();
                                    cubit.updateTypingStatus(false);
                                  }
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {},
          ),
        );
      },
    );
  }
}

Widget reciverMessageBuild(BuildContext context, MessageModel model) {
  return Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          model.senderName!.split(" ").first.toString(),
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Container(
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
      ],
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
