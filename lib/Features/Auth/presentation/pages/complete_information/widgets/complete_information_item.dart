import 'dart:math';

import 'package:e_commerce_advanced/core/space_widget.dart';
import 'package:e_commerce_advanced/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CompleteInfoItem extends StatelessWidget {
  const CompleteInfoItem({
     Key? key, 
     required this.text, 
     this.inputType, 
     this.maxLines }) : super(key: key);

  final String? text;
  final TextInputType? inputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          color:const Color(0xff0c0b0b),
          fontWeight: FontWeight.w600
        ),
        textHeightBehavior: TextHeightBehavior(
          applyHeightToFirstAscent: false
        ),
        textAlign: TextAlign.center,
        ),
        VerticalSpace(value:2),
        CustomTextFormField(
          maxLines: maxLines,
          inputType: inputType, onSave: (value) {  }, 
           )


      ],
    );
  }
}