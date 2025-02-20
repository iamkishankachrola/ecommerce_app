import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/utils/util_helper.dart';
import 'app_widgets/custom_card_widget.dart';
import 'app_widgets/custom_text_field_widget.dart';
import 'bloc/register_bloc/register_bloc.dart';
import 'bloc/register_bloc/register_event.dart';
import 'bloc/register_bloc/register_state.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new,size: 30,)),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:  MediaQuery.of(context).orientation == Orientation.landscape?
            Row(
              children: [
                Expanded(child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.22),
                    signUpText()
                  ],
               ) ) ,
                Expanded(child: ListView(children: [signUpForm()],
                ))
              ],
            ) :
        ListView(
          children: [
            signUpText(),
            signUpForm()
          ],
        )
      ),
    );
  }
  Widget signUpText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Create an account",style: myTextStyleBold24()),
            const SizedBox(width: 5,),
            Image.asset("assets/images/shooting_star.png",width: 24,height: 24,),
          ],
        ),
        const SizedBox(height: 5,),
        Text("Welcome! Please enter your details.",style: myTextStyle16(fontColor: Colors.grey)),
      ],
    );
  }
  Widget signUpForm(){
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediaQuery.of(context).orientation==Orientation.landscape?const SizedBox(height:0,):const SizedBox(height:20),
        CustomTextFieldWidget(hintText: "Enter your name", preFixIcon: const Icon(Icons.account_circle_outlined,color:Colors.grey),
          controller: nameController,keyboardType: TextInputType.name,lableText: "Name",),
        const SizedBox(height: 20,),
        CustomTextFieldWidget(hintText: "Enter your mobile no.", preFixIcon: const Icon(Icons.phone,color:Colors.grey),
          controller: phoneController,keyboardType: TextInputType.phone,lableText: "Mobile No.",),
        const SizedBox(height: 20,),
        CustomTextFieldWidget(hintText: "Enter your email", preFixIcon: const Icon(Icons.email_outlined,color: Colors.grey), controller: emailController,
          keyboardType: TextInputType.emailAddress ,lableText: "Email",),
        const SizedBox(height: 20,),
        CustomTextFieldWidget(hintText: "Enter your password", preFixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.grey),
          controller: passwordController, keyboardType:TextInputType.visiblePassword,obscureText: visibility?false:true,lableText: "Password",
          suffixIcon:IconButton(onPressed: (){
            setState(() {
              visibility = !visibility;
            });
          }, icon: visibility==true ? const Icon(Icons.visibility_outlined, color: Colors.grey,) : const Icon(Icons.visibility_off_outlined, color: Colors.grey,)  ),),
        const SizedBox(height: 50,),
        BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
              }else if (state is RegisterLoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.registerUserData["message"])));
                Navigator.pop(context);
              }},
            child: ElevatedButton(onPressed: (){
              context.read<RegisterBloc>().add(RegisterUserEvent(bodyParams: {
                "name" : nameController.text.toString(),
                "email" : emailController.text.toString(),
                "password" : passwordController.text.toString(),
                "mobile_number" : phoneController.text.toString()
              }));
            },
              style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.primaryColor,
                  elevation: 3,
                  shadowColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              child:Text("Sign Up",style: myTextStyleBold18(fontColor: Colors.white)),)
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/line.jpeg",width: 120,height: 1,fit: BoxFit.fill,color:const Color(0xff8D8E91),),
            Text("Or sign up with",style: myTextStyle12(fontColor: Colors.grey)),
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
        SizedBox(height:MediaQuery.of(context).orientation==Orientation.landscape ? height*0.34 :height * 0.15 ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Already have an account?",style: myTextStyle14(fontColor: Colors.grey)),
              const SizedBox(width: 5,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("Log in",style: myTextStyle14(fontColor: AppColors.primaryColor)),),
            ],
          ),
        )
      ],
    );
  }
}