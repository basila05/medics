import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';

import 'colorpage.dart';
import 'main.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  List medicine=[
  {
  "image": ImageIcons.tab1,
  "name": "Panadol",
  "text":"20pcs",
  },
  {
   "image": ImageIcons.tab2,
    "name": "Bodrex Herbal",
    "text":"100ml",
    },
   {
   "image": ImageIcons.tab3,
    "name": "OBH Combi",
    "text":"75ml",
   },
   {
   "image": ImageIcons.tab4,
    "name": "Konidin",
    "text":"3pcs",
   },
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPage.primarycolor,
        title: Text("Medicines",style: GoogleFonts.aboreto(
          fontSize: width*0.016,
          fontWeight: FontWeight.w600,
          color: ColorPage.secondarycolor,
        ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.02),
          child: Column(
            children: [
              Container(
                height: height*1,
                width: width*0.63,
                child: GridView.builder(
                  itemCount: medicine.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: height*0.07,
                    mainAxisSpacing: width*0.03,
                    mainAxisExtent: width*0.22,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: ColorPage.secondarycolor,
                        borderRadius: BorderRadius.circular(width*0.02),
                        border: Border.all(
                            width: width*0.001,
                            color: ColorPage.thirdcolor
                        ),
                        boxShadow:[
                          BoxShadow(
                            color: ColorPage.thirdcolor.withOpacity(0.10),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset:Offset(0, 4),
                          )
                        ] ,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height*0.3,
                            width: width*0.15,
                            decoration: BoxDecoration(
                              color: ColorPage.secondarycolor,
                                borderRadius: BorderRadius.circular(width*0.01),
                                image: DecorationImage(image: AssetImage(medicine[index]["image"]),fit: BoxFit.fill)
                            ),
                          ),
                          Container(
                            height: height*0.078,
                            width: width*0.17,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(medicine[index]["name"],style: TextStyle(
                                  fontSize: width*0.013,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPage.thirdcolor,
                                ),),
                                Text(medicine[index]["text"],style: TextStyle(
                                  fontSize: width*0.01,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPage.sixthcolor,
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
