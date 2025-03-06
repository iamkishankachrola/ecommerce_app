import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/data/local/model/products_model.dart';
import 'package:ecommerce_app/screens/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:ecommerce_app/screens/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:ecommerce_app/screens/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:ecommerce_app/screens/cart_page.dart';
import 'package:ecommerce_app/screens/tab_pages/description_page.dart';
import 'package:ecommerce_app/screens/tab_pages/reviews_page.dart';
import 'package:ecommerce_app/screens/tab_pages/specification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../domain/utils/util_helper.dart';
import 'app_widgets/custom_container.dart';

class AboutProductPage extends StatefulWidget{
  List<String> imageList;
  DataModel productsList;
  String sellerName;
  AboutProductPage({required this.imageList,required this.productsList,required this.sellerName});
  @override
  State<AboutProductPage> createState() => _AboutProductPageState();
}

class _AboutProductPageState extends State<AboutProductPage> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int quantity = 1;
  bool isLoading = false;
  int? id;
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    animationController!.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartPage(),));
        animationController!.reset();
      }
    });
  }
  @override
  void dispose() {
        super.dispose();
        animationController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
     id = int.parse(widget.productsList.id!);
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
      body: MediaQuery.of(context).orientation == Orientation.portrait ?
        Stack(
             children: [
               ListView(
                 children: [
                   productDetails(),
                   productDescription(),
                 ],
               ),
               addToCart()
             ],
           ) :
        Stack(
          children: [
            Row(
              children: [
                Expanded(child: ListView(children: [productDetails()],),),
                const SizedBox(width: 20,),
                Expanded(child: Stack(children: [
                  ListView(children: [productDescription()],),
                  addToCart()
                ])),
              ],
            ),

          ],
        )
    );
  }
  Widget productDetails(){
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).orientation == Orientation.portrait ? height * 0.29 : height * 0.78,
      color: AppColors.lightGreyColor,
      child: Stack(
          alignment: Alignment.bottomCenter,
          children:[
            CarouselSlider.builder(itemCount: widget.imageList.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30), child: Image.asset(widget.imageList[index],),
                  );
                }, options:CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    widget.imageList.asMap().entries.map((entry) {
                      return currentIndex == entry.key ? Container(
                        width: 17,
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
              ),)
          ]
      ),
    );
  }
  Widget productDescription(){
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).orientation == Orientation.portrait ? height * 0.71 : height * 1.40,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.productsList.name!,style: myTextStyleBold24(),),
            Text("₹${widget.productsList.price}",style: myTextStyleBold20(),),
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
                Text("Seller: ${widget.sellerName}",style: myTextStyleBold18(),)

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
                  CustomContainer(color: AppColors.darkRed, width: 30, height: 30,),
                  Stack(
                      alignment: Alignment.center,
                      children:[
                        CustomContainer(color: Colors.transparent, width: 38, height: 38, border: Border.all(color: Colors.black)),
                        CustomContainer(color:Colors.black, width: 30, height: 30,),
                      ]),
                  CustomContainer(color: AppColors.blueColor, width: 30, height: 30),
                  CustomContainer(color: AppColors.darkBrown, width: 30, height: 30),
                  CustomContainer(color:  AppColors.lightGreyColor, width: 30, height: 30),
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
    );
  }
  Widget addToCart(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
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
                      InkWell(onTap: (){
                        setState(() {
                          if(quantity>1){
                            quantity--;
                          }
                        });
                      },child: const Icon(Icons.remove,size: 18,color: Colors.white,)),
                      Text(quantity.toString(),style: myTextStyleBold18(fontColor: Colors.white),),
                      InkWell(onTap:(){
                        setState(() {
                          quantity++;
                        });
                      },child: const Icon(Icons.add ,size: 18,color: Colors.white,))
                    ],
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: BlocListener<CartBloc,CartState>(
                    listener: (context, state) {
                      if(state is CartLoadingState){
                        isLoading = true;
                        setState(() {});
                      } else if(state is CartErrorState){
                        isLoading = false;
                        setState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                      }else if(state is CartLoadedState) {
                        isLoading = false;
                        setState(() {});
                        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.productStatus["message"])));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: SizedBox(
                                width: 270,
                                height: 270,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset("assets/animations/add_to_cart.json",width: 200,height: 200,repeat:false,controller: animationController,
                                      onLoaded: (composition) {
                                        animationController!.duration = composition.duration;
                                        animationController!.forward();
                                      },
                                    ),
                                    const SizedBox(height: 20,),
                                    Text("${state.productStatus["message"]}!!",style: myTextStyleBold20(),),
                                    const SizedBox(height: 20,),
                                  ]
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: ElevatedButton(onPressed: (){
                      context.read<CartBloc>().add(AddToCartEvent(bodyParams: {
                        "product_id" : id,
                        "quantity" : quantity,
                      }));
                    },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity,50),
                            backgroundColor: AppColors.primaryColor ,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                        ), child: isLoading ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Adding to Cart...",style: myTextStyleBold16(fontColor: Colors.white)),
                            const SizedBox(width: 6,),
                            const SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(color: Colors.white,))
                          ],
                        ) : Text("Add to Cart",style: myTextStyleBold18(fontColor: Colors.white),)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}