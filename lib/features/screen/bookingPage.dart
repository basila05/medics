import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/core/constants/colorpage.dart';

import '../../main.dart';


class BookingPage extends ConsumerStatefulWidget {
  final String details;
  const BookingPage({super.key, required this.details, });

  @override
  ConsumerState createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> { TextEditingController searchController = TextEditingController();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width*1,
                height: height*0.8,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("schedule").where("userId", isEqualTo: widget.details,).snapshots(),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Center(child: Text("No document found"));
                      }
                      var data=snapshot.data!.docs;
                      return data.length==0?
                      Center(child: Text("No document found")) :

                      ListView.separated(
                        itemCount:data.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: width*0.25,
                            height: height*1,
                            decoration: BoxDecoration(
                              color: ColorPage.fourthcolor,
                              boxShadow:[
                                BoxShadow(
                                  color: ColorPage.thirdcolor.withOpacity(0.10),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset:Offset(0, 4),
                                )
                              ] ,
                              borderRadius: BorderRadius.circular(width*0.01),),
                            child: Padding(
                              padding: EdgeInsets.only(left: width*0.015),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: width*0.06,
                                    backgroundImage: NetworkImage(data[index]["image"]),
                                  ),

                                  Text("Name:   ${data[index]["name"].toString()}",
                                      style: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w500)),
                                  Text("Specialisation:   ${data[index]["spcl"].toString()}",
                                      style: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w500)),

                                  Divider(thickness: width*0.0005,
                                    color: ColorPage.primarycolor,
                                    indent: width*0.03,
                                    endIndent: width*0.03,
                                  ),
                                  Text("Date:   ${data[index]["date"].toString().substring(0,10)}",
                                      style: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w500)),
                                  Text("Time:   ${data[index]["time"].toString()}",
                                      style: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w500)),
                                  Divider(thickness: width*0.0005,
                                    color: ColorPage.primarycolor,
                                    indent: width*0.03,
                                    endIndent: width*0.03,
                                  ),


                                  Text("Experience:   ${data[index]["exp"].toString()}",
                                      style: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w500)),

                                  Text("ID:   ${data[index]["id"].toString()}",
                                      style: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w500)),
                                  Text("Fees:  \$ ${data[index]["cons"].toString()}",
                                      style: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          );

                        }, separatorBuilder: (BuildContext context, int index) {
                          return SizedBox( width: width*0.01,);
                      },
                      );

                    }
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
