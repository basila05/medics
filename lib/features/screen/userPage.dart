import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradients/gradients.dart';

import '../../core/constants/colorpage.dart';
import '../../main.dart';
import '../controllers/user_controller.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  TextEditingController searchController = TextEditingController();
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
                height: height*0.08,
                width: width*0.25,
                decoration: BoxDecoration(
                  color: ColorPage.color3,
                  borderRadius: BorderRadius.circular(width*0.01),
                ),
                child: TextFormField(
                  controller: searchController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(width*0.005),
                      child: SvgPicture.asset(ImageIcons.Search),
                    ),
                    labelText: "Search Users",
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
          Container(
            width: width*0.8,
            height: height*0.06,),
              ref.watch(StreamDataProvider).when(data: (data) => Container(
                width: width*0.8,
                height: height*1,
                child: GridView.builder(
                  itemCount:data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3,
                    crossAxisSpacing:width*0.03,
                    mainAxisSpacing: height*0.05,
                    crossAxisCount: 1,
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
                        child: Padding(
                          padding: EdgeInsets.only(left: width*0.015),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Row(
                              children: [
                                Text("Name : ",style: TextStyle(fontWeight: FontWeight.w600),),
                                Text(data[index].name.toString(),style: TextStyle(fontWeight: FontWeight.w600),),
                              ],
                            ),
                              Row(
                                children: [
                                  Text("Email : ",style: TextStyle(fontWeight: FontWeight.w600),),
                                  Text(data[index].email.toString(),style: TextStyle(fontWeight: FontWeight.w600),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Password : ",style: TextStyle(fontWeight: FontWeight.w600),),
                                  Text(data[index].password.toString(),style: TextStyle(fontWeight: FontWeight.w600),),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    FirebaseFirestore.instance.collection("users").doc(data[index].id).delete();
                                  },
                                  child: Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    //   width: width*0.4,
                    //   height: height*0.03,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: ColorPage.thirdcolor
                    //     ),
                    //     gradient: LinearGradientPainter(
                    //       colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                    //     ),
                    //     boxShadow:[
                    //       BoxShadow(
                    //         color: ColorPage.thirdcolor.withOpacity(0.10),
                    //         blurRadius: 3,
                    //         spreadRadius: 2,
                    //         offset:Offset(0, 4),
                    //       )
                    //     ] ,
                    //     borderRadius: BorderRadius.circular(width*0.01),),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: width*0.015),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //        Container(
                    //          height: height*0.15,
                    //          child: Column(
                    //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //            children: [
                    //              Row(
                    //                children: [
                    //                  Text("Name : ",style: TextStyle(
                    //                      fontSize: width*0.013,
                    //                      fontWeight: FontWeight.w600),),
                    //                  Text(data[index].name.toString(),style: TextStyle(
                    //                      fontSize: width*0.013,
                    //                      fontWeight: FontWeight.w600),),
                    //                ],
                    //              ),
                    //              Row(
                    //                children: [
                    //                  Text("Email : ",style: TextStyle(fontSize: width*0.013,fontWeight: FontWeight.w600),),
                    //                  Text(data[index].image.toString(),style: TextStyle(fontSize: width*0.013,fontWeight: FontWeight.w600),),
                    //                ],
                    //              ),
                    //              Row(
                    //                children: [
                    //                  Text("Password : ",style: TextStyle(fontSize: width*0.013,fontWeight: FontWeight.w600),),
                    //                  Text(data[index].password.toString(),style: TextStyle(fontSize: width*0.013,fontWeight: FontWeight.w600),),
                    //                ],
                    //              ),
                    //            ],
                    //          ),
                    //        ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             InkWell(
                    //                 onTap: () {
                    //                   showDialog(
                    //                     context: context,
                    //                     barrierDismissible: false,
                    //                     builder: (context) {
                    //                       return AlertDialog(
                    //                         content: Container(
                    //                           height: height*0.2,
                    //                           width: width*0.1,
                    //                           child: Column(
                    //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                             children: [
                    //                               Container(
                    //                                   child: Column(
                    //                                     children: [
                    //                                       Text("Are you sure You want to",
                    //                                         style: TextStyle(
                    //                                             fontWeight: FontWeight.w600,
                    //                                             fontSize: width*0.015,
                    //                                             color: ColorPage.thirdcolor),),
                    //                                       Text("Delete the User?",
                    //                                         style: TextStyle(
                    //                                             fontWeight: FontWeight.w600,
                    //                                             fontSize: width*0.015,
                    //                                             color: ColorPage.thirdcolor),),
                    //                                     ],)),
                    //                               Container(
                    //                                 height: width*0.025,
                    //                                 width: width*0.15,
                    //                                 child: Row(
                    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                   children: [
                    //                                     InkWell(
                    //                                       onTap: () {
                    //                                         FirebaseFirestore.instance.collection("users").doc(data[index].id).delete();
                    //                                       },
                    //                                       child: Container(
                    //                                         height: width*0.025,
                    //                                         width: width*0.07,
                    //                                         decoration: BoxDecoration(
                    //                                             color: ColorPage.primarycolor,
                    //                                             borderRadius: BorderRadius.circular(width*0.015)
                    //                                         ),
                    //                                         child: Center(
                    //                                           child: Text("Yes",
                    //                                             style: TextStyle(
                    //                                                 fontSize: width*0.015,
                    //                                                 fontWeight: FontWeight.w600,
                    //                                                 color: ColorPage.secondarycolor
                    //                                             ),),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                     InkWell(
                    //                                       onTap: () {
                    //                                         Navigator.pop(context);
                    //                                         },
                    //                                       child: Container(
                    //                                         height: width*0.025,
                    //                                         width: width*0.07,
                    //                                         decoration: BoxDecoration(
                    //                                             color: ColorPage.primarycolor,
                    //                                             borderRadius: BorderRadius.circular(width*0.015)
                    //                                         ),
                    //                                         child: Center(
                    //                                           child: Text("No",
                    //                                             style: TextStyle(
                    //                                                 fontSize: width*0.015,
                    //                                                 fontWeight: FontWeight.w600,
                    //                                                 color: ColorPage.secondarycolor
                    //                                             ),),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       );
                    //                     },);
                    //                 },
                    //                 child: Container(
                    //                   height: height*0.06,
                    //                   width: width*0.14,
                    //                   decoration: BoxDecoration(
                    //                     color: ColorPage.fourthcolor,
                    //                     borderRadius: BorderRadius.circular(width*0.01),
                    //                     border: Border.all(color: ColorPage.thirdcolor)
                    //                   ),
                    //                   child: Center(child: Text("Cancel",style: TextStyle(
                    //                       fontSize: width*0.013,
                    //                       fontWeight: FontWeight.w600,
                    //                   color: ColorPage.primarycolor),)),
                    //                 )),
                    //             Container(
                    //               height: height*0.06,
                    //               width: width*0.14,
                    //               decoration: BoxDecoration(
                    //                   color: ColorPage.fourthcolor,
                    //                   borderRadius: BorderRadius.circular(width*0.01),
                    //                   border: Border.all(color: ColorPage.thirdcolor)
                    //               ),
                    //               child: Center(child: Text("View",style: TextStyle(
                    //                   fontSize: width*0.013,
                    //                   fontWeight: FontWeight.w600,
                    //                   color: ColorPage.primarycolor),)),
                    //             )
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
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
