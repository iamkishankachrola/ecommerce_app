import 'package:ecommerce_app/screens/bloc/login_bloc/login_bloc.dart';
import 'package:ecommerce_app/screens/bloc/login_bloc/login_state.dart';
import 'package:ecommerce_app/screens/home_page.dart';
import 'package:ecommerce_app/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/utils/util_helper.dart';
import 'app_widgets/custom_card_widget.dart';
import 'app_widgets/custom_text_field_widget.dart';
import 'bloc/login_bloc/login_event.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibility = false;
  String token = " ";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new,size: 30,)),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MediaQuery.of(context).orientation==Orientation.landscape ?
          Row(
            children: [
              Expanded(child: Column(
                children: [
                  SizedBox(height: height*0.22),
                  logInText()
                ],
              )),
              Expanded(child: ListView(children:[logInForm()] ))
            ],
          ) :
          ListView(
            children: [
              logInText(),
              logInForm()
            ],
          )
      ),
    );
  }
  Widget logInText(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children: [
               Text("Log in",style: myTextStyleBold24()),
                const SizedBox(width: 5,),
                Image.asset("assets/images/shooting_star.png",width: 24,height: 24,)
          ],
        ),
          const SizedBox(height: 5,),
          Text("Welcome back! Please enter your details.",style: myTextStyle16(fontColor: Colors.grey)),
      ] );
  }
  Widget logInForm(){
    double height = MediaQuery.of(context).size.height;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          MediaQuery.of(context).orientation==Orientation.landscape?const SizedBox(height:0,):const SizedBox(height:20),
          CustomTextFieldWidget(controller: emailController,hintText: "Enter your email",keyboardType: TextInputType.emailAddress ,preFixIcon: const Icon(Icons.email_outlined,color: Colors.grey,),lableText: "Email",),
          const SizedBox(height: 20,),
          CustomTextFieldWidget(controller: passwordController,hintText: "Enter your password", keyboardType:TextInputType.visiblePassword,obscureText: visibility?false:true,preFixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.grey,),lableText: "Password",
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
                      Checkbox(value: true, onChanged:(value) {},activeColor: AppColors.primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),),
                      Text("Remember for 30 days",style: myTextStyle14(fontColor: Colors.grey)),
                   ],
                ),
                InkWell(child: Text("Forgot password",style:myTextStyle14(fontColor: AppColors.primaryColor))),
             ],
           ),
          const SizedBox(height: 20,),
           BlocListener<LoginBloc,LoginState>(
             listener: (context, state) {
               if(state is LoginErrorState){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
               }else if(state is LoginLoadedState){
                 token = state.loginUserData["tokan"];
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.loginUserData["message"])));
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
               }},
                child : ElevatedButton(onPressed: () async{
                      context.read<LoginBloc>().add(LoginUserEvent(bodyParams: {
                          "email" : emailController.text,
                          "password" : passwordController.text
                      }));
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("token", token);
                  }, style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.primaryColor, elevation: 3,
                    shadowColor: Colors.black,
                   minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                         child: Text("Log In",style: myTextStyleBold18(fontColor: Colors.white)),)
           ),
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
        SizedBox(height:MediaQuery.of(context).orientation==Orientation.landscape ? height * 0.34 : height * 0.30),
        Padding(
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
                     }, child: Text("Sign up",style: myTextStyle14(fontColor: AppColors.primaryColor))),
               ],
            ),
         )
      ]
    );
  }
}
