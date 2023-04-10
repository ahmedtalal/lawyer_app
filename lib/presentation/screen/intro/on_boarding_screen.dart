import 'package:flutter/material.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/presentation/widget/shared_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? _controller;

  List<Widget> textSpanList = [
    RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
              text: 'تواصل مع محاميك الخاص ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600)),
          TextSpan(
            text: ' بكل سهولة وسرية',
            style: TextStyle(
                color: ConstantColor.primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.w600),
          ),
        ])),
    RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
              text: '  ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600)),
          TextSpan(
            text: '  ',
            style: TextStyle(
                color: ConstantColor.primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: ' ',
            style: TextStyle(
                color: ConstantColor.whiteColor,
                fontSize: 35,
                fontWeight: FontWeight.w600),
          ),
        ])),
  ];

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.secondaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              onPageChanged: (index) {
                if (index == textSpanList.length - 1) {
                  Navigator.of(context).pushReplacementNamed(
                    Routes.loginRoute,
                    arguments: {"authType": true, "auth": "client"},
                  );
                }
              },
              controller: _controller!,
              itemCount: textSpanList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: textSpanList[index],
                  ),
                );
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget(
                  text: 'مرر يساراً',
                  fontSize: 16,
                  color: ConstantColor.whiteColor),
              const SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                controller: _controller!,
                count: textSpanList.length,
                effect: ExpandingDotsEffect(
                    activeDotColor: ConstantColor.primaryColor,
                    dotHeight: 10,
                    dotWidth: 20,
                    dotColor: ConstantColor.whiteColor),
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
