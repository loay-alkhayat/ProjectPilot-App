// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projectpilot/core/constants/app_colors.dart';
// import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
// import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class ChatDetailsScreen extends StatelessWidget {
//   ChatDetailsScreen();
//   TextEditingController messageController = TextEditingController();
//   ScrollController controllerScroll = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         // cubit.getMessages(reciverId: model.uId!);
//         return BlocConsumer<MainCubit, MainStates>(
//           builder: (context, state) {
//             return Scaffold(
//                 appBar: AppBar(
//                   title: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: NetworkImage("{model.image}"),
//                         radius: 10.w,
//                       ),
//                       SizedBox(
//                         width: 5.w
//                         ,
//                       ),
//                       Text(
//                         "{model.firstname} {model.lastname}",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyMedium
//                             ?.copyWith(color: AppColors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 body: Padding(
//                   padding: EdgeInsets.all(8.w),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: ListView.separated(
//                             physics: BouncingScrollPhysics(),
//                             controller: controllerScroll,
//                             itemBuilder: (context, index) {
//                               // if (cubit.userModel!.uId ==
//                               //     cubit.messages[index].senderId)
//                               //   return myMessageBuild(
//                               //       context, cubit.messages[index]);
//                               // return reciverMessageBuild(
//                               //     context, cubit.messages[index]);
//                             },
//                             separatorBuilder: (context, index) => SizedBox(
//                               height: 3.h,
//                             ),
//                             itemCount:2),
//                       ),
//                       SizedBox(
//                         height: 2.h,
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(left: 2.w),
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 1.w
//                               ,
//                               color: Theme.of(context)
//                                   .primaryColorDark
//                                   .withAlpha(40)),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(8.w),
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 4.w),
//                                 child: TextField(
//                                   textInputAction: TextInputAction.send,
//                                   autofocus: true,
//                                   canRequestFocus: true,
//                                   autocorrect: false,
//                                   onSubmitted: (value) {
//                                     controllerScroll.animateTo(
//                                         duration: Duration(seconds: 1),
//                                         curve: Curves.ease,
//                                         controllerScroll
//                                             .position.maxScrollExtent);
//                                     if (messageController.text.isNotEmpty) {
//                                       // cubit.sendMessage(
//                                       //     reciverId: model.uId!,
//                                       //     text: messageController.text);
//                                     }
//                                   },
//                                   controller: messageController,
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: "Write Your Message...",
//                                       hintStyle: TextStyle(
//                                         color:
//                                         Theme.of(context).primaryColorDark,
//                                       )),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               color: Theme.of(context).primaryColor,
//                               height: 20.h,
//                               child: MaterialButton(
//                                 minWidth:1.w
//                                 ,
//                                 onPressed: () {
//                                   controllerScroll.animateTo(
//                                       duration: Duration(seconds: 1),
//                                       curve: Curves.ease,
//                                       controllerScroll
//                                           .position.maxScrollExtent);
//                                   if (messageController.text.isNotEmpty) {
//                                     // cubit.sendMessage(
//                                     //     reciverId: model.uId!,
//                                     //     text: messageController.text);
//                                   }
//                                 },
//                                 child: Icon(
//                                   Icons.send,
//                                   color: AppColors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ));
//           },
//           listener: (context, state) {},
//         );
//       },
//     );
//   }
// }
//
// Widget myMessageBuild(BuildContext context, MessageModel model) => Align(
//   alignment: AlignmentDirectional.centerStart,
//   child: Container(
//       padding: EdgeInsets.all( 8.w),
//       decoration: BoxDecoration(
//         color: Colors.grey[400],
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular( 8),
//           topRight: Radius.circular( 8),
//           bottomRight: Radius.circular( 8),
//         ),
//       ),
//       child: Text(model.text!,
//           style: TextStyle(
//               color: Theme.of(context).primaryColorDark,
//               fontWeight: FontWeight.w300))),
// );
// Widget reciverMessageBuild(BuildContext context, MessageModel model) => Align(
//   alignment: AlignmentDirectional.centerEnd,
//   child: Container(
//       padding: EdgeInsets.all( 8.w),
//       decoration: BoxDecoration(
//         color: Colors.blue[200],
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular( 8),
//           topRight: Radius.circular( 8),
//           bottomLeft: Radius.circular( 8),
//         ),
//       ),
//       child: Text(
//         model.text!,
//         style: Theme.of(context).textTheme.titleMedium,
//       )),
// );
