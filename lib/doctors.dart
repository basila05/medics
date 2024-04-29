import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medics/colorpage.dart';

import 'main.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
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
  List doctor=[
    {
      "image": ImageIcons.marcus,
      "name": "Dr. Marcus Horizon",
      "text":"Chardiologist",
    },
    {
      "image": ImageIcons.maria,
      "name": "Dr. Maria Elena",
      "text":"Psychologist",
    },
    {
      "image": ImageIcons.stefi,
      "name": "Dr. Stefi Jessi",
      "text":"Orthopedist",
    },
    {
      "image": ImageIcons.gerty,
      "name": "Dr. Gerty Cori",
      "text":"Orthopedist",
    },
    {
      "image": ImageIcons.diandra,
      "name": "Dr. Diandra",
      "text":"Orthopedist",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPage.primarycolor,
        title: Text("Doctors",style: GoogleFonts.aboreto(
          fontSize: width*0.016,
          fontWeight: FontWeight.w600,
          color: ColorPage.secondarycolor,
        ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.02),
          child: Column(
            children: [
             file == null? Container(
                height: height*0.3,
                width: width*0.15,
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
              ): Container(
               height: height*0.3,
               width: width*0.15,
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
              SizedBox(height: width*0.03,),
              InkWell(
                onTap: () {
                  pickFile(ImageSource.gallery);
                },
                child: Container(
                  height: height*0.06,
                  width: width*0.23,
                  decoration: BoxDecoration(
                    gradient: LinearGradientPainter(
                      colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                    ),
                    color: ColorPage.primarycolor,
                    borderRadius: BorderRadius.circular(width*0.01),
                  ),
                  child: Center(
                    child: Text("Upload Image",style: GoogleFonts.aboreto(
                      fontSize: width*0.013,
                      fontWeight: FontWeight.w600,
                      color: ColorPage.secondarycolor,
                    ),),
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
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(width*0.005),
                      child: SvgPicture.asset(ImageIcons.user),
                    ),
                    labelText: "Doctor's name",
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
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(width*0.005),
                      child: Icon(CupertinoIcons.list_bullet_indent,color: ColorPage.primarycolor,),
                    ),
                    labelText: "Specialist",
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
              SizedBox(height: width*0.03,),
              Container(
                height: height*1,
                width: width*0.6,
                child: GridView.builder(
                  itemCount: doctor.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: height*0.07,
                    mainAxisSpacing: width*0.03,
                    mainAxisExtent: width*0.23,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradientPainter(
                              colors: <Color>[ColorPage.secondarycolor, ColorPage.fourthcolor],
                            ),
                            borderRadius: BorderRadius.circular(width*0.02),
                            border: Border.all(
                              width: width*0.001,
                                color: ColorPage.fourthcolor
                            ),
                          boxShadow:[
                            BoxShadow(
                              color: ColorPage.thirdcolor.withOpacity(0.10),
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset:Offset(0, 4),
                            )
                          ] ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height*0.3,
                              width: width*0.15,
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
                                image: DecorationImage(image: AssetImage(doctor[index]["image"]),fit: BoxFit.fill)
                              ),
                            ),
                            Container(
                              height: height*0.078,
                              width: width*0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(doctor[index]["name"],style: GoogleFonts.aboreto(
                                    fontSize: width*0.013,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.primarycolor,
                                  ),),
                                  Text(doctor[index]["text"],style: GoogleFonts.aboreto(
                                    fontSize: width*0.01,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.thirdcolor,
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
