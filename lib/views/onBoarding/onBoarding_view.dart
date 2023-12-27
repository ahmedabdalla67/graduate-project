import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/views/login_register/login_view.dart';
import 'package:shop_app/shared/widgets/button_widget.dart';
import 'package:shop_app/shared/widgets/onBoarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding {
  String title;
  String image;
  OnBoarding({required this.image, required this.title});
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  bool isLast = false;
  List<OnBoarding> listOfBoarding = [
    OnBoarding(
        image: 'assets/images/on-boarding-1.png',
        title: 'The Best App For Shipping & Delivery In Egypt'),
    OnBoarding(
        image: 'assets/images/on-boarding-2.png',
        title: 'You are our Priority, shipping fast, easyand safe'),
    OnBoarding(
        image: 'assets/images/on-boarding-3.png',
        title: 'Welcome to Waddi and enjoy ourservice'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              CacheHelper.saveData(key: 'onBoarding', value: false)
                  .then((value) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginView()));
              });
            },
            child: const Text('Skip'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) =>
                    onBoardingItem(listOfBoarding[index]),
                itemCount: listOfBoarding.length,
                onPageChanged: (index) {
                  if (index == listOfBoarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: listOfBoarding.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 15,
                dotHeight: 15,
                dotColor: Colors.grey,
                activeDotColor: kMainColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
                onPressed: () {
                  if (isLast) {
                    CacheHelper.saveData(key: 'onBoarding', value: true)
                        .then((value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginView()));
                    });
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.linearToEaseOut);
                  }
                },
                text: isLast ? 'Get Started' : 'Next'),
          ],
        ),
      ),
    );
  }
}
