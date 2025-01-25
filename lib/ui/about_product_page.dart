import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/domain/ui_helper.dart';
import 'package:ecommerce_app/ui/nav_pages/nav_cart_page.dart';
import 'package:ecommerce_app/ui/nav_pages/nav_home_page.dart';
import 'package:ecommerce_app/ui/tab_pages/description_page.dart';
import 'package:ecommerce_app/ui/tab_pages/reviews_page.dart';
import 'package:ecommerce_app/ui/tab_pages/specification_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/app_colors.dart';

class SpecialItemPage extends StatefulWidget{
  @override
  State<SpecialItemPage> createState() => _SpecialItemPageState();
}

class _SpecialItemPageState extends State<SpecialItemPage> {
  int currentIndex = 0;
  List<String> imageList = [
    "assets/images/x_prime.png",
    "assets/images/x_prime_2.png",
    "assets/images/x_prime_3.png",
    "assets/images/x_prime_4.png",
    "assets/images/x_prime_5.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            },icon:  const Icon(Icons.arrow_back_ios_rounded,size: 20,),
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},icon:  const Icon(Icons.share_outlined,size: 20,),
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){},icon:  const Icon(Icons.favorite_border_rounded,size: 20,),
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),),
          const SizedBox(width: 10,)
        ],
      ),
      body: Stack(
        children: [
          ListView(
              children:[
                Container(
                  width: double.infinity,
                  height: 250,
                  color: AppColors.lightGreyColor,
                  child: Stack(
                      children:[
                        CarouselSlider(items:imageList.map((element) {
                          return Image.asset(element,width: 200,height: 200,);
                        },).toList(),options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        )),
                        Positioned(
                          bottom: 10,
                          left: 180,
                          child: Row(
                              children:
                              imageList.asMap().entries.map((entry) {
                                return currentIndex == entry.key ? Container(
                                  width: 17 ,
                                  height: 7,
                                  margin: const EdgeInsets.symmetric(horizontal:2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black),
                                      color: AppColors.primaryColor
                                  ),
                                ) : Container(
                                  width: 7,
                                  height: 7,
                                  margin: const EdgeInsets.symmetric(horizontal:2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white
                                  ),
                                );
                              },).toList()

                          ),)
                      ]
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wireless Headphone",style: myTextStyleBold24(),),
                          Text("₹1500",style: myTextStyleBold20(),),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.primaryColor
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.star,size: 12,color: Colors.white,),
                                        const SizedBox(width: 2),
                                        Text("4.8",style: myTextStyle12(fontColor: Colors.white),)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text("(320 Review)",style: myTextStyle14(fontColor: AppColors.darkGreyColor),),
                                ],
                              ),
                              Text("Seller: Noise",style: myTextStyleBold18(),)
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Text("Color",style: myTextStyleBold20(),),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: 210,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.darkRed
                                  ),
                                ),
                                Stack(
                                    alignment: Alignment.center,
                                    children:[
                                      Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Colors.black)
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.black
                                        ),
                                      ),
                                    ]),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.blueColor
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.darkBrown
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.lightGreyColor
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height:20,),
                          SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: DefaultTabController(
                                length: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: TabBar(
                                          unselectedLabelColor: Colors.black,
                                          labelStyle:  myTextStyleBold14(fontColor: Colors.white),
                                          indicator: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: AppColors.primaryColor
                                          ),
                                          indicatorSize: TabBarIndicatorSize.tab,
                                          dividerColor: Colors.white,
                                          tabs: const [
                                            Tab(text: "Description",),
                                            Tab(text: "Specifications",),
                                            Tab(text: "Reviews",),
                                          ]),
                                    ),
                                    Expanded(
                                      child: TabBarView(children: [
                                        DescriptionPage(),
                                        SpecificationPage(),
                                        ReviewsPage()
                                      ]),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                          color: Colors.black
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.remove,size: 18,color: Colors.white,),
                          Text("1",style: myTextStyleBold18(fontColor: Colors.white),),
                          const Icon(Icons.add ,size: 18,color: Colors.white,)
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavCartPage(),));
                      },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity,50),
                            backgroundColor: AppColors.primaryColor ,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                        ), child: Text("Add to Cart",style: myTextStyleBold18(fontColor: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],

      ),
    );
  }
}