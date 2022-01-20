import 'package:e_commerce_advanced/Features/Auth/presentation/pages/complete_information/widgets/complete_information_item.dart';
import 'package:e_commerce_advanced/core/space_widget.dart';
import 'package:e_commerce_advanced/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class CompleteInformationBody extends StatelessWidget {
  const CompleteInformationBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(value:10),
        CompleteInfoItem(text: "Enter Your Name "),
        VerticalSpace(value:2),
        CompleteInfoItem(text: "Enter Your Phone Number "),
        VerticalSpace(value:2),
        CompleteInfoItem(maxLines: 5,text: "Enter address "),
        VerticalSpace(value:5),
        CustomGeneralButton(
          text: "Login",
        onTap:(){} )

      ],
    );
  }
}