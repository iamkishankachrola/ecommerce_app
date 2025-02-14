import 'package:ecommerce_app/constants/app_constant.dart';
import 'package:flutter/material.dart';
import '../utils/util_helper.dart';

class CartPage extends StatelessWidget{
  TextEditingController discountController = TextEditingController();
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
              itemCount: AppConstant.cartItems.length,
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
                            child: Image.asset(AppConstant.cartItems[index]["image"]),
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
                                    Text(AppConstant.cartItems[index]["name"],style: myTextStyleBold18(),),
                                    const ImageIcon(AssetImage("assets/icons/trash.png"),size: 20,color: AppColors.primaryColor,)
                                  ],
                                ),
                                Text(AppConstant.cartItems[index]["category"],style: myTextStyle14(fontColor: AppColors.darkGreyColor),),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("₹",style: myTextStyleBold16(),),
                                        Text(AppConstant.cartItems[index]["amount"],style: myTextStyleBold16(),),
                                      ],
                                    ),
                                    Container(
                                      width: 80,
                                      height: 28,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
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
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
            child: ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.lightGreyColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height:50,
                                      child: TextField(
                                        controller: discountController,
                                        keyboardType: TextInputType.number,
                                        style: myTextStyle16(fontColor: AppColors.darkGreyColor),
                                        cursorColor: AppColors.primaryColor,
                                        decoration: InputDecoration(
                                          enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.lightGreyColor,
                                              width: 1
                                            )
                                          ),
                                          focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.lightGreyColor,
                                              width: 1
                                            )
                                          ),
                                          hintText: "Enter Discount Code",
                                          hintStyle: myTextStyle16(fontColor: AppColors.darkGreyColor),
                                        ),

                                      ),
                                    ),
                                  ),
                                  Text("Apply",style: myTextStyleBold20(fontColor: AppColors.primaryColor),)
                                ],
                              ),
                            )),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal",style: myTextStyle18(fontColor: AppColors.darkGreyColor),),
                              Text("₹245.00",style: myTextStyleBold20(),)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Divider(color: AppColors.lightGreyColor,height:3,),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",style: myTextStyle18(),),
                              Text("₹245.00",style: myTextStyleBold20(),)
                        ],),
                          const SizedBox(height: 40,),
                          ElevatedButton(onPressed: () {

                          }, style:  ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity,50),
                              backgroundColor: AppColors.primaryColor ,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                          ), child: Text("Checkout",style: myTextStyleBold20(fontColor: Colors.white),),)
                        ]
                      ),
                    ),
                  ),
                );
              },enableDrag: false,isScrollControlled: true, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))));
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