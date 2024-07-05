import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medics/core/constants/colorpage.dart';

import '../../main.dart';



class HelpAndSupport extends ConsumerStatefulWidget {
  final String name;
  const HelpAndSupport({Key? key, required this.name}) : super(key: key);

  @override
  ConsumerState<HelpAndSupport> createState() => _HelpAndSupportState();
}


class _HelpAndSupportState extends ConsumerState<HelpAndSupport> {
  TextEditingController TextController = TextEditingController();
  settingsData() async {
    await FirebaseFirestore.instance.collection("settings").doc(widget.name).collection(widget.name).doc(widget.name).set({
      "Text" : TextController.text,
    }).then((value) {
      TextController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("submitted Successfully")));
  }
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(
          fontSize: width*0.015,
          fontWeight: FontWeight.w600,
          color: ColorPage.primarycolor
        ),),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: isSmallScreen?width*0.8:width*0.7,
                height: height*0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: isSmallScreen?width*0.8:350,
                        child: TextFormField(
                          controller: TextController,
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.done,
                          cursorColor: ColorPage.primarycolor,
                          onFieldSubmitted: (value) {
                            if(TextController.text.isNotEmpty){
                              settingsData();
                            } else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Text")));
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText:"Enter ${widget.name}",
                              labelStyle: TextStyle(
                                  color: ColorPage.color5,
                                  fontSize: isSmallScreen?12:17
                                // isSmallScreen?12:15
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorPage.primarycolor,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(width * 0.03),
                                  borderSide:
                                  BorderSide(color: ColorPage.primarycolor,)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(width * 0.03),
                                  borderSide:
                                  BorderSide(color: ColorPage.primarycolor,))),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          if(TextController.text.isNotEmpty){
                            settingsData();
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter Text")));
                          }
                        },
                        child: Container(
                            height: height * 0.07,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              color: ColorPage.fourthcolor,
                              borderRadius:
                              BorderRadius.circular(width * 0.015),
                            ),
                            child: Center(
                                child: Text("Submit",
                                    style: TextStyle(
                                        color: ColorPage.primarycolor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.013)))),
                      ),
                      SizedBox(height: 20,),
                      if(isSmallScreen)
                        StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                            stream: FirebaseFirestore.instance.collection('settings')
                                .doc(widget.name).collection(widget.name).snapshots(),
                            builder: (context, snapshot) {
                              if(!snapshot.hasData){
                                return CircularProgressIndicator();
                              }
                              var data = snapshot.data!.docs;
                              return data.isEmpty?
                              Center(child: Text("No ${widget.name}"),)
                                  :Center(
                                child: Center(child: Text(data[0]['Text'])),
                              );
                            }
                        ),
                      Column(
                        children: [
                          isSmallScreen?SizedBox():
                          StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                              stream: FirebaseFirestore.instance.collection('settings')
                                  .doc(widget.name).collection(widget.name).snapshots(),
                              builder: (context, snapshot) {
                                if(!snapshot.hasData){
                                  return CircularProgressIndicator();
                                }
                                var data = snapshot.data!.docs;
                                return data.isEmpty?
                                Center(child: Text("No ${widget.name}"),)
                                    :SizedBox(
                                  height: height*1,
                                  width: width*0.3,
                                  child: Center(child: Text(data[0]['Text'],textAlign: TextAlign.center,)),
                                );
                              }
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //if(!isSmallScreen)
              // Column(
              //   children: [
              //     isSmallScreen?SizedBox():
              //     StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
              //         stream: FirebaseFirestore.instance.collection('settings')
              //             .doc(widget.name).collection(widget.name).snapshots(),
              //         builder: (context, snapshot) {
              //           if(!snapshot.hasData){
              //             return CircularProgressIndicator();
              //           }
              //           var data = snapshot.data!.docs;
              //           return data.isEmpty?
              //           Center(child: Text("No ${widget.name}"),)
              //               :SizedBox(
              //             height: height*1,
              //             width: width*0.3,
              //             child: Center(child: Text(data[0]['Text'],textAlign: TextAlign.center,)),
              //           );
              //         }
              //     ),
              //
              //   ],
              // ),
        
            ],
          ),
        ),
      ),
    );
  }
}