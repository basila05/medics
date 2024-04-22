import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/banners.dart';
import 'package:medics/colorpage.dart';
import 'package:medics/doctors.dart';
import 'package:medics/medicines.dart';
import 'package:side_navigation/side_navigation.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> views = [
    Center(
      child: Text('Users'),
    ),
    DoctorPage(),
    MedicinePage(),
    BannerPage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: [
        SideNavigationBar(
          header: SideNavigationBarHeader(
              image: CircleAvatar(
                backgroundColor: ColorPage.primarycolor,
                radius: width*0.02,
                child: Image.asset(ImageIcons.vector,fit: BoxFit.fill,),
              ),
              title: Text('Medics',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w900,
                fontSize: width*0.02,
                color: ColorPage.secondarycolor
              ),),
              subtitle: Text('Medic Admin')
          ),
          footer: SideNavigationBarFooter(
              label: Text('Close',
              style: TextStyle(
                  fontSize: width*0.015,
                  fontWeight: FontWeight.w600,
                  color: ColorPage.secondarycolor
              ),)
          ),
      theme: SideNavigationBarTheme(
        backgroundColor: ColorPage.primarycolor,
      itemTheme:  SideNavigationBarItemTheme(
      unselectedItemColor: ColorPage.thirdcolor,
          selectedItemColor: ColorPage.secondarycolor,
          iconSize: width*0.02,
          labelTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
              fontSize: width*0.015,
              color: ColorPage.thirdcolor
          )
      ),
      togglerTheme: SideNavigationBarTogglerTheme.standard(),
      dividerTheme: SideNavigationBarDividerTheme.standard(),
    ),
        selectedIndex: selectedIndex,
        items: [
          SideNavigationBarItem(
            icon: Icons.people_sharp,
            label: 'Users',
          ),
          SideNavigationBarItem(
            icon: Icons.person_search_outlined,
            label: 'Doctors',
          ),
          SideNavigationBarItem(
            icon: Icons.medical_information_sharp,
            label: 'Medicines',
          ),
          SideNavigationBarItem(
            icon: Icons.list_alt_outlined,
            label: 'Banners',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      Expanded(
        child: views.elementAt(selectedIndex),
      )
      ],
    ),
    );
  }
}

