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
                width: width*0.8,
                height: height*1,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("schedule").where("userId", isEqualTo: widget.details,).snapshots(),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Center(child: Text("No document found"));
                      }
                      var data=snapshot.data!.docs;
                      return data.length==0?
                      Center(child: Text("No document found")) :

                      GridView.builder(
                        itemCount:data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3,
                          crossAxisSpacing:width*0.03,
                          mainAxisSpacing: height*0.05,
                          crossAxisCount: 2,
                        ),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            width: width*0.4,
                            height: height*0.03,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorPage.thirdcolor
                              ),
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
                              borderRadius: BorderRadius.circular(width*0.01),),
                            child: Padding(
                              padding: EdgeInsets.only(left: width*0.015),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: height*0.15,
                                    child:  Text("Name:   ${data[index]["name"].toString()}",
                                        style: TextStyle(
                                            fontSize: width*0.015,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ],
                              ),
                            ),
                          );

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
