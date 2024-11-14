import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/constants/app_colors.dart';
import 'package:projectpilot/core/services/cache_storage_services.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/layouts/auth_screen/login_screen.dart';
import 'package:projectpilot/student/presentation/layouts/main_screen.dart';
import 'package:projectpilot/student/presentation/layouts/on_boarding_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/constants/app_constants.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/dio_services.dart';
import 'core/services/notification_services.dart';
import 'core/services/service_locators/services_locator.dart';
import 'firebase_options.dart';

Widget? initialWidget;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(
      NotificationHandler.firebaseMessagingBackgroundHandler);
  await NotificationHandler.setupFirebaseMessaging();

  await DioServices().init();
  ServicesLocator().init();
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();

  AppConstants.userToken = CacheHelper.getData(key: "studentToken");
  AppConstants.userTeam = CacheHelper.getData(key: "studentTeam");
  AppConstants.userLeader = CacheHelper.getData(key: "studentLeader");
  AppConstants.onBoarding = CacheHelper.getData(key: "onBoarding");

  if (kDebugMode) {
    print(AppConstants.userToken);
  }
  initialWidget = AppConstants.onBoarding != null
      ? AppConstants.userToken != null
          ? MainScreen()
          : LoginScreen()
      : const OnboardingScreen();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MainCubit>(),
        )
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Project Pilot',
          theme: ThemeData(
            useMaterial3: true,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: AppColors.blue),
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.white, primary: AppColors.primary),
          ),
          home: initialWidget,
        ),
      ),
    );
  }
}
