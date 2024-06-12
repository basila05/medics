import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/features/screen/update_doctor.dart';

import '../../core/constants/colorpage.dart';
import '../../main.dart';
import '../controllers/user_controller.dart';


class DoctorDetails extends ConsumerStatefulWidget {
  const DoctorDetails({super.key});

  @override
  ConsumerState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends ConsumerState<DoctorDetails> {
  deletedData(String id){
    ref.read(DoctorControllerProvider).deleteData(id);
  }
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
              ref.watch(StreamDocProvider).when(data: (data) => Container(
                width: width*0.7,
                height: height*1,
                child: GridView.builder(
                  itemCount:data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.5,
                    crossAxisSpacing:width*0.03,
                    mainAxisSpacing: height*0.05,
                    crossAxisCount: 2,
                  ),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width*0.3,
                      height: height*0.05,
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
                        borderRadius: BorderRadius.circular(width*0.01),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width*0.1,
                            height: height*0.2,
                            color: Colors.white,
                              child: Image(image:NetworkImage(data[index].image))
                          ),
                          Container(
                            width: width*0.18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data[index].name.toString(),style: TextStyle(
                                    fontSize: width*0.015,
                                    fontWeight: FontWeight.w600),),
                                Text(data[index].spcl.toString(),style: TextStyle(
                                    // color: ColorPage.sixthcolor,
                                    fontWeight: FontWeight.w600),),
                                Text(data[index].exp.toString(),style: TextStyle(
                                    // color: ColorPage.sixthcolor,
                                    fontWeight: FontWeight.w600),),
                                Text("${data[index].cons.toString()}",style: TextStyle(
                                  // color: ColorPage.sixthcolor,
                                    fontWeight: FontWeight.w600),),
                                Text("${data[index].admin.toString()}",style: TextStyle(
                                  // color: ColorPage.sixthcolor,
                                    fontWeight: FontWeight.w600),),
                                Text("${data[index].dis.toString()}",style: TextStyle(
                                  // color: ColorPage.sixthcolor,
                                    fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorUpdatePage(details: data[index],),));
                                },
                                  child: Icon(Icons.edit)),
                              InkWell(
                                  onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Container(
                                              height: height*0.2,
                                              width: width*0.1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                      child: Column(
                                                        children: [
                                                          Text("Are you sure You want to",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: width*0.015,
                                                                color: ColorPage.thirdcolor),),
                                                          Text("Delete the Doctor?",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: width*0.015,
                                                                color: ColorPage.thirdcolor),),
                                                        ],)),
                                                  Container(
                                                    height: width*0.025,
                                                    width: width*0.15,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            deletedData(data[index].id);
                                                            },
                                                          child: Container(
                                                            height: width*0.025,
                                                            width: width*0.07,
                                                            decoration: BoxDecoration(
                                                                color: ColorPage.primarycolor,
                                                                borderRadius: BorderRadius.circular(width*0.015)
                                                            ),
                                                            child: Center(
                                                              child: Text("Yes",
                                                                style: TextStyle(
                                                                    fontSize: width*0.015,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: ColorPage.secondarycolor
                                                                ),),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            height: width*0.025,
                                                            width: width*0.07,
                                                            decoration: BoxDecoration(
                                                                color: ColorPage.primarycolor,
                                                                borderRadius: BorderRadius.circular(width*0.015)
                                                            ),
                                                            child: Center(
                                                              child: Text("No",
                                                                style: TextStyle(
                                                                    fontSize: width*0.015,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: ColorPage.secondarycolor
                                                                ),),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },);
                                  },
                                  child: Icon(Icons.delete)),
                            ],

                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
                error: (error, stackTrace) {
                  return ScaffoldMessenger(
                      child: Center(child: Text(error.toString())));
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },)

            ],
          ),
        ),
      ),
    );
  }
}
