import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imcflutter/pages/main_page.dart';
import 'package:imcflutter/provider/data_provider.dart';
import 'package:provider/provider.dart';

class ImcApp extends StatelessWidget {
  const ImcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: GoogleFonts.bebasNeueTextTheme(),
        ),
        home: MainPage(),
      ),
    );
  }
}
