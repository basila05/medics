import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/features/screen/doctorPage2.dart';
import 'package:medics/features/screen/doctors.dart';
import 'package:medics/features/screen/hsptlDetails.dart';
import 'package:medics/features/screen/hsptlPage.dart';
import 'package:medics/features/screen/medicine2.dart';
import 'package:medics/features/screen/medicines.dart';
import 'package:medics/features/screen/settingsPage.dart';
import 'package:medics/features/screen/userPage.dart';
// import 'package:medics/doctors.dart';
import 'package:medics/firebase_options.dart';
// import 'package:medics/login.dart';
// import 'package:medics/medicines.dart';
// import 'package:medics/splashcreen.dart';

import 'features/screen/homepage.dart';
import 'features/screen/splashcreen.dart';
import 'features/screen/update_medicine.dart';
// import 'homepage.dart';

var height;
var width;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ProviderScope(child: Medics()));
}
class Medics extends StatelessWidget {
  const Medics({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: GoogleFonts.muktaVaaniTextTheme()
          ),
          home:HomePage()




      ),);
  }
}