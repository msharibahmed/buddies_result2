import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/cupertino.dart';

class Result with ChangeNotifier {
  Map<String, dynamic> _fetchResult = {};
  Map<String, dynamic> get fetchResult {
    return _fetchResult;
  }

  Future<void> result(String fac, BuildContext context) async {
    final url = "https://buddiesresult2.herokuapp.com/$fac";
    // print('resJson');

    try {
      final res = await http.get(url);
      final resJson = jsonDecode(res.body);
      if (resJson == null) {
        await alertDialog('Check You Entered Faculty Number.', context);
      }
      _fetchResult = resJson;
      print(resJson);
    } catch (error) {
      print(error);
      await alertDialog('Server Error or Check Your Faculty Number!', context);
    }
    notifyListeners();
  }

  Future<void> alertDialog(String text, BuildContext context) {
    return showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
              // title: Text('Error Occured!'),
              content: Text(text),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OKAY', style: TextStyle(color: Colors.red)),
                )
              ],
            ));
  }
}
