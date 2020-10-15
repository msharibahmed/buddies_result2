import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/result.dart';
import '../widgets/name_card.dart';

class NameScreen extends StatelessWidget {
  static const routeName = 'name-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent[100],
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
            label: const Text(
              'Go Back',
              style: TextStyle(color: Colors.greenAccent),
            ),
            backgroundColor: Colors.black,
            elevation: 5,
            onPressed: () {
              Navigator.pop(context);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Consumer<Result>(
          builder: (context, data, _) => ListView.builder(
              itemBuilder: (context, endex) => NameCard(endex),
              itemCount: (data.fetchNameResult).length),
        ));
  }
}
