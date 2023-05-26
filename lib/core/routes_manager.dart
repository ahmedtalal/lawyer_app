import 'package:flutter/material.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/lawyer_profile_entity.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_notifications_screen.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_order_details_screen.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_own_order_details_screen.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_send_request_screen.dart';
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

import '../domain/entities/major_entity.dart';
import '../laywer_app/presentation/screen/home/widget/main_screen.dart';
import '../presentation/screen/auth/chose_account_screen.dart';
import '../presentation/screen/browse_order/choose_lawyer_screen.dart';
import '../presentation/screen/browse_order/order_details_screen.dart';
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
  static const String lawyerProfileScreen = '/LawyerProfile';
  static const String editClientProfileScreen = '/editClient';
  static const String subMajorsScreen = '/subMajors';
  // static const String orderDetailsScreen = '/orderDetailsScreen';
  static const String mainOrderScreen = '/mainOrderScreen';
  static const String lawyerHomeScreen = '/lawyerHomeScreen';
  static const String notificationLawyersScreen = "/notificationsLawyersScreen";
  static const String lawyerOrderDetailsScreen = "/lawyerOrderDetailsScreen";
  static const String lawyerSendRequestScreen = "/lawyerSendRequesrScreen";
  static const String lawyerOwnOrderDetailsScreen = "/lawyerOwnOrdersScreen";
  static const String chooseLawyer = '/ChooseLawyer';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.otpRoute:
        return MaterialPageRoute(
          builder: (_) => const OTPScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const ChoseAccountScreen());
      case Routes.clientRoute:
        return MaterialPageRoute(builder: (_) => CreateClientAccountScreen());
      case Routes.lawyerRoute:
        return MaterialPageRoute(builder: (_) => CreateLawyerAccountScreen());
      case Routes.welcomeRoute:
        return MaterialPageRoute(
            builder: (_) => WelcomeScreen(
                  name: settings.arguments as String,
                ));
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
      case Routes.lawyerProfileScreen:
        return MaterialPageRoute(builder: (_) => const LayoutLawyerProfile());
      case Routes.chooseLawyer:
        return MaterialPageRoute(builder: (_) => const ChooseLawyer());
      // case Routes.orderDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => const OrderDetailsScreen());
      case Routes.editClientProfileScreen:
        return MaterialPageRoute(
          builder: (_) => ClientEditProfileScreen(
            userEntity: settings.arguments as LawyerProfileEntity,
          ),
        );
      case Routes.subMajorsScreen:
        return MaterialPageRoute(
          builder: (_) => SubMajorsScreen(
            model: settings.arguments as MajorData,
          ),
        );
      case Routes.mainOrderScreen:
        return MaterialPageRoute(
          builder: (_) =>
              MainOrderScreen(data: settings.arguments as Map<String, dynamic>),
        );
      case Routes.lawyerHomeScreen:
        return MaterialPageRoute(builder: (_) => const LawyerHomeScreen());
      case Routes.notificationLawyersScreen:
        return MaterialPageRoute(
            builder: (_) => const NotificationsLawyerScreen());
      case Routes.lawyerOrderDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => LaweyrOrderDetailsScreen(
            order: settings.arguments as OrderInfoModel,
          ),
        );
      case Routes.lawyerSendRequestScreen:
        return MaterialPageRoute(
          builder: (_) => LawyerSendRequestScreen(
            order: settings.arguments as OrderInfoModel,
          ),
        );
      case Routes.lawyerOwnOrderDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => LawyerOwnOrderDetailsScreen(
            order: settings.arguments as OwnOrdersInfoModel,
          ),
        );
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
