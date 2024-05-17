import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        child: Column(
          children: [
            ref.watch(StreamDataProvider)
                .when(data: (data) =>  ListView.builder(
              shrinkWrap: true,
              itemCount:data.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  width: width*0.07,
                  height: height*0.04,
                  margin: EdgeInsets.all(width*0.03),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(width*0.015),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(width*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
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
                        InkWell(
                            onTap: () {
                              // deleteDetails();
                              FirebaseFirestore.instance.collection("users").doc(data[index].id).delete();
                            },
                            child: Icon(Icons.delete_outline))
                      ],
                    ),
                  ),
                );
              },),
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
    );
  }
}
