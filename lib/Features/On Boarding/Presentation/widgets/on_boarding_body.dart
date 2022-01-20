import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_advanced/Features/Auth/presentation/pages/login/login_view.dart';
import 'package:e_commerce_advanced/Features/On%20Boarding/Presentation/widgets/custom_page_view.dart';
import 'package:e_commerce_advanced/Features/On%20Boarding/custom_indicator.dart';
import 'package:e_commerce_advanced/core/constants.dart';
import 'package:e_commerce_advanced/core/utils/size_config.dart';
import 'package:e_commerce_advanced/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

PageController? pageController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0)..addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(pageController: pageController,),
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.defaultSize!*22,
          child: CustomIndicator(dotIndex: pageController!.hasClients?pageController?.page:0,)
        ),
        Visibility(
          visible:pageController!.hasClients? (pageController!.page==2?false:true):true,
          child: Positioned(
            top: SizeConfig.defaultSize! *10,
            right: 32,
            child: const Text(
              'Skip',
              style: TextStyle(
                fontFamily: 'Poppians',
                fontSize: 14,
                color: Color(0xff898989),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 10,
            left: SizeConfig.defaultSize! * 10,
            right: SizeConfig.defaultSize! * 10,
            child: CustomGeneralButton(
              onTap: (){
                if(pageController!.page!<2){
                  pageController?.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                }else{
                  Get.to(()=>LoginView(),transition: Transition.rightToLeft,duration:Duration(milliseconds: 500) );
                }
              },
              text:pageController!.hasClients?(pageController!.page==2?'Get Started':'Next'):'Next',
              )
        ),
      ],
    );
  }
}
