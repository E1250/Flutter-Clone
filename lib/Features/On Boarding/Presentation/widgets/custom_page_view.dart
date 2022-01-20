import 'package:e_commerce_advanced/Features/On%20Boarding/Presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key,required this.pageController}) : super(key: key);

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(title: "1",subTitle: "Hello",image: "assets/images/onboarding1.png",),
        PageViewItem(title: "2",subTitle: "Hi",image: "assets/images/onboarding2.png",),
        PageViewItem(title: "3",subTitle: "Welcome",image: "assets/images/onboarding3.png",),
      ],
    );
  }
}
