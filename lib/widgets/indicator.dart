import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget indicatorWidget(int index) => AnimatedSmoothIndicator(
      activeIndex: index,
      count: 5,
      effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.grey,
        activeDotColor: primaryClr,
      ),
    );
