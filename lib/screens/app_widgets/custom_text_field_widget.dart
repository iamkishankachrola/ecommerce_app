import 'package:flutter/material.dart';
import '../../domain/utils/util_helper.dart';


class CustomTextFieldWidget extends StatelessWidget{
  String hintText;
  Icon preFixIcon;
  IconButton? suffixIcon;
  TextEditingController? controller;
  bool obscureText;
  String lableText;
  String? Function(String?)? validator;
  TextInputType keyboardType;
  CustomTextFieldWidget({required this.hintText, required this.preFixIcon,required this.controller,required this.keyboardType,required this.lableText,this.validator,this.suffixIcon,this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
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
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
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