import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/colorpage.dart';

import 'main.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  List doctor=[
    {
      "image": ImageIcons.marcus,
      "name": "Dr. Marcus Horizon",
      "text":"Chardiologist",
    },
    {
      "image": ImageIcons.maria,
      "name": "Dr. Maria Elena",
      "text":"Psychologist",
    },
    {
      "image": ImageIcons.stefi,
      "name": "Dr. Stefi Jessi",
      "text":"Orthopedist",
    },
    {
      "image": ImageIcons.gerty,
      "name": "Dr. Gerty Cori",
      "text":"Orthopedist",
    },
    {
      "image": ImageIcons.diandra,
      "name": "Dr. Diandra",
      "text":"Orthopedist",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPage.primarycolor,
        title: Text("Doctors",style: GoogleFonts.aboreto(
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
                  itemCount: doctor.length,
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
                            gradient: LinearGradientPainter(
                              colors: <Color>[ColorPage.secondarycolor, ColorPage.fourthcolor],
                            ),
                            borderRadius: BorderRadius.circular(width*0.02),
                            border: Border.all(
                              width: width*0.001,
                                color: ColorPage.thirdcolor
                            ),
                          boxShadow:[
                            BoxShadow(
                              color: ColorPage.thirdcolor.withOpacity(0.10),
                              blurRadius: 3,
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
                                  borderRadius: BorderRadius.circular(width*0.01),
                                image: DecorationImage(image: AssetImage(doctor[index]["image"]),fit: BoxFit.fill)
                              ),
                            ),
                            Container(
                              height: height*0.078,
                              width: width*0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(doctor[index]["name"],style: GoogleFonts.aboreto(
                                    fontSize: width*0.013,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.primarycolor,
                                  ),),
                                  Text(doctor[index]["text"],style: GoogleFonts.aboreto(
                                    fontSize: width*0.01,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.thirdcolor,
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
