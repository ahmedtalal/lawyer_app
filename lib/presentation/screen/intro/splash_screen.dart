import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/constants_manager.dart';
import 'package:hokok/core/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
      const Duration(
        seconds: AppConstants.splashDelay,
      ),
      _goNext,
    );
  }

  _goNext() =>
      Navigator.of(context).pushReplacementNamed(Routes.onboardingRoute);

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.primaryColor,
      body: Center(
        child: Image.asset(
          ImageConstant.splashImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
