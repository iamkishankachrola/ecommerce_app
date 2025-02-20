import 'package:flutter/cupertino.dart';

class CustomContainer extends StatelessWidget{
  Color color;
  double width;
  double height;
  Border? border;
  CustomContainer({required this.color, required this.width, required this.height, this.border});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: border ?? Border.all(style: BorderStyle.none),
        color: color,
      ),
    );
  }
}