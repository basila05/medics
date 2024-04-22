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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool toggle = false;
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   children: [
      //     Container(
      //       height: height*1,
      //       width: width*1,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradientPainter(
      //           colors: <Color>[ColorPage.fifthcolor, ColorPage.primarycolor],
      //         ),
      //       ),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: height*0.95,
      //             width: width*0.85,
      //             decoration: BoxDecoration(
      //               color: ColorPage.primarycolor,
      //               borderRadius: BorderRadius.circular(width*0.009),
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Container(
      //                     height: height*0.95,
      //                     width: width*0.32,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(width*0.015),
      //                     ),
      //                     child: Image.asset(ImageIcons.doct2,fit: BoxFit.fill,)),
      //             Column(
      //               children: [
      //                 Container(
      //                   height: height*0.9,
      //                   width: width*0.45,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(width*0.015),
      //                   ),
      //                   child: Column(
      //                     children: [
      //                       Stack(
      //                         alignment: Alignment.topLeft,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.end,
      //                             children: [
      //                               Container(
      //                                   height: height*0.45,
      //                                   width: width*0.3,
      //                                   child: Image.asset(ImageIcons.line,fit: BoxFit.fill,)),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                       Row(
      //                         children: [
      //                           Container(
      //                             height: height*0.1,
      //                             width: width*0.3,
      //                             decoration: BoxDecoration(
      //                                 color: ColorPage.primarycolor,
      //                                 borderRadius: BorderRadius.circular(width*0.01)
      //                             ),
      //                             child: TextFormField(
      //                               controller: nameController,
      //                               textInputAction: TextInputAction.next,
      //                               keyboardType: TextInputType.text,
      //                               style: GoogleFonts.aboreto(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.fourthcolor),
      //                               decoration: InputDecoration(
      //                                 prefixIcon: Padding(
      //                                   padding: EdgeInsets.all(width*0.008),
      //                                   child: SvgPicture.asset(ImageIcons.user,color: ColorPage.fourthcolor,),
      //                                 ),
      //                                 labelText: "Enter your name",
      //                                 labelStyle: GoogleFonts.aboreto(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.fourthcolor),
      //                                 focusedBorder: OutlineInputBorder(
      //                                     borderSide: BorderSide(
      //                                         color: ColorPage.fourthcolor
      //                                     ),
      //                                     borderRadius: BorderRadius.circular(width*0.01)
      //                                 ),
      //                                 enabledBorder: OutlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                       width: width*0.0015,
      //                                       color: ColorPage.fourthcolor
      //                                   ),
      //                                   borderRadius: BorderRadius.circular(width*0.01),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       SizedBox(height: width*0.015,),
      //                       Row(
      //                         children: [
      //                           Container(
      //                             height: height*0.1,
      //                             width: width*0.3,
      //                             decoration: BoxDecoration(
      //                                 color: ColorPage.primarycolor,
      //                                 borderRadius: BorderRadius.circular(width*0.01)
      //                             ),
      //                             child: TextFormField(
      //                               controller: emailController,
      //                               textInputAction: TextInputAction.done,
      //                               keyboardType: TextInputType.emailAddress,
      //                               style: GoogleFonts.aboreto(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.fourthcolor),
      //                               decoration: InputDecoration(
      //                                 prefixIcon: Padding(
      //                                   padding: EdgeInsets.all(width*0.008),
      //                                   child: SvgPicture.asset(ImageIcons.email,color: ColorPage.fourthcolor,),
      //                                 ),
      //                                 labelText: "Enter your email",
      //                                 labelStyle: GoogleFonts.aboreto(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.fourthcolor),
      //                                 focusedBorder: OutlineInputBorder(
      //                                     borderSide: BorderSide(
      //                                         color: ColorPage.fourthcolor
      //                                     ),
      //                                     borderRadius: BorderRadius.circular(width*0.01)
      //                                 ),
      //                                 enabledBorder: OutlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     width: width*0.0015,
      //                                       color: ColorPage.fourthcolor
      //                                   ),
      //                                   borderRadius: BorderRadius.circular(width*0.01),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       SizedBox(height: width*0.03),
      //                       Row(
      //                         children: [
      //                           InkWell(
      //                             onTap: () {
      //                               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
      //                             },
      //                             child: Container(
      //                               height: height*0.1,
      //                               width: width*0.3,
      //                               decoration: BoxDecoration(
      //                                 gradient: LinearGradientPainter(
      //                                   colors: <Color>[ColorPage.fourthcolor, ColorPage.secondarycolor],
      //                                 ),
      //                                 borderRadius: BorderRadius.circular(width*0.01)
      //                               ),
      //                               child: Center(
      //                                 child: Text("Login",style: GoogleFonts.aboreto(
      //                                   fontSize: width*0.017,
      //                                   fontWeight: FontWeight.w600,
      //                                   color: ColorPage.primarycolor,
      //                                 ),),
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             )
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height*1,
              width: width*1,
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //     colors: [
                  //       ColorPage.primarycolor,
                  //       ColorPage.fourthcolor,
                  //       ColorPage.fifthcolor,
                  //       ColorPage.secondarycolor
                  //     ],
                  //     stops: [0.25,0.25,0.25,0.25],
                  //     begin: Alignment.topLeft,
                  //     end: Alignment.bottomRight
                  // )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height*0.83,
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
                              height: height*0.83,
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
                                        Text("Expert advice from\ntop doctors",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w900,
                                              fontSize: width*0.02,
                                              color: ColorPage.secondarycolor
                                          ),),
                                      ],
                                    ),
                                    SizedBox(height: height*0.03,),
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
                                   SizedBox(height: height*0.015,),
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
                                   SizedBox(height: height*0.015,),
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
                              height: height*0.83,
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
                        height: height*0.72,
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
                                   height: height*0.05,
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
                                       focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                             color: ColorPage.primarycolor,
                                           ),
                                           borderRadius: BorderRadius.circular(width*0.01)
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(
                                             color: ColorPage.primarycolor
                                         ),
                                         borderRadius: BorderRadius.circular(width*0.01),
                                       ),
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: height*0.03,),
                                 Container(
                                   height: height*0.05,
                                   width: width*0.23,
                                   decoration: BoxDecoration(
                                     color: ColorPage.color3,
                                     borderRadius: BorderRadius.circular(width*0.01),
                                   ),
                                   child: TextFormField(
                                     controller: emailController,
                                     textInputAction: TextInputAction.next,
                                     keyboardType: TextInputType.emailAddress,
                                     style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                     decoration: InputDecoration(
                                       prefixIcon: Padding(
                                         padding: EdgeInsets.all(width*0.005),
                                         child: SvgPicture.asset(ImageIcons.email),
                                       ),
                                       labelText: "Enter your email",
                                       labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                       focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                             color: ColorPage.primarycolor,
                                           ),
                                           borderRadius: BorderRadius.circular(width*0.01)
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(
                                             color: ColorPage.primarycolor
                                         ),
                                         borderRadius: BorderRadius.circular(width*0.01),
                                       ),
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: height*0.03),
                                 Container(
                                   height: height*0.05,
                                   width: width*0.23,
                                   decoration: BoxDecoration(
                                     color: ColorPage.color3,
                                     borderRadius: BorderRadius.circular(width*0.01),
                                   ),
                                   child: TextFormField(
                                     controller: passwordController,
                                     textInputAction: TextInputAction.done,
                                     keyboardType: TextInputType.text,
                                     style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                     decoration: InputDecoration(
                                       prefixIcon: Padding(
                                         padding: EdgeInsets.all(width*0.005),
                                         child: SvgPicture.asset(ImageIcons.password),
                                       ),
                                       labelText: "Enter your password",
                                       labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                       focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                             color: ColorPage.primarycolor,
                                           ),
                                           borderRadius: BorderRadius.circular(width*0.01)
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(
                                             color: ColorPage.primarycolor
                                         ),
                                         borderRadius: BorderRadius.circular(width*0.01),
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
                                   height: height*0.05,
                                   width: width*0.23,
                                   decoration: BoxDecoration(
                                     color: ColorPage.color3,
                                     borderRadius: BorderRadius.circular(width*0.01),
                                   ),
                                   child: TextFormField(
                                     controller: emailController,
                                     textInputAction: TextInputAction.next,
                                     keyboardType: TextInputType.emailAddress,
                                     style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                     decoration: InputDecoration(
                                       prefixIcon: Padding(
                                         padding: EdgeInsets.all(width*0.005),
                                         child: SvgPicture.asset(ImageIcons.email),
                                       ),
                                       labelText: "Enter your email",
                                       labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                       focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                             color: ColorPage.primarycolor,
                                           ),
                                           borderRadius: BorderRadius.circular(width*0.01)
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(
                                             color: ColorPage.primarycolor
                                         ),
                                         borderRadius: BorderRadius.circular(width*0.01),
                                       ),
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: height*0.03,),
                                 Container(
                                   height: height*0.05,
                                   width: width*0.23,
                                   decoration: BoxDecoration(
                                     color: ColorPage.color3,
                                     borderRadius: BorderRadius.circular(width*0.01),
                                   ),
                                   child: TextFormField(
                                     controller: passwordController,
                                     textInputAction: TextInputAction.done,
                                     keyboardType: TextInputType.text,
                                     style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                     decoration: InputDecoration(
                                       prefixIcon: Padding(
                                         padding: EdgeInsets.all(width*0.005),
                                         child: SvgPicture.asset(ImageIcons.password),
                                       ),
                                       labelText: "Enter your password",
                                       labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                       focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                             color: ColorPage.primarycolor,
                                           ),
                                           borderRadius: BorderRadius.circular(width*0.01)
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: BorderSide(
                                             color: ColorPage.primarycolor
                                         ),
                                         borderRadius: BorderRadius.circular(width*0.01),
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
    );
  }
}
