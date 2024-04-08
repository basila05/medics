import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

var width;
var height;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(medics());
}
class medics extends StatelessWidget {
  const medics({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
      FocusManager.instance.primaryFocus!.unfocus();
    },
    child: MaterialApp(
    theme: ThemeData(
    textTheme: GoogleFonts.interTextTheme()
    ),
    debugShowCheckedModeBanner: false,
    ),
    );
  }
}
