import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:projectpilot/core/assets_paths/app_png_paths.dart';
import 'package:projectpilot/core/functions/functions.dart';
import 'package:projectpilot/core/services/cache_storage_services.dart';
import 'package:projectpilot/student/presentation/layouts/auth_screen/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: Text(
                "Task Management System",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              bodyWidget: Text(
                "Our task management system helps you stay organized and on top of your responsibilities. Easily track your to-dos, set deadlines, and monitor progress with intuitive tools. From project planning to everyday tasks, manage your workload efficiently and effectively.",
                style: TextStyle(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              image: FadeInRight(
                duration: const Duration(milliseconds: 1000),
                child: Center(
                  child:
                      Image.asset(pngPaths.tasksImageOnBoarding, height: 50.h),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    "Communication System",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  )),
              bodyWidget: FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    "Our communication system fosters effective collaboration and engagement. Whether you're working with a team or reaching out for support, this feature ensures clear and seamless conversations. Stay connected and informed with real-time messaging and discussion boards.",
                    style: TextStyle(
                      fontSize: 17.5.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  )),
              image: FadeInRight(
                duration: const Duration(milliseconds: 1000),
                child: Center(
                  child: Image.asset(pngPaths.communicationImageOnBoarding,
                      height: 50.h),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  "Announcement System",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
              ),
              bodyWidget: FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  "Our announcement system keeps you updated with the latest news and important notifications. Receive real-time alerts for meetings, deadlines, and events directly on your mobile device. Stay informed and never miss out on crucial information with our streamlined notification service.",
                  style: TextStyle(
                    fontSize: 17.5.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              image: FadeInRight(
                duration: const Duration(milliseconds: 1000),
                child: Center(
                  child: Image.asset(pngPaths.announcementsImageOnBoarding,
                      height: 50.h),
                ),
              ),
            ),
          ],
          onDone: () {
            CacheHelper.saveData(key: "onBoarding", value: true);
            Functions.navigatorPushAndRemove(context, LoginScreen());
          },
          onSkip: () {
            CacheHelper.saveData(key: "onBoarding", value: true);

            Functions.navigatorPushAndRemove(context, LoginScreen());
          },
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
      ),
    );
  }
}
