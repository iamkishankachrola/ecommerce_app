import 'package:ecommerce_app/app_widgets/custom_card_widget.dart';
import 'package:ecommerce_app/app_widgets/custom_text_field_widget.dart';
import 'package:ecommerce_app/screens/home_page.dart';
import 'package:ecommerce_app/screens/signup_page.dart';
import 'package:flutter/material.dart';
import '../utils/util_helper.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                Text("Log in",style: myTextStyleBold24()),
                const SizedBox(width: 5,),
                Image.asset("assets/images/three_star.jpg",width: 24,height: 24,)
              ],
            ),
            const SizedBox(height: 5,),
            Text("Welcome back! Please enter your details.",style: myTextStyle16(fontColor: Colors.grey)),
            const SizedBox(height: 15,),
            Text("Email",style: myTextStyleBold14()),
            const SizedBox(height: 5,),
            CustomTextFieldWidget(controller: emailController,hintText: "Enter your email",keyboardType: TextInputType.emailAddress ,preFixIcon: const Icon(Icons.email_outlined,color: Colors.grey,),),
            const SizedBox(height: 15,),
            Text("Password",style: myTextStyleBold14(),),
            const SizedBox(height: 5,),
            CustomTextFieldWidget(controller: passwordController,hintText: "Enter your password", keyboardType:TextInputType.visiblePassword,obscureText: visibility?false:true,preFixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.grey,),
              suffixIcon:IconButton(onPressed: (){
                setState(() {
                  visibility = !visibility;
                });
              }, icon: visibility==true ? const Icon(Icons.visibility_outlined, color: Colors.grey,) : const Icon(Icons.visibility_off_outlined, color: Colors.grey,)  ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged:(value) {

                    },activeColor: AppColors.primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),),
                    Text("Remember for 30 days",style: myTextStyle14(fontColor: Colors.grey)),
                  ],
                ),
                InkWell(child: Text("Forgot password",style:myTextStyle14(fontColor: AppColors.primaryColor))),
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 3,
                    shadowColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child: Text("Log In",style: myTextStyleBold18(fontColor: Colors.white)),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/line.jpeg",width: 130,height: 1,fit: BoxFit.fill,color:const Color(0xff8D8E91),),
                Text("Or log in with",style:myTextStyle12(fontColor: Colors.grey)),
                Image.asset("assets/images/line.jpeg",width: 130,height: 1,fit: BoxFit.fill,color:const Color(0xff8D8E91),),
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
                    Text("Don't have an account?",style: myTextStyle14(fontColor: Colors.grey)),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpPage(),));
                      },
                        child: Text("Sign up",style: myTextStyle14(fontColor: AppColors.primaryColor))),
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
