import 'package:deepbyte_task_flutter/pages/nav.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.overpassTextTheme(textTheme),
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: const Nav());
  }
}
