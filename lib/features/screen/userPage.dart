import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradients/gradients.dart';

import '../../colorpage.dart';
import '../../core/controllers/user_controller.dart';
import '../../main.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
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
              ref.watch(StreamDataProvider).when(data: (data) => Container(
                width: width*0.8,
                height: height*1,
                child: GridView.builder(
                  itemCount:data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 5,
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
                            ],
                          ),
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
