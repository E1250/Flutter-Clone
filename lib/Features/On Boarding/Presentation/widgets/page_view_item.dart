import 'package:e_commerce_advanced/core/space_widget.dart';
import 'package:e_commerce_advanced/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, required this.title, required this.subTitle,required this.image}) : super(key: key);

  final String?title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const VerticalSpace(value: 18,),
        // SizedBox(height: SizeConfig.defaultSize! * 25,child: Image.asset(image!)),
        const VerticalSpace(value: 2.5,),
        Text(
          title!,
          style: TextStyle(
            fontSize: 20,
            color: const Color(0xff2f2e41),
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.left,
        ),
        const VerticalSpace(value: 1,),
        Text(
          subTitle!,
          style: TextStyle(
              fontSize: 20,
              color: const Color(0xff78787c),
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
