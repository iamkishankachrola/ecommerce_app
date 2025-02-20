import 'package:flutter/material.dart';

import '../../domain/utils/util_helper.dart';


class CustomSliderSizedBox extends StatelessWidget{
  String imgUrl;
  String title1;
  String title2;
  String description1;
  String description2;
  TextStyle title1TextStyle;
  TextStyle title2TextStyle;
  TextStyle? desc1TextStyle;
  TextStyle? desc2TextStyle;
  int currentIndex;
  CustomSliderSizedBox({required this.imgUrl, required this.title1,required this.title2, required this.description1, required this.description2, required this.title1TextStyle, required this.title2TextStyle, required this.currentIndex ,this.desc1TextStyle, this.desc2TextStyle});
  @override
  Widget build(BuildContext context) {
    return currentIndex !=1 ?SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(imgUrl,fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$title1 ",style: title1TextStyle),
                  Text(title2,style: title2TextStyle),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(description1,style:desc1TextStyle),
                      Text(description2,style:desc2TextStyle),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:AppColors.primaryColor,
                        foregroundColor: Colors.white
                    ), child:const Text("Shop Now"),)
                ],
              ),
            ),
          ],
        ),
      ),
    ) :  SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(imgUrl,fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title1,style: title1TextStyle),
                  Text(title2,style: title2TextStyle),
                  Text(description1,style:desc1TextStyle),
                  Text(description2,style:desc2TextStyle),
                  const SizedBox(height: 5,),
                  ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:AppColors.primaryColor,
                        foregroundColor: Colors.white
                    ), child:const Text("Shop Now"),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}