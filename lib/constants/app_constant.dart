import 'package:flutter/material.dart';
import '../model/special_item_model.dart';
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
  static const List<Map<String,dynamic>> cartItems = [
    {
      "image" : "assets/images/noise_earbuds.png",
      "name" : "Wireless Headphones",
      "category" : "Electronics",
      "amount" : "1500"
    },
    {
      "image" : "assets/images/women_sweater.png",
      "name" : "Women Sweater",
      "category" : "Women's Fashion",
      "amount" : "700"
    },
    {
      "image" : "assets/images/nike_quest_shoes.png",
      "name" : "Nike Quest Shoes",
      "category" : "Shoes",
      "amount" : "5000"
    },
  ];
  static const List<String> imageList = [
    "assets/images/x_prime.png",
    "assets/images/x_prime_2.png",
    "assets/images/x_prime_3.png",
    "assets/images/x_prime_4.png",
    "assets/images/x_prime_5.png"
  ];
  static const List<Map<String,dynamic>> categoryList = [
    {
      "image" : "assets/images/nike_shoes.jpeg",
      "name" : "Shoes"
    },
    {
      "image" : "assets/images/mobiles.jpeg",
      "name" : "Mobiles"
    },
    {
      "image" : "assets/images/leptops.jpg",
      "name" : "Electronics"
    },
    {
      "image" : "assets/images/men_fashion.jpeg",
      "name" : "   Men's \n\t\tFashion"
    },
    {
      "image" : "assets/images/women_fashion.jpeg",
      "name" : " Women's \n\t\tFashion"
    },
    {
      "image" : "assets/images/jwellery_items.jpeg",
      "name" : "Jewellery "
    },
    {
      "image" : "assets/images/appliances_items.jpg",
      "name" : "Appliances"
    },
    {
      "image" : "assets/images/mackup_item.jpg",
      "name" : "Beauty"
    },
  ];
  static const List<Map<String,dynamic>> sliderItemList = [
    {
      "image" : "assets/images/shoes.jpg",
      "title1" : "Super Sale",
      "title2" : "Discount",
      "description1" : "Up to ",
      "description2" : "50% ",
      "text" : "Shop Now",
    },
    {
      "image" : "assets/images/galaxys25ultra.jpg",
      "title1" : "SAMSUNG",
      "title2" : "Galaxy S25 Ultra",
      "description1" : "Pre-book & get benefits",
      "description2" : "Worth ₹21,000%",
      "text" : "Shop Now",
    },
    {
      "image" : "assets/images/appliances.jpg",
      "title1" : "Appliances Upgrade Days",
      "title2" : "",
      "description1" : "Starting ₹4,999",
      "description2" : "",
      "text" : "Shop Now",
    },
    {
      "image" : "assets/images/shirts.jpg",
      "title1" : "Men's Clothing",
      "title2" : "",
      "description1" : "Min. 50% off",
      "description2" : "",
      "text" : "Shop Now",
    },
  ];
}