import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget{
  String imageUrl;
  CustomCardWidget({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      child: SizedBox(
        width: 60,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}