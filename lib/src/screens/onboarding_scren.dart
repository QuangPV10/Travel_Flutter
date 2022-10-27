import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/screens/home_screen.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/slider_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: const [
              SliderItem(
                img: slide1Img,
                title: 'Book a flight',
                description:
                    'Found a flight that matches your destination and schedule? Book it instantly.',
                alignment: Alignment.centerRight,
              ),
              SliderItem(
                img: slide2Img,
                title: 'Find a hotel room',
                description:
                    'Select the day, book your room. We give you the best price.',
                alignment: Alignment.center,
              ),
              SliderItem(
                img: slide3Img,
                title: 'Enjoy your trip',
                description:
                    'Easy discovering new places and share these between your friends and travel together.',
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
              left: kMediumPadding,
              right: kMediumPadding,
              bottom: kMediumPadding * 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          dotColor: Colors.orange,
                          dotWidth: kMinPadding * 2,
                          dotHeight: kMinPadding * 2),
                    ),
                  ),
                  StreamBuilder<int>(
                      initialData: 0,
                      stream: _pageStreamController.stream,
                      builder: (context, snapshot) {
                        return Expanded(
                            flex: 4,
                            child: ButtonWidget(
                                text:
                                    snapshot.data == 2 ? 'Get Started' : 'Next',
                                onTap: () {
                                  if (_pageController.page != 2) {
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(microseconds: 200),
                                        curve: Curves.easeIn);
                                  } else {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  }
                                }));
                      })
                ],
              ))
        ],
      ),
    );
  }
}
