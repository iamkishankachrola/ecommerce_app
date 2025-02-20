import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../domain/constants/app_constant.dart';
import '../../domain/utils/util_helper.dart';
import '../about_product_page.dart';
import '../app_widgets/custom_container.dart';
import '../app_widgets/custom_slider_sizedbox.dart';

class NavHomePage extends StatefulWidget{
  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  int currentIndex = 0;


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
            PopupMenuButton(
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child:Row(
                    children: [
                      Icon(Icons.logout_outlined,color: AppColors.primaryColor),
                      SizedBox(width: 10,),
                      Text("Logout",style: TextStyle(color: AppColors.primaryColor),)
                    ],
                  ),
                )];
            },)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: ListView(
            children: [
              const SizedBox(height: 15,),
              SearchBar(
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
                backgroundColor: const WidgetStatePropertyAll(AppColors.lightGreyColor),
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
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(items: [
                    CustomSliderSizedBox(imgUrl: "assets/images/shoes.jpg", title1: "Super Sale", title2: "Discount", description1: "Up to ", description2: "50%",
                      title1TextStyle: myTextStyleBold24(), title2TextStyle: myTextStyleBold24() , desc1TextStyle: myTextStyleBold18(), desc2TextStyle: myTextStyleExtraBold28(), currentIndex: currentIndex,),
                    CustomSliderSizedBox(imgUrl: "assets/images/galaxys25ultra.jpg", title1: "SAMSUNG", title2: "Galaxy S25 Ultra", description1: "Pre-book & get benefits", description2: "Worth ₹21,000",
                        title1TextStyle: myTextStyleBold24(fontColor: Colors.white), title2TextStyle: myTextStyleBold24(fontColor: Colors.white) , desc1TextStyle: myTextStyleBold14(fontColor: Colors.white), desc2TextStyle: myTextStyleBold14(fontColor: Colors.white),currentIndex: currentIndex),
                    CustomSliderSizedBox(imgUrl: "assets/images/appliances.jpg", title1: "Appliances Upgrade Days", title2: "Starting ₹4,999", description1: "", description2: "",
                        title1TextStyle: myTextStyleBold14(), title2TextStyle: myTextStyleExtraBold28(),currentIndex: currentIndex),
                    CustomSliderSizedBox(imgUrl: "assets/images/shirts.jpg", title1: "Men's Clothing", title2: "Min. 50% off", description1: "", description2: "",
                        title1TextStyle: myTextStyleBold24(fontColor: Colors.white), title2TextStyle: myTextStyleExtraBold28(fontColor: Colors.white),currentIndex: currentIndex),
                  ],
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      )),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          AppConstant.sliderItemList.asMap().entries.map((entry) {
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
                      ),
                    ),
                  )
                ]),
              const SizedBox(height: 25,),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ListView.builder(itemCount:AppConstant.categoryList.length,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(image: AssetImage(AppConstant.categoryList[index]["image"],),fit: BoxFit.fill)
                        ),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(width:70,child: Center(child: Text(AppConstant.categoryList[index]["name"],maxLines: 2,style: myTextStyle13(),)))
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
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(10)),
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
                          const SizedBox(height: 10,),
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
                                  width: 86,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Stack(
                                          alignment: Alignment.center,
                                          children:[
                                            CustomContainer(color: Colors.transparent, width: 21, height: 21, border: Border.all(color: Colors.black)),
                                            CustomContainer(color: AppConstant.specialItemList[index].firstColor,width: 16, height: 16)
                                          ]),
                                      CustomContainer(color:  AppConstant.specialItemList[index].secondColor,width: 16, height: 16),
                                      CustomContainer(color: AppConstant.specialItemList[index].thirdColor,width: 16, height: 16),
                                      Stack(
                                          alignment: Alignment.center,
                                          children:[
                                            CustomContainer(color: AppColors.lightGreyColor,border: Border.all(color:AppColors.darkGreyColor),width: 16, height: 16),
                                            Text("+2",style: myTextStyle7(fontColor: Colors.grey.shade800),)
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