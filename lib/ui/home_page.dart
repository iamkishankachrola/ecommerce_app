import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/domain/app_colors.dart';
import 'package:ecommerce_app/ui/nav_pages/nav_cart_page.dart';
import 'package:ecommerce_app/ui/nav_pages/nav_home_page.dart';
import 'package:ecommerce_app/ui/nav_pages/nav_like_page.dart';
import 'package:ecommerce_app/ui/nav_pages/nav_menue_page.dart';
import 'package:ecommerce_app/ui/nav_pages/nav_user_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 2;
  List<Widget> navPages = [
    NavMenuePage(),
    NavLikePage(),
    NavHomePage(),
    NavCartPage(),
    NavUserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.primaryColor,
        animationDuration: const Duration(microseconds: 300),
        items: [
            Icon(Icons.dashboard_customize_outlined,size: 26,color: selectedIndex==0?Colors.white:AppColors.darkGreyColor,),
            Icon(Icons.favorite_border_rounded,size: 26,color: selectedIndex==1?Colors.white:AppColors.darkGreyColor,),
            Icon(Icons.home_outlined,size: 26,color: selectedIndex==2?Colors.white:AppColors.darkGreyColor,),
            Icon(Icons.shopping_cart_outlined,size: 26,color: selectedIndex==3?Colors.white:AppColors.darkGreyColor,),
            Icon(Icons.person_outline_outlined,size: 26,color: selectedIndex==4?Colors.white:AppColors.darkGreyColor,),
        ],
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        index: selectedIndex,
      ),
    );
  }
}