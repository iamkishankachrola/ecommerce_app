import 'package:flutter/material.dart';
import '../../utils/util_helper.dart';

class NavCartPage extends StatelessWidget{
  List<Map<String,dynamic>> cartItems = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
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
        title: Text("My Cart",style: myTextStyleBold20(),),centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.lightGreyColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(cartItems[index]["image"]),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(cartItems[index]["name"],style: myTextStyleBold18(),),
                                  ImageIcon(const AssetImage("assets/icons/trash.png"),size: 20,color: AppColors.primaryColor,)
                                ],
                              ),
                              Text(cartItems[index]["category"],style: myTextStyle14(fontColor: AppColors.darkGreyColor),),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("₹",style: myTextStyleBold16(),),
                                      Text(cartItems[index]["amount"],style: myTextStyleBold16(),),
                                    ],
                                  ),
                                  Container(
                                    width: 80,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: AppColors.darkGreyColor),
                                      color: AppColors.lightGreyColor
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(Icons.remove,size: 14),
                                        Text("1",style: myTextStyleBold16(),),
                                        const Icon(Icons.add ,size: 14,)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            
              );
            },),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 100),
            child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightGreyColor
                            ),
                            child: Row(
                              children: [
                                TextField(
                                  cursorColor: AppColors.primaryColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },enableDrag: false, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
            },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity,50),
                  backgroundColor: AppColors.primaryColor ,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
              ), child: Text("Place Order",style: myTextStyleBold20(fontColor: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}