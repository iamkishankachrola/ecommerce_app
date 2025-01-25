import 'package:ecommerce_app/domain/app_colors.dart';
import 'package:ecommerce_app/domain/ui_helper.dart';
import 'package:flutter/cupertino.dart';

class DescriptionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description Here!!",style: myTextStyle14(fontColor: AppColors.darkGreyColor),)
        ],
      ),
    );
  }
}