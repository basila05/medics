import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List medicine=[
  {
  "image": ImageIcons.tab1,
  "name": "Panadol",
  "text":"20pcs",
  },
  {
   "image": ImageIcons.tab2,
    "name": "Bodrex Herbal",
    "text":"100ml",
    },
   {
   "image": ImageIcons.tab3,
    "name": "OBH Combi",
    "text":"75ml",
   },
   {
   "image": ImageIcons.tab4,
    "name": "Konidin",
    "text":"3pcs",
   },
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPage.primarycolor,
        title: Text("Medicines",style: GoogleFonts.aboreto(
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
              SizedBox(height: width*0.03,),
              Container(
                height: height*1,
                width: width*0.57,
                child: GridView.builder(
                  itemCount: medicine.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: height*0.07,
                    mainAxisSpacing: width*0.03,
                    mainAxisExtent: width*0.2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: ColorPage.secondarycolor,
                        borderRadius: BorderRadius.circular(width*0.02),
                        border: Border.all(
                            width: width*0.001,
                            color: ColorPage.fourthcolor
                        ),
                        boxShadow:[
                          BoxShadow(
                            color: ColorPage.thirdcolor.withOpacity(0.10),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset:Offset(0, 4),
                          )
                        ] ,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height*0.27,
                            width: width*0.13,
                            decoration: BoxDecoration(
                                boxShadow:[
                                  BoxShadow(
                                    color: ColorPage.thirdcolor.withOpacity(0.10),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset:Offset(0, 4),
                                  )
                                ] ,
                              color: ColorPage.secondarycolor,
                                borderRadius: BorderRadius.circular(width*0.01),
                                image: DecorationImage(image: AssetImage(medicine[index]["image"]),fit: BoxFit.fill)
                            ),
                          ),
                          Container(
                            height: height*0.073,
                            width: width*0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(medicine[index]["name"],style: TextStyle(
                                  fontSize: width*0.013,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPage.thirdcolor,
                                ),),
                                Text(medicine[index]["text"],style: TextStyle(
                                  fontSize: width*0.01,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPage.sixthcolor,
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
