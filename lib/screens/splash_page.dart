import 'dart:async';
import 'package:ecommerce_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async{
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      print("USER TOKEN IS: $token");
      if(token != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/add_cart.gif")
      ),
    );
  }
}