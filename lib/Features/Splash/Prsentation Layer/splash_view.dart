import 'package:e_commerce_advanced/Features/Splash/Prsentation%20Layer/widgets/splash_view_body.dart';
import 'package:e_commerce_advanced/core/constants.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kMainColor ,
      body: SplashViewBody(),
    );
  }
}