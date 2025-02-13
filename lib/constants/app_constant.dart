import 'package:ecommerce_app/data/local/model/special_item_model.dart';
import 'package:flutter/material.dart';
import '../utils/util_helper.dart';

class AppConstant{
  static List<SpecialItemModel> specialItemList = [
    SpecialItemModel(
        image: "assets/images/noise_earbuds.png",
        name: "Wireless Headphones",
        amount: 1500,
        firstColor: Colors.black,
        secondColor: Colors.blue,
        thirdColor: AppColors.primaryColor),
    SpecialItemModel(
        image: "assets/images/women_sweater.png",
        name: "Women Sweater",
        amount: 700,
        firstColor: AppColors.pinkColor,
        secondColor: AppColors.purpleColor,
        thirdColor: AppColors.primaryColor),
    SpecialItemModel(
        image: "assets/images/nike_quest_shoes.png",
        name: "Nike Quest Shoes",
        amount: 5000,
        firstColor: Colors.black,
        secondColor: AppColors.blueColor,
        thirdColor: Colors.red),
    SpecialItemModel(
        image: "assets/images/uspolo_tshirt.png",
        name: "U.S. Polo T-shirt",
        amount: 800,
        firstColor: Colors.black,
        secondColor: AppColors.primaryColor,
        thirdColor:Colors.yellowAccent,),
  ];
}