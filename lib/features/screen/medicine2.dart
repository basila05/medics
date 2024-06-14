import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/features/screen/update_medicine.dart';

import '../../core/constants/colorpage.dart';
import '../../main.dart';
import '../controllers/user_controller.dart';
import '../repository/user_repository.dart';


class MedicineDetails extends ConsumerStatefulWidget {
  const MedicineDetails({super.key});

  @override
  ConsumerState createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends ConsumerState<MedicineDetails> {
  deleted(String id){
    ref.read(MedicineControllerProvider).delete(id);
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
              ref.watch(StreamMedProvider).when(data: (data) => Container(
                width: width*0.7,
                height: height*1,
                child: GridView.builder(
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
                      width: width*0.3,
                      height: height*0.03,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width*0.1,
                                height: height*0.2,
                                child: Image(image:NetworkImage( data[index].image.toString()),fit: BoxFit.fill,)
                              ),
                              Container(
                                width: width*0.12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(data[index].name.toString(),style: TextStyle(
                                        fontSize: width*0.015,
                                        fontWeight: FontWeight.w600),),
                                    Text("${data[index].ml.toString()}",style: TextStyle(
                                      // color: ColorPage.sixthcolor,
                                        fontWeight: FontWeight.w600),),
                                    Text("${data[index].rate.toString()}",style: TextStyle(
                                      // color: ColorPage.sixthcolor,
                                        fontWeight: FontWeight.w600),),
                                    Text("${data[index].off.toString()}",style: TextStyle(
                                      // color: ColorPage.sixthcolor,
                                        fontWeight: FontWeight.w600),),
                                    Text("${data[index].des.toString()}",style: TextStyle(
                                      // color: ColorPage.sixthcolor,
                                        fontWeight: FontWeight.w600),),
                                    Text("${data[index].qty.toString()}",style: TextStyle(
                                      // color: ColorPage.sixthcolor,
                                        fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                                        Text("Delete the Medicine?",
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
                                                          deleted(data[index].id);
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
                                  child: Container(
                                    height: height*0.06,
                                    width: width*0.14,
                                    decoration: BoxDecoration(
                                        color: ColorPage.fourthcolor,
                                        borderRadius: BorderRadius.circular(width*0.01),
                                        border: Border.all(color: ColorPage.thirdcolor)
                                    ),
                                    child: Center(child: Text("Cancel",style: TextStyle(
                                        fontSize: width*0.013,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPage.primarycolor),)),
                                  )),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(detail: data[index]),));
                                },
                                child: Container(
                                  height: height*0.06,
                                  width: width*0.14,
                                  decoration: BoxDecoration(
                                      color: ColorPage.fourthcolor,
                                      borderRadius: BorderRadius.circular(width*0.01),
                                      border: Border.all(color: ColorPage.thirdcolor)
                                  ),
                                  child: Center(child: Text("Update",style: TextStyle(
                                      fontSize: width*0.013,
                                      fontWeight: FontWeight.w600,
                                      color: ColorPage.primarycolor),)),
                                ),
                              )
                            ],
                          ),
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
