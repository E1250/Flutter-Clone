import 'package:e_commerce_advanced/Features/Auth/presentation/pages/complete_information/complete_information_view.dart';
import 'package:e_commerce_advanced/core/constants.dart';
import 'package:e_commerce_advanced/core/space_widget.dart';
import 'package:e_commerce_advanced/core/utils/size_config.dart';
import 'package:e_commerce_advanced/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(value : 10),
        SizedBox(
          // child: Image.asset(kLogo),
          height: SizeConfig.defaultSize! * 17,
        ),
        Text(
          'Fruit Market',
          style: TextStyle(
            fontSize: 51,
            color: const Color(0xff69a03a),
          ),
        ),
        Expanded(child: SizedBox()),
        Row(children: [
          Flexible(
            flex: 1,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomButtonWithIcon(
              color:Color(0xffdb3236),
              iconData: FontAwesomeIcons.googlePlusG,
              text: 'Log in with',
            ),
            )),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButtonWithIcon(
                  onTap: (){
                    Get.to(()=>CompleteInformationView(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.rightToLeft
                    );},
                  color:Color(0xff426782),
                  iconData: FontAwesomeIcons.facebookF,
                  text: 'Log in with',
                )
              )
              )
        ],
        ),
        Expanded(child: SizedBox()),

      ],
    );
  }
}