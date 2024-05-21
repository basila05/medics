import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/core/constants/colorpage.dart';
import 'package:medics/features/screen/login.dart';
import 'package:medics/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(
        seconds: 5
    )).then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),)));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Container(
           height: height*1,
           width: width*1,
           decoration: BoxDecoration(
             gradient: LinearGradientPainter(
               colors: <Color>[ColorPage.primarycolor, ColorPage.primarycolor],
             ),
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                   height: width*0.08,
                   width: width*0.08,
                   child: Image.asset(ImageIcons.vector)),
               Text('Medics',
                 style: GoogleFonts.inter(
                     fontWeight: FontWeight.w900,
                     fontSize: width*0.025,
                     color: ColorPage.secondarycolor
                 ),),
               Text('FINALLY, AN APPLICATION THAT CARES...',
                 style: GoogleFonts.aboreto(
                     fontWeight: FontWeight.w600,
                     fontSize: width*0.01,
                     color: ColorPage.secondarycolor
                 ),),
             ],
           ),
         ),
       ],
     ),
    );
  }
}
