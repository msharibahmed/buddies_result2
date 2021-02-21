import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Result with ChangeNotifier {
  int _hits = 0;

  int get hits {
    return _hits;
  }

  Map<String, dynamic> _fetchResult = {};
  Map<String, dynamic> get fetchResult {
    return _fetchResult;
  }

  

  Future<void> fetchHits() async {
    final url = "https://buddies-result2.firebaseio.com/.json";

    try {
      final res = await http.get(url);
      _hits = jsonDecode(res.body)['hits'];
      // print(jsonDecode(res.body));

      print('fetched search hit count');
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future<void> result(String fac, String enrol, BuildContext context) async {
    final url = "https://new-result-api.herokuapp.com/";
    final url1 = "https://buddies-result2.firebaseio.com/.json";
    await clearFetchResult();
    try {
      print(fac);
      print(enrol);
      final res = await http.post(url,
          body: jsonEncode({"faculty": fac, "enrollment": enrol}),headers: {"Content-Type":"application/json"});
      final resJson = jsonDecode(res.body);
      // print(resJson);

      final res1 = await http.get(url1);
      _hits = jsonDecode(res1.body)['hits'];

      _hits += 1;

      // ignore: unused_local_variable
      final res2 = await http.put(url1, body: jsonEncode({'hits': _hits}));

      _fetchResult = resJson;
    } catch (error) {
      print(error);
      await alertDialog('Check Entered Credentials!', context);
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

  Future<void> clearFetchResult() async {
    _fetchResult.clear();
    notifyListeners();
  }

}
