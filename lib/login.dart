import 'dart:html';

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
  TextEditingController nameController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height*1,
            width: width*1,
            decoration: BoxDecoration(
              gradient: LinearGradientPainter(
                colors: <Color>[ColorPage.fifthcolor, ColorPage.primarycolor],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height*0.95,
                  width: width*0.85,
                  decoration: BoxDecoration(
                    color: ColorPage.primarycolor,
                    borderRadius: BorderRadius.circular(width*0.009),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: height*0.95,
                          width: width*0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.015),
                          ),
                          child: Image.asset(ImageIcons.doct2,fit: BoxFit.fill,)),
                  Column(
                    children: [
                      Container(
                        height: height*0.9,
                        width: width*0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.015),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: height*0.45,
                                        width: width*0.3,
                                        child: Image.asset(ImageIcons.line,fit: BoxFit.fill,)),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: height*0.1,
                                  width: width*0.3,
                                  decoration: BoxDecoration(
                                      color: ColorPage.primarycolor,
                                      borderRadius: BorderRadius.circular(width*0.01)
                                  ),
                                  child: TextFormField(
                                    controller: nameController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    style: GoogleFonts.aboreto(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.fourthcolor),
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(width*0.008),
                                        child: SvgPicture.asset(ImageIcons.user,color: ColorPage.fourthcolor,),
                                      ),
                                      labelText: "Enter your name",
                                      labelStyle: GoogleFonts.aboreto(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.fourthcolor),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorPage.fourthcolor
                                          ),
                                          borderRadius: BorderRadius.circular(width*0.01)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: width*0.0015,
                                            color: ColorPage.fourthcolor
                                        ),
                                        borderRadius: BorderRadius.circular(width*0.01),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: width*0.015,),
                            Row(
                              children: [
                                Container(
                                  height: height*0.1,
                                  width: width*0.3,
                                  decoration: BoxDecoration(
                                      color: ColorPage.primarycolor,
                                      borderRadius: BorderRadius.circular(width*0.01)
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.emailAddress,
                                    style: GoogleFonts.aboreto(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.fourthcolor),
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(width*0.008),
                                        child: SvgPicture.asset(ImageIcons.email,color: ColorPage.fourthcolor,),
                                      ),
                                      labelText: "Enter your email",
                                      labelStyle: GoogleFonts.aboreto(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.fourthcolor),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorPage.fourthcolor
                                          ),
                                          borderRadius: BorderRadius.circular(width*0.01)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: width*0.0015,
                                            color: ColorPage.fourthcolor
                                        ),
                                        borderRadius: BorderRadius.circular(width*0.01),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: width*0.03),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                  },
                                  child: Container(
                                    height: height*0.1,
                                    width: width*0.3,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradientPainter(
                                        colors: <Color>[ColorPage.fourthcolor, ColorPage.secondarycolor],
                                      ),
                                      borderRadius: BorderRadius.circular(width*0.01)
                                    ),
                                    child: Center(
                                      child: Text("Login",style: GoogleFonts.aboreto(
                                        fontSize: width*0.017,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPage.primarycolor,
                                      ),),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
