import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';
import 'package:projectpilot/student/presentation/layouts/notification_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../components/BlogWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  bool press = false;
  int sliderIndex = 0;
  List<String> imageList = [
    "https://img.freepik.com/free-photo/graduation-high-school-university-concept-space-text_185193-110169.jpg?w=1380&t=st=1711203721~exp=1711204321~hmac=404b423eb9e9cd4ef98583214ea65cc9e0ca5ee3b066a87fa4f35db238c5c28b",
    "https://img.freepik.com/free-photo/graduation-high-school-university-concept-space-text_185193-110169.jpg?w=1380&t=st=1711203721~exp=1711204321~hmac=404b423eb9e9cd4ef98583214ea65cc9e0ca5ee3b066a87fa4f35db238c5c28b",
    "https://img.freepik.com/free-photo/graduation-high-school-university-concept-space-text_185193-110169.jpg?w=1380&t=st=1711203721~exp=1711204321~hmac=404b423eb9e9cd4ef98583214ea65cc9e0ca5ee3b066a87fa4f35db238c5c28b",
    "https://img.freepik.com/free-photo/graduation-high-school-university-concept-space-text_185193-110169.jpg?w=1380&t=st=1711203721~exp=1711204321~hmac=404b423eb9e9cd4ef98583214ea65cc9e0ca5ee3b066a87fa4f35db238c5c28b",
  ];

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = MainCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<MainCubit, MainStates>(
              builder: (context, state) {
                return Text(
                  cubit.getStudentInfoEntity != null
                      ? "Hi ${cubit.getStudentInfoEntity!.data.name}.."
                      : "Hi",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text(
              "How are U Today?",
              style: TextStyle(fontSize: 14.sp),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              child: IconButton(
                onPressed: () {
                  Functions.navigatorPush(
                      context: context,
                      screenNameToNavigate: const NotificationScreen());
                  cubit.getStudentJoinRequest(const NoParameters());
                },
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.primary,
                  size: 6.w,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 25.h,
                      autoPlayCurve: Curves.linear,
                      autoPlay: true,
                      animateToClosest: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      onPageChanged: (index, reason) {
                        setState(() {
                          sliderIndex = index;
                        });
                      },
                      // Additional animation properties
                      enlargeCenterPage: false,
                      // Enable center item to be larger
                      viewportFraction: 0.8,
                      // Fraction of the viewport occupied by each item
                      aspectRatio: 16 / 9,
                      // Aspect ratio of each item
                      scrollDirection: Axis.horizontal,
                      // Scroll direction
                      // Add more animation properties here
                      enableInfiniteScroll: true,
                      // Enable infinite scrolling
                      reverse: false,
                      // Reverse the order of items
                      scrollPhysics:
                          const BouncingScrollPhysics(), // Apply bouncing scroll physics
                      // You can customize more animation properties as per your requirement
                    ),
                    items: imageList.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                imageUrl,
                                fit:
                                    BoxFit.cover, // Adjust the BoxFit as needed
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      return Container(
                        width: 2.w,
                        height: 1.h,
                        margin:
                            EdgeInsets.only(left: 2.w, right: 2.w, top: 3.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue.withOpacity(
                                sliderIndex == entry.key ? 0.9 : 0.4)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Text(
                  "Announcements:",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            BlocBuilder<MainCubit, MainStates>(
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: cubit.getBlogsSuccess,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => Expanded(
                      child: ListView.separated(
                              padding: EdgeInsets.only(bottom: 4.h),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                    borderRadius: BorderRadius.circular(4.w),
                                    onTap: () => setState(() {
                                      press = !press;
                                    }),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear,
                                      child: BlogWidget(
                                        blogText: cubit.getBlogsEntity!.data
                                            .blogs[index].content,
                                        mainText: cubit.getBlogsEntity!.data
                                            .blogs[index].title,
                                      ),
                                    ),
                                  ),
                              separatorBuilder: (context, index) => Divider(
                                    height: 2.h,
                                  ),
                              itemCount:
                                  cubit.getBlogsEntity!.data.blogs.length)
                          .animate()
                          .slideY(
                            begin: 1,
                            end: 0,
                            curve: const FlippedCurve(Curves.linear),
                            delay: const Duration(microseconds: 7000),
                          ),
                    ),
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
