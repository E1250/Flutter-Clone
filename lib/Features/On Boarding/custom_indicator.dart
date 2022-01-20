import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_advanced/core/constants.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({ Key? key ,required this.dotIndex}) : super(key: key);

  final double? dotIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(dotsCount: 3,
          decorator: DotsDecorator(
            color: Colors.transparent,
            activeColor: kMainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: kMainColor
              )
            )
          ),
          position: dotIndex!,
          );
  }
}