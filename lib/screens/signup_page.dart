import 'package:ecommerce_app/app_widgets/custom_text_field_widget.dart';
import 'package:ecommerce_app/utils/util_helper.dart';
import 'package:flutter/material.dart';

import '../app_widgets/custom_card_widget.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.loginScreenBgColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70,),
            const Icon(Icons.arrow_back_ios_new,size: 30,),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text("Create an account",style: myTextStyleBold24()),
                const SizedBox(width: 5,),
                Image.asset("assets/images/three_star.jpg",width: 24,height: 24,)
              ],
            ),
            const SizedBox(height: 5,),
            Text("Welcome! Please enter your details.",style: myTextStyle16(fontColor: Colors.grey)),
            const SizedBox(height: 15,),
            Text("Name",style: myTextStyleBold14()),
            const SizedBox(height: 5,),
            CustomTextFieldWidget(hintText: "Enter your name", preFixIcon: const Icon(Icons.account_circle_outlined,color:Colors.grey),
                controller: nameController,keyboardType: TextInputType.name,),
            const SizedBox(height: 15,),
            Text("Email",style: myTextStyleBold14(),),
            const SizedBox(height: 5,),
            CustomTextFieldWidget(hintText: "Enter your email", preFixIcon: const Icon(Icons.email_outlined,color: Colors.grey), controller: emailController,
                keyboardType: TextInputType.emailAddress ,),
            const SizedBox(height: 15,),
            Text("Password",style: myTextStyleBold14()),
            const SizedBox(height: 5,),
            CustomTextFieldWidget(hintText: "Enter your password", preFixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.grey),
                controller: passwordController, keyboardType:TextInputType.visiblePassword,obscureText: visibility?false:true,
              suffixIcon:IconButton(onPressed: (){
                setState(() {
                  visibility = !visibility;
                });
              }, icon: visibility==true ? const Icon(Icons.visibility_outlined, color: Colors.grey,) : const Icon(Icons.visibility_off_outlined, color: Colors.grey,)  ),),
            Row(
              children: [
                Checkbox(value: true, onChanged:(value) {

                },activeColor: AppColors.primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),),
                Text("Must be at least 8 characters",style: myTextStyle14(fontColor: Colors.grey),)
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor:AppColors.primaryColor,
                    elevation: 3,
                    shadowColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child:Text("Sign Up",style: myTextStyleBold18(fontColor: Colors.white)),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/line.jpeg",width: 120,height: 1,fit: BoxFit.fill,color:const Color(0xff8D8E91),),
                Text("Or sign up with",style: myTextStyle12()),
                Image.asset("assets/images/line.jpeg",width: 120,height: 1,fit: BoxFit.fill,color:const Color(0xff8D8E91),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCardWidget(imageUrl:"assets/images/apple.png" ),
                const SizedBox(width: 15,),
                CustomCardWidget(imageUrl:"assets/images/google.png"),
                const SizedBox(width: 15,),
                CustomCardWidget(imageUrl:"assets/images/facebook.png"),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Already have an account?",style: myTextStyle14()),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                        child: Text("Log in",style: myTextStyle14(fontColor: AppColors.primaryColor)),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}