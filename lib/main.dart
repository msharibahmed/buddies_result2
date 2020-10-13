import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/show_result.dart';
import 'provider/result.dart';
import 'screens/developer_screen.dart';
import 'screens/home.dart';
// import 'screens/show_result.dart';

void main() {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Result>(
      create: (_) => Result(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          ShowResult.routeName: (context) => ShowResult(),
          DeveloperScreen.routeName: (context) => DeveloperScreen()
        },
        home: Home(),
      ),
    );
  }
}
