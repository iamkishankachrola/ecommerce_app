import 'package:flutter/material.dart';
import '../../data/local/model/special_item_model.dart';
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
  static const List<Map<String,dynamic>> categoryList = [
    {
      "image" : "assets/images/oppo.png",
      "name" : "Shoes"
    },
    {
      "image" : "assets/images/lenovo.jpeg",
      "name" : "Mobiles"
    },
    {
      "image" : "assets/images/apple.jpeg",
      "name" : "Electronics"
    },
    {
      "image" : "assets/images/samsung.jpg",
      "name" : "   Men's \n\t\tFashion"
    },
    {
      "image" : "assets/images/mi.jpg",
      "name" : " Women's \n\t\tFashion"
    },
    {
      "image" : "assets/images/vivo.jpg",
      "name" : "Jewellery "
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
      "image" : "assets/images/shirt.jpg",
      "title1" : "Men's Clothing",
      "title2" : "",
      "description1" : "Min. 50% off",
      "description2" : "",
      "text" : "Shop Now",
    },
  ];
  static List<List<String>> productImageList = [
    [
      "assets/images/product_images/vivoy20_1.png",
      "assets/images/product_images/vivoy20_2.png",
      "assets/images/product_images/vivoy20_3.png",
      "assets/images/product_images/vivoy20_4.png",
    ],
    [
      "assets/images/product_images/oppoa17_1.png",
      "assets/images/product_images/oppoa17_2.png",
      "assets/images/product_images/oppoa17_3.png",
      "assets/images/product_images/oppoa17_4.png",
    ],
    [
      "assets/images/product_images/redmi_1.png",
      "assets/images/product_images/redmi_3.png",
      "assets/images/product_images/redmi_4.png",
      "assets/images/product_images/redmi_2.png"
    ],
    [
      "assets/images/product_images/iphone_1.png",
      "assets/images/product_images/iphone_2.png",
      "assets/images/product_images/iphone_3.png",
      "assets/images/product_images/iphone_4.png",
    ]
  ];
  static const List<String> sellerName = [
    "Vivo","Oppo","Realme","Apple"
  ];
}