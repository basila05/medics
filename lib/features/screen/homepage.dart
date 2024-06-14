import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/features/screen/banners.dart';
import 'package:medics/core/constants/colorpage.dart';
import 'package:medics/features/screen/doctors.dart';
import 'package:medics/features/screen/hsptlPage.dart';
import 'package:medics/features/screen/medicines.dart';
import 'package:medics/features/screen/userPage.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggle =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      height: height*0.85,
                      width: width*0.65,
                      decoration: BoxDecoration(
                        color: ColorPage.fourthcolor,
                        borderRadius: BorderRadius.circular(width*0.02),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height*0.12,),
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  toggle=!toggle;
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  height: height*0.07,
                                  width: width*0.4,
                                  decoration: BoxDecoration(
                                      color: ColorPage.color3,
                                      border: Border.all(
                                          color: ColorPage.color1,
                                          width: width*0.001
                                      ),
                                      borderRadius: BorderRadius.circular(width*0.014)
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(
                                    milliseconds: 200
                                ),
                                left:toggle? width*0.16:width*0.001,
                                right:toggle?width*0.001: width*0.16,
                                curve: Curves.easeIn,
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration:  Duration(
                                      milliseconds: 200
                                  ),
                                  height: height*0.07,
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                      color: ColorPage.primarycolor,
                                      border: Border.all(
                                          color: ColorPage.color1,
                                          width: width*0.001
                                      ),
                                      borderRadius: BorderRadius.circular(width*0.014)
                                  ),
                                  child: toggle?Center(
                                    child: Text("Orders",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                        color: ColorPage.secondarycolor,
                                        fontSize: width*0.012
                                    ),),
                                  ):Center(
                                    child: Text("Users",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                        color: ColorPage.secondarycolor,
                                        fontSize: width*0.012
                                    ),),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(
                                    milliseconds: 200),
                                left: toggle?width*0.015:width*0.18,
                                right: toggle?width*0.18:width*0.0015,
                                top: width*0.007,
                                child: toggle?Center(
                                  child: Text("Users",style: TextStyle(
                                    fontSize: width*0.012,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                  ),),
                                ):Center(
                                  child: Text("Orders",style: TextStyle(
                                    fontSize: width*0.012,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                  ),),
                                ),)
                            ],
                          ),
                          SizedBox(height: height*0.1,),
                          toggle? Container(
                                  height: height*0.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorPage(),));
                                        },
                                        child: Container(
                                          height: height*0.07,
                                          width: width*0.2,
                                          decoration: BoxDecoration(
                                              color: ColorPage.color3,
                                              border: Border.all(
                                                  color: ColorPage.color1,
                                                  width: width*0.001
                                              ),
                                              borderRadius: BorderRadius.circular(width*0.014)
                                          ),
                                          child: Center(child: Text("Doctor Consulting",style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ColorPage.color5,
                                              fontSize: width*0.012
                                          ),)),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => MedicinePage(),));
                                        },
                                        child: Container(
                                          height: height*0.07,
                                          width: width*0.2,
                                          decoration: BoxDecoration(
                                              color: ColorPage.color3,
                                              border: Border.all(
                                                  color: ColorPage.color1,
                                                  width: width*0.001
                                              ),
                                              borderRadius: BorderRadius.circular(width*0.014)
                                          ),
                                          child: Center(child: Text("Medicines",style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ColorPage.color5,
                                              fontSize: width*0.012
                                          ),)),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HsptlPage(),));
                                        },
                                        child: Container(
                                          height: height*0.07,
                                          width: width*0.2,
                                          decoration: BoxDecoration(
                                              color: ColorPage.color3,
                                              border: Border.all(
                                                  color: ColorPage.color1,
                                                  width: width*0.001
                                              ),
                                              borderRadius: BorderRadius.circular(width*0.014)
                                          ),
                                          child: Center(child: Text("Hospital",style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ColorPage.color5,
                                              fontSize: width*0.012
                                          ),)),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HsptlPage(),));
                                        },
                                        child: Container(
                                          height: height*0.07,
                                          width: width*0.2,
                                          decoration: BoxDecoration(
                                              color: ColorPage.color3,
                                              border: Border.all(
                                                  color: ColorPage.color1,
                                                  width: width*0.001
                                              ),
                                              borderRadius: BorderRadius.circular(width*0.014)
                                          ),
                                          child: Center(child: Text("Ambulance",style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ColorPage.color5,
                                              fontSize: width*0.012
                                          ),)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ):InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => UsersPage(),));
                                     },
                                     child: Container(
                              height: height*0.07,
                              width: width*0.2,
                              decoration: BoxDecoration(
                                  color: ColorPage.color3,
                                  border: Border.all(
                                      color: ColorPage.color1,
                                      width: width*0.001
                                  ),
                                  borderRadius: BorderRadius.circular(width*0.014)
                              ),
                              child: Center(child: Text("User Details",style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: ColorPage.color5,
                                  fontSize: width*0.012
                              ),)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

