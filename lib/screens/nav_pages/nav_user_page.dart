import 'package:ecommerce_app/screens/login_page.dart';
import 'package:ecommerce_app/screens/my_order_page.dart';
import 'package:ecommerce_app/screens/nav_pages/nav_home_page.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/utils/util_helper.dart';

class NavUserPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NavHomePage(),));
            },icon:  const Icon(Icons.arrow_back_ios_rounded,size: 20,),
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),),
          ],
        ),
        title: Text("My Profile",style: myTextStyleBold20(),),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(width: 10,),
                Text("Settings",style: myTextStyle16(),),
              ],
            ),
            const SizedBox(height: 15,),
            const Divider(height: 2,),
            const SizedBox(height: 15,),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MyOrder(),));
              },
              child: Row(
                children: [
                  const Icon(Icons.shopping_cart),
                  const SizedBox(width: 10,),
                  Text("My Order",style: myTextStyle16(),),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Divider(height: 2,),
            const SizedBox(height: 15,),
            InkWell(
              onTap: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: "Do you want to logout?",
                  confirmBtnText: "Yes",
                  cancelBtnText: "No",
                  confirmBtnColor: Colors.red,
                  cancelBtnTextStyle: myTextStyleBold14(fontColor: Colors.green),
                  confirmBtnTextStyle: myTextStyleBold14(fontColor: Colors.white),
                  onConfirmBtnTap: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                  onCancelBtnTap: () {
                    Navigator.pop(context);
                  },
                );

              },
              child: Row(
                children: [
                  const Icon(Icons.logout_rounded),
                  const SizedBox(width: 10,),
                  Text("Log out",style: myTextStyle16(),),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Divider(height: 2,),
          ],),
      ),
    );
  }
}