import 'package:flutter/material.dart';
import '../utils/util_helper.dart';

class CustomTextFieldWidget extends StatelessWidget{
  String hintText;
  Icon preFixIcon;
  IconButton? suffixIcon;
  TextEditingController? controller;
  bool obscureText;
  TextInputType keyboardType;
  CustomTextFieldWidget({super.key, required this.hintText, required this.preFixIcon,required this.controller,required this.keyboardType,this.suffixIcon,this.obscureText = false});
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
                  color: Color(0xff8D8E91),
                  width: 2,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                )
            ),
            prefixIcon: preFixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:  myTextStyle16(fontColor: Colors.grey))
    );
  }
}