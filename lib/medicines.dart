import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';
import 'package:image_picker/image_picker.dart';

import 'colorpage.dart';
import 'main.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  var file;
  pickFile(ImageSource) async {
    final imgFile= await ImagePicker.platform.getImage(source: ImageSource);
    if(mounted){
      setState(() {
        file=File(imgFile!.path);
      });
    }
  }
  bool toggle = false;
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
                                    child: Text("Medicines",style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ColorPage.secondarycolor,
                                        fontSize: width*0.012
                                    ),),
                                  ):Center(
                                    child: Text("Add",style: TextStyle(
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
                                  child: Text("Add",style: TextStyle(
                                    fontSize: width*0.012,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                  ),),
                                ):Center(
                                  child: Text("Medicines",style: TextStyle(
                                    fontSize: width*0.012,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                  ),),
                                ),)
                            ],
                          ),
                          SizedBox(height: height*0.1,),
                          toggle? Column(
                            children: [
                              SizedBox(height: height*0.1,),
                              Container(
                                height: height*0.08,
                                width: width*0.25,
                                decoration: BoxDecoration(
                                    color: ColorPage.color3,
                                    border: Border.all(
                                        color: ColorPage.color1,
                                        width: width*0.001
                                    ),
                                    borderRadius: BorderRadius.circular(width*0.014)
                                ),
                                child: Center(child: Text("Medicines with Details",style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                    fontSize: width*0.012
                                ),)),
                              ),
                            ],
                          ):
                          Column(
                            children: [
                              file == null? InkWell(
                                onTap: () {
                                  pickFile(ImageSource.gallery);
                                },
                                child: Container(
                                  height: height*0.2,
                                  width: width*0.1,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradientPainter(
                                      colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                                    ),
                                    boxShadow:[
                                      BoxShadow(
                                        color: ColorPage.thirdcolor.withOpacity(0.10),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        offset:Offset(0, 4),
                                      )
                                    ] ,
                                    border: Border.all(
                                        color: ColorPage.primarycolor
                                    ),
                                    borderRadius: BorderRadius.circular(width*0.01),
                                  ),
                                  child: Icon(CupertinoIcons.camera_on_rectangle,size: width*0.03,color: ColorPage.secondarycolor,),
                                ),
                              ): Container(
                                height: height*0.2,
                                width: width*0.1,
                                decoration: BoxDecoration(
                                    boxShadow:[
                                      BoxShadow(
                                        color: ColorPage.thirdcolor.withOpacity(0.10),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        offset:Offset(0, 4),
                                      )
                                    ] ,
                                    borderRadius: BorderRadius.circular(width*0.01),
                                    image: DecorationImage(image: FileImage(file))
                                ),
                              ),
                              SizedBox(height: height*0.05,),
                              Container(
                                height: height*0.06,
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
                                      child: Icon(CupertinoIcons.table,color: ColorPage.primarycolor,),
                                    ),
                                    labelText: "Medicine name",
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
                                height: height*0.06,
                                width: width*0.23,
                                decoration: BoxDecoration(
                                  color: ColorPage.color3,
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: TextFormField(
                                  controller: categoryController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(width*0.005),
                                      child: Icon(Icons.more_horiz,color: ColorPage.primarycolor,),
                                    ),
                                    labelText: "ml/pcs",
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
                            ],
                          )
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
