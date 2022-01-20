
import 'package:e_commerce_advanced/Features/On%20Boarding/Presentation/on_boarding_view.dart';
import 'package:e_commerce_advanced/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({ Key? key }) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{

  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {

    animationController = AnimationController(vsync:this,duration: const Duration(milliseconds: 600) );
    fadingAnimation = Tween<double>(begin: 0.2,end: 1).animate(animationController!);//..addListener(() {
    '''
    these lines are to repeat the code and update it 
    the alternative is animation builder
    alternative of set state
    ''';
    //   setState(() {
    //     if(animationController!.isCompleted){
    //       animationController?.repeat(reverse: true);
    //     }
    //   });
    // });
    animationController?.repeat(reverse: true);
    // or forward
    super.initState();

    goToNextView();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          const Spacer(),
          // the next line is working but it is not good
          // as there is already the same animation prepared
          // AnimatedBuilder(
          //   animation: fadingAnimation!,
          //   builder: (context,_)=>Opacity(
          //     opacity: fadingAnimation?.value,
          //     child: Text(
          //         "Fruit Market",
          //         style: TextStyle(
          //             fontFamily: 'Poppins',
          //             fontSize: 51,
          //             fontWeight: FontWeight.bold,
          //             color: const Color(0xffffffff)
          //         )
          //     ),
          //   )
          //
          // ),
       FadeTransition(
         opacity: fadingAnimation!,
         child: const Text(
                  "Fruit Market",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 51,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff)
                  )
              ),
       ),
          const Spacer(),
          // Image.asset('assets/images/splash_view_image.png'),
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(()=>const OnBoardingView(),transition: Transition.fade);
    });
  }
}