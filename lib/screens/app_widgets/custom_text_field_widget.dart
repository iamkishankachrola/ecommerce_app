import 'package:flutter/material.dart';
import '../../domain/utils/util_helper.dart';


class CustomTextFieldWidget extends StatelessWidget{
  String hintText;
  Icon preFixIcon;
  IconButton? suffixIcon;
  TextEditingController? controller;
  bool obscureText;
  String lableText;
  TextInputType keyboardType;
  CustomTextFieldWidget({super.key, required this.hintText, required this.preFixIcon,required this.controller,required this.keyboardType,required this.lableText,this.suffixIcon,this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                )
            ),
            prefixIcon: preFixIcon,
            suffixIcon: suffixIcon,
            labelText: lableText,
            hintText: hintText,
            hintStyle:  myTextStyle16(fontColor: Colors.grey)),

    );
  }
}