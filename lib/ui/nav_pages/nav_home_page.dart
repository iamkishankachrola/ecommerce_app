import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/domain/app_constant.dart';
import 'package:ecommerce_app/ui/about_product_page.dart';
import 'package:flutter/material.dart';
import '../../domain/app_colors.dart';
import '../../domain/ui_helper.dart';

class NavHomePage extends StatefulWidget{
  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  int currentIndex = 0;
  List<String> imageList = [
    "assets/images/shoes.jpg",
    "assets/images/galaxys25ultra.jpg",
    "assets/images/appliances.jpg",
    "assets/images/shirts.jpg"
  ];
  List<Map<String,dynamic>> categoryList = [
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
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){},icon: Image.asset("assets/icons/menue.png",width:24,height:24,),
                style: IconButton.styleFrom(backgroundColor: AppColors.lightGreyColor),),
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_rounded),
              style: IconButton.styleFrom(backgroundColor: AppColors.lightGreyColor,foregroundColor: Colors.black),),
            const SizedBox(width:10)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: ListView(
            children: [
              const SizedBox(height: 15,),
              SearchBar(
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
                backgroundColor: WidgetStatePropertyAll(AppColors.lightGreyColor),
                elevation: const WidgetStatePropertyAll(0),
                hintText: "Search...",
                hintStyle: WidgetStatePropertyAll(myTextStyle14()),
                leading: Image.asset("assets/icons/search.png",width:25,height:25,color: Colors.black,),
                trailing: [
                  Container(
                    width: 2,
                    height: 25,
                    color: AppColors.darkGreyColor,
                  ),
                  const SizedBox(width:15,),
                  Image.asset("assets/icons/setting.png",width: 25,height: 25,)
                ],
              ),
              const SizedBox(height: 20,),
              CarouselSlider(items: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset("assets/images/shoes.jpg",fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Super Sale",style: myTextStyleBold24()),
                              Text("Discount",style: myTextStyleBold24()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Up to ",style: myTextStyleBold18()),
                                  Text("50% ",style: myTextStyleExtraBold28()),
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
                        Positioned(
                          bottom: 10,
                          left: 150,
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset( "assets/images/galaxys25ultra.jpg",fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SAMSUNG",style: myTextStyleBold24(fontColor: Colors.white)),
                              Text("Galaxy S25 Ultra",style: myTextStyleBold24(fontColor: Colors.white)),
                              Text("Pre-book & get benefits",style: myTextStyleBold14(fontColor: Colors.white),),
                              Text("Worth ₹21,000",style: myTextStyleBold14(fontColor: Colors.white),),
                              const SizedBox(height: 5,),
                              ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:AppColors.primaryColor,
                                    foregroundColor: Colors.white
                                ), child:const Text("Shop Now"),)
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 150,
                          child: Row(
                              children:
                              imageList.asMap().entries.map((e) {
                                return GestureDetector(
                                    child: currentIndex == e.key ? Container(
                                      width: 17 ,
                                      height: 7,
                                      margin: const EdgeInsets.symmetric(horizontal:2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.black),
                                          color:AppColors.primaryColor
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
                                    )
                                );
                              },).toList()

                          ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset( "assets/images/appliances.jpg",fit: BoxFit.fill,width: double.infinity,height: double.infinity),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Appliances Upgrade Days",style: myTextStyleBold14()),
                              Text("Starting ₹4,999",style: myTextStyleExtraBold28()),
                              const SizedBox(height: 30,),
                              ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:AppColors.primaryColor,
                                    foregroundColor: Colors.white
                                ), child:const Text("Shop Now"),)
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 150,
                          child: Row(
                              children:
                              imageList.asMap().entries.map((e) {
                                return GestureDetector(
                                    child: currentIndex == e.key ? Container(
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
                                    )
                                );
                              },).toList()

                          ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(  "assets/images/shirts.jpg",fit: BoxFit.fill,width: double.infinity,height: double.infinity),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Men's Clothing",style: myTextStyleBold24(fontColor: Colors.white)),
                              Text("Min. 50% off",style: myTextStyleExtraBold28(fontColor: Colors.white)),
                              const SizedBox(height: 30),
                              ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:AppColors.primaryColor,
                                    foregroundColor: Colors.white
                                ), child:const Text("Shop Now"),)
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 150,
                          child: Row(
                              children:
                              imageList.asMap().entries.map((e) {
                                return GestureDetector(
                                    child: currentIndex == e.key ? Container(
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
                                    )
                                );
                              },).toList()

                          ),)
                      ],
                    ),
                  ),
                ),
              ],options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),
              const SizedBox(height: 25,),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ListView.builder(itemCount:categoryList.length,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(image: AssetImage(categoryList[index]["image"],),fit: BoxFit.fill)
                        ),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(width:70,child: Center(child: Text(categoryList[index]["name"],maxLines: 2,style: myTextStyle13(),)))
                    ],
                  );
                },),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special For You",style: myTextStyleBold18(),),
                  Text("See all",style: myTextStyle14(fontColor: AppColors.darkGreyColor),)
                ],
              ),
              const SizedBox(height:10),
              SizedBox(
                width: double.infinity,
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5/6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20
                ), shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),itemCount: AppConstant.specialItemList.length,itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialItemPage(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.lightGreyColor
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(10)),
                                  color: AppColors.primaryColor,
                                ),
                                child: IconButton(onPressed: (){}, icon:Image.asset("assets/icons/heart.png",width: 20,height: 20,color: Colors.white,)),

                              )
                            ],
                          ),
                          Center(child: Image.asset(AppConstant.specialItemList[index].image,width: 100,height: 100,)),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(AppConstant.specialItemList[index].name,style: myTextStyleBold14(),),
                          ),
                          const SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("₹",style: myTextStyleBold14(),),
                                    Text(AppConstant.specialItemList[index].amount.toString(),style: myTextStyleBold14(),),
                                  ],
                                ),
                                SizedBox(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Stack(
                                          alignment: Alignment.center,
                                          children:[
                                            Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  border: Border.all(color: Colors.black)
                                              ),
                                            ),
                                            Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: AppConstant.specialItemList[index].firstColor
                                              ),
                                            ),
                                          ]),
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: AppConstant.specialItemList[index].secondColor
                                        ),
                                      ),
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: AppConstant.specialItemList[index].thirdColor
                                        ),
                                      ),
                                      Stack(
                                          alignment: Alignment.center,
                                          children:[
                                            Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  border: Border.all(color:AppColors.darkGreyColor)
                                              ),
                                            ),
                                            Text("+2",style: myTextStyle6(fontColor: AppColors.darkGreyColor),)
                                          ]),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },),

              ),
              const SizedBox(height:20)
            ],
          ),
        )
    );
  }
}