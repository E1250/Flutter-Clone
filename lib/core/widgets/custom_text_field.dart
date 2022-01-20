import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.inputType,
    this.suffexIcon, 
    required this.onSave, 
    this.onChanged, 
    required this.maxLines 
    });

  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSave;
  final ValueSetter? onChanged;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSave,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xffcccccc)
          )
        )
      ),
    );
  }
}