import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/homepage.dart';

import 'colorpage.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final passwordValidation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey=GlobalKey<FormState>();
  bool selectIcon= false;
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: height*1,
                width: width*1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          ColorPage.secondarycolor,
                          ColorPage.primarycolor,
                        ],
                        stops: [0.5,0.5],
                          begin: Alignment.bottomLeft,
                        end: Alignment.topRight
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: height*0.9,
                          width: width*0.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradientPainter(
                              colors: [
                                ColorPage.fourthcolor,
                                ColorPage.fifthcolor
                              ],
                              begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                            ),
                            borderRadius: BorderRadius.circular(width*0.02),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: height*0.9,
                                width: width*0.45,
                                decoration: BoxDecoration(
                                  gradient: LinearGradientPainter(
                                    colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(width*0.02,)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(width*0.02),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Anytime, Anywhere,  \n"
                                              "On Any Device",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w900,
                                                fontSize: width*0.02,
                                                color: ColorPage.secondarycolor,
                                                shadows: [
                                                  BoxShadow(
                                                      color:
                                                      ColorPage.thirdcolor.withOpacity(0.42),
                                                      blurRadius: width * 0.03,
                                                      // spreadRadius: width * 0.01,
                                                      offset: Offset(0, 4))
                                                ]
                                            ),),
                                        ],
                                      ),
                                      SizedBox(height: height*0.05,),
                                     Row(
                                       children: [
                                         Container(
                                             height: height*0.08,
                                             width: width*0.03,
                                             child: Icon(CupertinoIcons.info,color: ColorPage.secondarycolor,)),
                                         Text("Expert advice from top doctors",
                                           style: GoogleFonts.ibarraRealNova(
                                             fontSize: width*0.014,
                                             fontWeight: FontWeight.w600,
                                             color: ColorPage.secondarycolor,
                                           ),),
                                       ],
                                     ),
                                     SizedBox(height: height*0.01,),
                                     Row(
                                       children: [
                                         Container(
                                             height: height*0.08,
                                             width: width*0.03,
                                             child: Icon(CupertinoIcons.hourglass,color: ColorPage.secondarycolor)),
                                         Text("Available 24hrs on any device",
                                           style: GoogleFonts.ibarraRealNova(
                                             fontSize: width*0.014,
                                             fontWeight: FontWeight.w600,
                                             color: ColorPage.secondarycolor,
                                           ),),
                                       ],
                                     ),
                                     SizedBox(height: height*0.01,),
                                     Row(
                                       children: [
                                         Container(
                                             height: height*0.08,
                                             width: width*0.03,
                                             child: Icon(CupertinoIcons.chat_bubble_text,color: ColorPage.secondarycolor)),
                                         Text("Private question answered within 24hrs",
                                           style: GoogleFonts.ibarraRealNova(
                                             fontSize: width*0.014,
                                             fontWeight: FontWeight.w600,
                                             color: ColorPage.secondarycolor,
                                           ),),
                                       ],
                                     ),
                                     SizedBox(height: height*0.015,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: height*0.9,
                                width: width*0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(width*0.02,)),
                                  gradient: LinearGradientPainter(
                                    colors: <Color>[ColorPage.fourthcolor, ColorPage.fourthcolor],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(width*0.009),
                                            height: height*0.045,
                                            width: width*0.05,
                                            child: SvgPicture.asset(ImageIcons.vector1))
                                      ],
                                    )
                                  ],
                                ),
                                  ),
                                ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:width*0.3,top: height*0.06),
                          // height: height*0.79,
                          width: width*0.3,
                          decoration: BoxDecoration(
                            color: ColorPage.secondarycolor,
                            borderRadius: BorderRadius.all(Radius.circular(width*0.02,)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(width*0.02),
                            child: Column(
                              children: [
                                Text("Hello!",style: GoogleFonts.aboreto(
                                  fontSize: width*0.02,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPage.primarycolor,
                                ),),
                                SizedBox(height: height*0.015,),
                                Container(
                                  margin: EdgeInsets.only(left: width*0.019),
                                  child: Text("Login with your data that you entered during Your Registration.",
                                    style: GoogleFonts.aboreto(
                                    fontSize: width*0.007,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.primarycolor,
                                  ),),
                                ),
                                SizedBox(height: height*0.07,),
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        toggle=!toggle;
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                        height: height*0.05,
                                        width: width*0.23,
                                        decoration: BoxDecoration(
                                          color: ColorPage.color3,
                                          border: Border.all(
                                              color: ColorPage.primarycolor,
                                          ),
                                          borderRadius: BorderRadius.circular(width*0.01),
                                        ),
                                      ),
                                    ),
                                    AnimatedPositioned(
                                      duration: Duration(
                                        milliseconds: 200
                                      ),
                                      left:toggle? width*0.1:width*0.001,
                                      right:toggle?width*0.001: width*0.1,
                                      curve: Curves.easeIn,
                                        child: AnimatedContainer(
                                          curve: Curves.easeIn,
                                          duration:  Duration(
                                              milliseconds: 200
                                          ),
                                          height: height*0.05,
                                          width: width*0.12,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(width*0.009),
                                            color: ColorPage.fourthcolor,
                                            border: Border.all(
                                                color: ColorPage.color2,
                                            ),
                                          ),
                                          child: toggle?Center(
                                            child: Text("Register",style: TextStyle(
                                              fontSize: width*0.012,
                                              fontWeight: FontWeight.w500,
                                              color: ColorPage.primarycolor,
                                            ),),
                                          ):Center(
                                            child: Text("Login",style: TextStyle(
                                              fontSize: width*0.012,
                                              fontWeight: FontWeight.w500,
                                              color: ColorPage.primarycolor,
                                            ),),
                                          ),
                                        ),
                                        ),
                                    AnimatedPositioned(
                                      duration: Duration(
                                          milliseconds: 200),
                                      left: toggle?width*0.004:width*0.12,
                                      right: toggle?width*0.13:width*0.004,
                                      top: width*0.003,
                                        child: toggle?Center(
                                          child: Text("Login",style: TextStyle(
                                            fontSize: width*0.012,
                                            fontWeight: FontWeight.w500,
                                            color: ColorPage.color1,
                                          ),),
                                        ):Center(
                                          child: Text("Register",style: TextStyle(
                                            fontSize: width*0.012,
                                            fontWeight: FontWeight.w500,
                                            color: ColorPage.color1,
                                          ),),
                                        ),)
                                  ],
                                ),
                                SizedBox(height: height*0.05,),
                               toggle?Column(
                                 children: [
                                   Container(
                                     width: width*0.23,
                                     decoration: BoxDecoration(
                                       color: ColorPage.color3,
                                       borderRadius: BorderRadius.circular(width*0.01),
                                     ),
                                     child: TextFormField(
                                       controller: nameController,
                                       textInputAction: TextInputAction.next,
                                       keyboardType: TextInputType.text,
                                       style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                       decoration: InputDecoration(
                                         prefixIcon: Padding(
                                           padding: EdgeInsets.all(width*0.005),
                                           child: SvgPicture.asset(ImageIcons.user),
                                         ),
                                         labelText: "Enter your name",
                                         labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                         border: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: ColorPage.primarycolor,
                                             ),
                                             borderRadius: BorderRadius.circular(width*0.01)
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: height*0.03,),
                                   Container(
                                     width: width*0.23,
                                     decoration: BoxDecoration(
                                       color: ColorPage.color3,
                                       borderRadius: BorderRadius.circular(width*0.01),
                                     ),
                                     child: TextFormField(
                                       controller: emailController,
                                       textInputAction: TextInputAction.next,
                                       keyboardType: TextInputType.emailAddress,
                                       autovalidateMode: AutovalidateMode.onUserInteraction,
                                       validator: (value) {
                                         if(!emailValidation.hasMatch(value!)){
                                           return "Enter valid Email";
                                         }
                                         else{
                                           return null;
                                         }
                                       },
                                       style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                       decoration: InputDecoration(
                                         prefixIcon: Padding(
                                           padding: EdgeInsets.all(width*0.005),
                                           child: SvgPicture.asset(ImageIcons.email),
                                         ),
                                         labelText: "Enter your email",
                                         labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                         border: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: ColorPage.primarycolor,
                                             ),
                                             borderRadius: BorderRadius.circular(width*0.01)
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: height*0.03),
                                   Container(
                                     width: width*0.23,
                                     decoration: BoxDecoration(
                                       color: ColorPage.color3,
                                       borderRadius: BorderRadius.circular(width*0.01),
                                     ),
                                     child: TextFormField(
                                       controller: passwordController,
                                       textInputAction: TextInputAction.done,
                                       keyboardType: TextInputType.text,
                                       obscureText: selectIcon?false:true,
                                       autovalidateMode: AutovalidateMode.onUserInteraction,
                                       validator: (value) {
                                         if(!passwordValidation.hasMatch(value!)){
                                           return "*The password you entered is wrong";
                                         }
                                         else{
                                           return null;
                                         }
                                       },
                                       style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                       decoration: InputDecoration(
                                         prefixIcon: Padding(
                                           padding: EdgeInsets.all(width*0.005),
                                           child: SvgPicture.asset(ImageIcons.password),
                                         ),
                                         suffixIcon: InkWell(
                                           onTap: () {
                                             selectIcon=!selectIcon;
                                             setState(() {

                                             });
                                           },
                                           child: Padding(
                                             padding: EdgeInsets.all(width*0.005),
                                             child: Container(
                                                 height: width*0.015,
                                                 width: width*0.015,
                                                 child: selectIcon?SvgPicture.asset(ImageIcons.eye,color:ColorPage.primarycolor):
                                                 SvgPicture.asset(ImageIcons.eyeoff)),
                                           ),
                                         ),
                                         labelText: "Enter your password",
                                         labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                         border: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: ColorPage.primarycolor,
                                             ),
                                             borderRadius: BorderRadius.circular(width*0.01)
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: height*0.05,),
                                   InkWell(
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                     },
                                     child: Container(
                                       height: height*0.07,
                                       width: width*0.23,
                                       decoration: BoxDecoration(
                                         gradient: LinearGradientPainter(
                                           colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                                         ),
                                         color: ColorPage.primarycolor,
                                         borderRadius: BorderRadius.circular(width*0.01),
                                       ),
                                       child: Center(
                                         child: Text("Login",style: GoogleFonts.aboreto(
                                           fontSize: width*0.015,
                                           fontWeight: FontWeight.w600,
                                           color: ColorPage.secondarycolor,
                                         ),),
                                       ),
                                     ),
                                   )
                                 ],
                               ):Column(
                                 children: [
                                   Container(
                                     width: width*0.23,
                                     decoration: BoxDecoration(
                                       color: ColorPage.color3,
                                       borderRadius: BorderRadius.circular(width*0.01),
                                     ),
                                     child: TextFormField(
                                       controller: emailController,
                                       textInputAction: TextInputAction.next,
                                       keyboardType: TextInputType.emailAddress,
                                       autovalidateMode: AutovalidateMode.onUserInteraction,
                                       validator: (value) {
                                         if(!emailValidation.hasMatch(value!)){
                                           return "Enter valid Email";
                                         }
                                         else{
                                           return null;
                                         }
                                       },
                                       style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                       decoration: InputDecoration(
                                         prefixIcon: Padding(
                                           padding: EdgeInsets.all(width*0.005),
                                           child: SvgPicture.asset(ImageIcons.email),
                                         ),
                                         labelText: "Enter your email",
                                         labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                         border: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: ColorPage.primarycolor,
                                             ),
                                             borderRadius: BorderRadius.circular(width*0.01)
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: height*0.03,),
                                   Container(
                                     width: width*0.23,
                                     decoration: BoxDecoration(
                                       color: ColorPage.color3,
                                       borderRadius: BorderRadius.circular(width*0.01),
                                     ),
                                     child: TextFormField(
                                       controller: passwordController,
                                       textInputAction: TextInputAction.done,
                                       keyboardType: TextInputType.text,
                                       obscureText: selectIcon?false:true,
                                       autovalidateMode: AutovalidateMode.onUserInteraction,
                                       validator: (value) {
                                         if(!passwordValidation.hasMatch(value!)){
                                           return "*The password you entered is wrong";
                                         }
                                         else{
                                           return null;
                                         }
                                       },
                                       style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                       decoration: InputDecoration(
                                         prefixIcon: Padding(
                                           padding: EdgeInsets.all(width*0.005),
                                           child: SvgPicture.asset(ImageIcons.password),
                                         ),
                                         suffixIcon: InkWell(
                                           onTap: () {
                                             selectIcon=!selectIcon;
                                             setState(() {

                                             });
                                           },
                                           child: Padding(
                                             padding: EdgeInsets.all(width*0.005),
                                             child: Container(
                                                 height: width*0.01,
                                                 width: width*0.01,
                                                 child: selectIcon?SvgPicture.asset(ImageIcons.eye,color:ColorPage.primarycolor):
                                                 SvgPicture.asset(ImageIcons.eyeoff)),
                                           ),
                                         ),
                                         labelText: "Enter your password",
                                         labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                         border: OutlineInputBorder(
                                             borderSide: BorderSide(
                                               color: ColorPage.primarycolor,
                                             ),
                                             borderRadius: BorderRadius.circular(width*0.01)
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: height*0.13,),
                                   InkWell(
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                     },
                                     child: Container(
                                       height: height*0.07,
                                       width: width*0.23,
                                       decoration: BoxDecoration(
                                         gradient: LinearGradientPainter(
                                                     colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                                                   ),
                                         color: ColorPage.primarycolor,
                                         borderRadius: BorderRadius.circular(width*0.01),
                                       ),
                                       child: Center(
                                         child: Text("Login",style: GoogleFonts.aboreto(
                                           fontSize: width*0.015,
                                           fontWeight: FontWeight.w600,
                                           color: ColorPage.secondarycolor,
                                         ),),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
