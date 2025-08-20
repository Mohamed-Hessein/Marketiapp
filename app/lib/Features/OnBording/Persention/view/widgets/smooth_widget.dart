import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothWidget extends StatelessWidget {
  const SmoothWidget({
    super.key,
    required this.controller,
    required this.totalpage,
  });
  final PageController controller;
  final int totalpage;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: totalpage,
      effect: WormEffect(
        dotHeight: 25.0,
        dotWidth: 23.0,
        paintStyle: PaintingStyle.fill,
        strokeWidth: 2.0,
        activeDotColor: Color(0xFF001640),
        spacing: 5.0,
        dotColor: Colors.grey,
        type: WormType.thinUnderground,
      ),
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
