import 'package:ecommerce_app/domain/utils/util_helper.dart';
import 'package:ecommerce_app/screens/bloc/get_order_bloc/get_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/get_order_bloc/get_order_event.dart';
import 'bloc/get_order_bloc/get_order_state.dart';

class MyOrder extends StatefulWidget{
  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  num price = 0;
  @override
  void initState() {
    super.initState();
    context.read<GetOrderBloc>().add(GetOrderInitialEvent());
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
        title: Text("My Order",style: myTextStyleBold20(),),centerTitle: true,
      ),
      body: BlocBuilder<GetOrderBloc,GetOrderState>(builder: (context, state) {
        if(state is GetOrderLoadingState){
          return  const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
        }else if(state is GetOrderErrorState){
          return Center(child: Text(state.errorMsg),);
        }else if(state is GetOrderLoadedState){
          return ListView.builder(
            itemCount: state.getOrderModel.orders![0].product!.length,
            itemBuilder: (context, index) {
              var getOrderData = state.getOrderModel.orders![0].product;
              price = int.parse(getOrderData![index].price!) * getOrderData[index].quantity!;
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
                          child: Image.network(getOrderData[index].image!),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getOrderData[index].name!,style: myTextStyleBold18(),),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Qty: ${getOrderData[index].quantity}")
                                    ],
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
        }else{
          return const SizedBox();
        }
      },),
    );
  }
}