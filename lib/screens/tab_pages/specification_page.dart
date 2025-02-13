import 'package:flutter/cupertino.dart';
import '../../utils/util_helper.dart';

class SpecificationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Specification Here!!",style: myTextStyle14(fontColor: AppColors.darkGreyColor),)
        ],
      ),
    );
  }
}