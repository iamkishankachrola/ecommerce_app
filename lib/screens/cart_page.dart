import 'package:ecommerce_app/screens/bloc/create_order_bloc/create_order_bloc.dart';
import 'package:ecommerce_app/screens/bloc/create_order_bloc/create_order_event.dart';
import 'package:ecommerce_app/screens/bloc/create_order_bloc/create_order_state.dart';
import 'package:ecommerce_app/screens/bloc/decrement_quantity_bloc/decrement_count_bloc.dart';
import 'package:ecommerce_app/screens/bloc/decrement_quantity_bloc/decrement_count_event.dart';
import 'package:ecommerce_app/screens/bloc/decrement_quantity_bloc/decrement_count_state.dart';
import 'package:ecommerce_app/screens/bloc/view_cart_bloc/view_cart_state.dart';
import 'package:ecommerce_app/screens/nav_pages/nav_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../domain/utils/util_helper.dart';
import 'bloc/view_cart_bloc/view_cart_bloc.dart';
import 'bloc/view_cart_bloc/view_cart_event.dart';
class CartPage extends StatefulWidget{
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with SingleTickerProviderStateMixin{
  TextEditingController discountController = TextEditingController();
  bool isLoading = false;
  num price = 0;
  num totalPrice = 0;
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    context.read<ViewCartBloc>().add(ViewCartEvent());
    animationController = AnimationController(vsync: this);
    animationController!.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavHomePage(),));
        animationController!.reset();
      }
    },);
  }
  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }
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
      body: MediaQuery.of(context).orientation == Orientation.portrait ?
          Column(
            children: [
              Expanded(child: cartPage()),
              const SizedBox(height: 20,),
              placeOrder()
            ],
          ) :
          Row(
            children: [
              Expanded(child: cartPage()),
              const SizedBox(width: 20,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  placeOrder(),
                ],
              ))
            ],
          )
    );
  }
  Widget cartPage(){
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<ViewCartBloc, ViewCartState>(
        builder: (context, state) {
          if(state is ViewCartLoadingState){
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
          }else if(state is ViewCartErrorState){
            return Center(child: Text(state.errorMsg),);
          }else if(state is ViewCartEmptyState){
            return MediaQuery.of(context).orientation == Orientation.portrait ?
                emptyCart() : ListView(children: [emptyCart()],);
          }
          else if(state is ViewCartLoadedState){
            var viewCartData = state.viewCartList.data!;
            return ListView.builder(
              itemCount: state.viewCartList.data!.length,
              itemBuilder: (context, index) {
                price = int.parse(viewCartData[index].price!) * viewCartData[index].quantity!;
                totalPrice += price;
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
                            child: Image.network(viewCartData[index].image!),
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
                                    Text(viewCartData[index].name!,style: myTextStyleBold18(),),
                                    const ImageIcon(AssetImage("assets/icons/trash.png"),size: 20,color: AppColors.primaryColor,)
                                  ],
                                ),
                                Text("Electronics",style: myTextStyle14(fontColor: AppColors.darkGreyColor),),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("₹",style: myTextStyleBold16(),),
                                        Text("$price",style: myTextStyleBold16(),),
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
                                          BlocListener<DecrementCountBloc,DecrementCountState>(
                                            listener: (context, state) {
                                              if(state is DecrementCountErrorState){
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                                              }else if(state is DecrementCountLoadedState){
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.decrementCountData["message"])));
                                              }
                                            },
                                            child: InkWell(
                                                onTap: (){
                                                  context.read<DecrementCountBloc>().add(DecrementCountEvent(bodyParams: {
                                                    "product_id": viewCartData[index].id,
                                                    "quantity": viewCartData[index].quantity
                                                  }));
                                                },
                                                child: const Icon(Icons.remove,size: 14)),
                                          ),
                                          Text(viewCartData[index].quantity.toString(),style: myTextStyleBold16(),),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  viewCartData[index].quantity!+1;
                                                });
                                              },
                                              child: const Icon(Icons.add ,size: 14,))
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
              },);
          }
          else{
            return const SizedBox();
          }
        },
      ),
    );
  }
  Widget placeOrder(){
    return Padding(
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
                          Text("₹$totalPrice",style: myTextStyleBold20(),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(color: AppColors.lightGreyColor,height:3,),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: myTextStyle18(),),
                          Text("₹$totalPrice",style: myTextStyleBold20(),)
                        ],),
                      const SizedBox(height: 40,),
                      BlocListener<CreateOrderBloc,CreateOrderState>(
                        listener: (context, state) {
                          if(state is CreateOrderLoadingState){
                            isLoading = true;
                            setState(() {});
                          }else if(state is CreateOrderErrorState){
                            isLoading = false;
                            setState(() {});
                            showDialog(context: context, builder: (context) {
                              return Dialog(
                                child: SizedBox(
                                  width: 290,
                                  height: 290,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset("assets/animations/order_failed.json",height: 200,width: 200,repeat: false, controller: animationController,
                                        onLoaded: (composition) {
                                          animationController!.duration = const Duration(seconds: 3);
                                          animationController!.forward();
                                        },),
                                      const SizedBox(height: 20,),
                                      Text("${state.errorMsg}!!",style: myTextStyleBold14(),),
                                      const SizedBox(height: 20,)
                                    ],
                                  ),
                                ),
                              );
                            },);
                          }else if(state is CreateOrderLoadedState){
                            isLoading = false;
                            setState(() {});
                            showDialog(context: context, builder: (context) {
                              return Dialog(
                                child: SizedBox(
                                  width: 270,
                                  height: 270,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset("assets/animations/order_created.json",height: 200,width: 200,repeat: false, controller: animationController,
                                      onLoaded: (composition) {
                                        animationController!.duration = composition.duration;
                                        animationController!.forward();
                                      },),
                                      const SizedBox(height: 20,),
                                      Text("${state.orderData["message"]}!!",style: myTextStyleBold18(),),
                                      const SizedBox(height: 20,)
                                    ],
                                  ),
                                ),
                              );
                            },);
                          }
                        },
                        child: ElevatedButton(onPressed: () {
                          context.read<CreateOrderBloc>().add(CreateOrderEvent());
                        }, style:  ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity,50),
                            backgroundColor: AppColors.primaryColor ,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                        ), child: isLoading ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Placing Order...",style: myTextStyleBold18(fontColor: Colors.white),),
                            const SizedBox(width: 15,),
                            const SizedBox(width:20,height:20,child: CircularProgressIndicator(color: Colors.white,)),
                          ],
                        ):Text("Checkout",style: myTextStyleBold18(fontColor: Colors.white),),),
                      )
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
        ), child: Text("Place Order",style: myTextStyleBold18(fontColor: Colors.white),),
      ),
    );
  }

  Widget emptyCart(){
    return Column(
      children: [
        MediaQuery.of(context).orientation == Orientation.portrait ? Lottie.asset("assets/animations/empty_cart.json",) : Lottie.asset("assets/animations/empty_cart.json",height: MediaQuery.of(context).size.height*0.51),
        const SizedBox(height: 15,),
        Text("Your cart is empty",style: myTextStyleBold20(),),
        const SizedBox(height: 15,),
        Text("Looks like you haven't added",style: myTextStyle14(fontColor: Colors.grey),),
        Text("anything to your cart yet",style: myTextStyle14(fontColor: Colors.grey),),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavHomePage(),));
          }, style:ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity,50),
              backgroundColor: AppColors.primaryColor ,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
          ), child: Text("Shop Now",style: myTextStyleBold20(fontColor: Colors.white),)),
        ),
        MediaQuery.of(context).orientation == Orientation.portrait ? const SizedBox(height: 0,) : const SizedBox(height: 30,),
      ],
    );
  }

}