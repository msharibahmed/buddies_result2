import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/show_result.dart';
import 'screens/home_screen.dart';
import 'screens/developer_screen.dart';
import 'screens/splash_screen.dart';
import 'provider/result.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Result>(create: (_) => Result()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(),
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          ShowResult.routeName: (context) => ShowResult(),
          DeveloperScreen.routeName: (context) => DeveloperScreen(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
