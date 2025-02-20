import 'package:ecommerce_app/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/utils/util_helper.dart';

class NavUserPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(onPressed: () {
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
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity,50),
                  backgroundColor: AppColors.primaryColor ,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                    child: Text("Log out",style: myTextStyleBold20(fontColor: Colors.white),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}