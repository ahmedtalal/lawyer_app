import 'package:flutter/material.dart';
import 'package:hokok/presentation/screen/auth/create_client_account_screen.dart';
import 'package:hokok/presentation/screen/auth/create_lawyer_account_screen.dart';
import 'package:hokok/presentation/screen/auth/login_screen.dart';
import 'package:hokok/presentation/screen/hire_lawyer/hire_lawyer_screen.dart';
import 'package:hokok/presentation/screen/intro/on_boarding_screen.dart';
import 'package:hokok/presentation/screen/intro/splash_screen.dart';
import 'package:hokok/presentation/screen/layout/layout_screen.dart';
import 'package:hokok/presentation/screen/profile/profile_screen.dart';
import 'package:hokok/presentation/screen/talk_with_us/talk_with_us_screen.dart';
import 'package:hokok/core/strings_manager.dart';

import '../laywer_app/presentation/screen/home/widget/main_screen.dart';
import '../presentation/screen/auth/chose_account_screen.dart';
import '../presentation/screen/chat/chat_helper_screen.dart';
import '../presentation/screen/layout_profile/edit_client_profile.dart';
import '../presentation/screen/layout_profile/layout_profile/Lawyer_profile_screen.dart';
import '../presentation/screen/layout_profile/layout_profile/layout_lawyer_profile.dart';
import '../presentation/screen/layout_profile/layout_profile_screen.dart';
import '../presentation/screen/main/main_screen.dart';
import '../presentation/screen/orders/main_order/public_order_screen.dart';
import '../presentation/screen/orders/sub_major/sub_majors_screen.dart';
import '../presentation/screen/welcome/welcome_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String otpRoute = "/otp";
  static const String registerRoute = "/register";
  static const String clientRoute = "/client";
  static const String lawyerRoute = "/lawyer";
  static const String welcomeRoute = "/welcome";
  static const String layoutRoute = "/layout";
  static const String talkWithUsRoute = '/talkWithUs';
  static const String chatRoute = '/chat';
  static const String profileRoute = '/profile';
  static const String hiringRoute = '/hire';
  static const String layoutProfileRoute = '/layoutProfile';
  static const String homeScreenRoute = '/homeScreen';
  static const String laywerProfileScreen = '/LawyerProfile';
  static const String editClientProfileScreen = '/editClient';
  static const String subMajorsScreen = '/subMajors';
  static const String mainOrderScreen = '/mainOrderScreen';
  static const String lawyerHomeScreen = '/lawyerHomeScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.otpRoute:
        return MaterialPageRoute(
          builder: (_) => OTPScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const ChoseAccountScreen());
      case Routes.clientRoute:
        return MaterialPageRoute(builder: (_) => CreateClientAccountScreen());
      case Routes.lawyerRoute:
        return MaterialPageRoute(builder: (_) => CreateLawyerAccountScreen());
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.layoutRoute:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case Routes.talkWithUsRoute:
        return MaterialPageRoute(builder: (_) => const TalkWithUsScreen());
      case Routes.chatRoute:
        return MaterialPageRoute(builder: (_) => const ChatHelperScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.hiringRoute:
        return MaterialPageRoute(builder: (_) => const HireLawyerScreen());
      case Routes.layoutProfileRoute:
        return MaterialPageRoute(builder: (_) => const LayoutProfileScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.laywerProfileScreen:
        return MaterialPageRoute(builder: (_) => const LayoutLawyerProfile());
      case Routes.editClientProfileScreen:
        return MaterialPageRoute(
            builder: (_) => const ClientEditProfileScreen());
      case Routes.subMajorsScreen:
        return MaterialPageRoute(
          builder: (_) => SubMajorsScreen(
            id: settings.arguments as int,
          ),
        );
      case Routes.mainOrderScreen:
        return MaterialPageRoute(
          builder: (_) =>
              MainOrderScreen(data: settings.arguments as Map<String, dynamic>),
        );
      case Routes.lawyerHomeScreen:
        return MaterialPageRoute(builder: (_) => LawyerHomeScreen());

      default:
        return _unDefinedRoute();
    }
  }

  static Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
