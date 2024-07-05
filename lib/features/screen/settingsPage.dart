import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/features/screen/splashcreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/colorpage.dart';
import '../../main.dart';
import 'help&support.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  TextEditingController settingsController = TextEditingController();
  settingsData(){
    FirebaseFirestore.instance.collection("settings").doc(settingsController.text).set({
      "Text" : settingsController.text
    }).then((value) =>
        settingsController.clear()
    );
  }
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Help and Support"),
      // ),
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
                                    child: Text("Settings",style: TextStyle(
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
                                  child: Text("Settings",style: TextStyle(
                                    fontSize: width*0.012,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                  ),),
                                ),)
                            ],
                          ),
                          SizedBox(height: height*0.1,),
                          toggle?StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection("settings").snapshots(),
                              builder: (context, snapshot) {
                                if(!snapshot.hasData){
                                  return CircularProgressIndicator();
                                  //     SizedBox(
                                  //       height:300,child: Center(child: Lottie.asset(gifs.loadingGif),));
                                }
                                var data=snapshot.data!.docs;
                                return Expanded(
                                  child: ListView.separated(
                                    itemCount:data.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:(BuildContext context,int index){
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HelpAndSupport(name: "${data[index]["Text"]}"),));
                                        },
                                        child: Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(horizontal: isSmallScreen?30:width*0.2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: ColorPage.primarycolor),
                                              gradient: LinearGradient(colors: [
                                                ColorPage.primarycolor,
                                                ColorPage.fifthcolor
                                              ])
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                width: 150,
                                                child: Center(
                                                  child: Text("${data[index]["Text"]}",
                                                    style: TextStyle(
                                                        color: ColorPage.secondarycolor,
                                                        fontWeight:FontWeight.w600,
                                                        fontSize:  isSmallScreen?13:16
                                                    ),),
                                                ),
                                              ),
                                              /// DELETE OPTION
                                              if(index >= 5)
                                                IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        barrierDismissible: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text("Are you sure you want to delete this Option?",
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  fontSize: height*0.02,
                                                                  fontWeight: FontWeight.w600
                                                              ),),
                                                            content: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    height: 30,
                                                                    width: 100,
                                                                    decoration: BoxDecoration(
                                                                      color: Colors.blueGrey,
                                                                      borderRadius: BorderRadius.circular(width*0.03),
                                                                    ),
                                                                    child: Center(child: Text("No",
                                                                      style: TextStyle(
                                                                          color: Colors.white
                                                                      ),)),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () async {
                                                                    await FirebaseFirestore.instance.collection('settings').doc(data[index]['Text']).delete();
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    height: 30,
                                                                    width: 100,
                                                                    decoration: BoxDecoration(
                                                                      color: ColorPage.color3,
                                                                      borderRadius: BorderRadius.circular(width*0.03),
                                                                    ),
                                                                    child: Center(child: Text("Yes",
                                                                      style: TextStyle(
                                                                          color: Colors.white
                                                                      ),)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    icon: Icon(CupertinoIcons.delete,color: ColorPage.thirdcolor,)
                                                )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return SizedBox(height: 10,);
                                    },),
                                );
                              }
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
                                  controller: settingsController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(width*0.005),
                                      child: Icon(CupertinoIcons.settings,color: ColorPage.primarycolor,),
                                    ),
                                    labelText: "New Settings",
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
                              SizedBox(height: height*0.37,),
                              InkWell(
                                onTap: (){
                                  if(settingsController.text.isNotEmpty){
                                    settingsData();
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Field is Empty!")));
                                  }
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}