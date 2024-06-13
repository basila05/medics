import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/features/controllers/user_controller.dart';
import 'package:medics/features/screen/ambulanceDetails.dart';
import 'package:medics/features/screen/hsptlDetails.dart';
import 'package:medics/features/screen/medicine2.dart';
import 'package:medics/models/ambulanceModel.dart';
import 'package:medics/models/hospitalModel.dart';
import '../../core/constants/colorpage.dart';
import '../../main.dart';

class AmbulancePage extends ConsumerStatefulWidget {
  const AmbulancePage({super.key});

  @override
  ConsumerState createState() => _AmbulancePageState();
}

class _AmbulancePageState extends ConsumerState<AmbulancePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController idController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  bool toggle = false;

  ambulanceDetails(){
    ref.read(AmbulanceControllerProvider).addAmbulanceData(AmbulanceModel(
        name: nameController.text,
        number: int.parse(numberController.text),
        id: idController.text));
  }
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
                                    child: Text("Hospital",style: TextStyle(
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
                                  child: Text("Hospital",style: TextStyle(
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
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AmbulanceDetails(),));
                                },
                                child: Container(
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
                                  child: Center(child: Text("Ambulance with Details",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: ColorPage.color5,
                                      fontSize: width*0.012
                                  ),)),
                                ),
                              ),
                            ],
                          ):
                          Column(
                            children: [
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
                                      child: Icon(CupertinoIcons.car,color: ColorPage.primarycolor,),
                                    ),
                                    labelText: "Name",
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
                              Container(
                                height: height*0.06,
                                width: width*0.23,
                                decoration: BoxDecoration(
                                  color: ColorPage.color3,
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: TextFormField(
                                  controller: numberController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(width*0.005),
                                      child: Icon(Icons.call,color: ColorPage.primarycolor,),
                                    ),
                                    labelText: "Number",
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
                                  ambulanceDetails();
                                },
                                child: Container(
                                  height: height*0.06,
                                  width: width*0.17,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradientPainter(
                                      colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                                    ),
                                    borderRadius: BorderRadius.circular(width*0.01),
                                  ),
                                  child: Center(
                                    child: Text("Add",style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ColorPage.secondarycolor,
                                        fontSize: width*0.012
                                    ),),
                                  ),
                                ),
                              )
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
