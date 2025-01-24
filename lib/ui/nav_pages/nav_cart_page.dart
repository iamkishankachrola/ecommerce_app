import 'package:ecommerce_app/domain/app_colors.dart';
import 'package:ecommerce_app/domain/ui_helper.dart';
import 'package:flutter/material.dart';

class NavCartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){},icon:  const Icon(Icons.arrow_back_ios_rounded,size: 20,),
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
              itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.lightGreyColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset("assets/images/noise_earbuds.png"),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Name",style: myTextStyleBold18(),),
                                  ImageIcon(const AssetImage("assets/icons/trash.png"),size: 20,color: AppColors.primaryColor,)
                                ],
                              ),
                              Text("Sub title",style: myTextStyle14(fontColor: AppColors.darkGreyColor),),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("₹",style: myTextStyleBold16(),),
                                      Text("200",style: myTextStyleBold16(),),
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
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
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
              ), child: Text("Place Order",style: myTextStyle18(fontColor: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}