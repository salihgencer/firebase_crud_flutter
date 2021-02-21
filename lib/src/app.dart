import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/src/providers/entry_provider.dart';
import 'package:journal_app/src/screens/home.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => EntryProvider(),
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(
          textTheme: GoogleFonts.patrickHandScTextTheme(),
        ),
      ),
    );
  }
}
