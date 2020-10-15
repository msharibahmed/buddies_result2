import 'package:buddies_result2/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/show_result.dart';
import 'provider/bool.dart';
import 'provider/result.dart';
import 'screens/developer_screen.dart';
import 'screens/home.dart';
import 'screens/name_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Result>(create: (_) => Result()),
        ChangeNotifierProvider<BoolCheck>(create: (_) => BoolCheck()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Home.routeName: (context) => Home(),
          ShowResult.routeName: (context) => ShowResult(),
          DeveloperScreen.routeName: (context) => DeveloperScreen(),
          NameScreen.routeName: (context) => NameScreen(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
