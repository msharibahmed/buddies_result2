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

  List _fetchNameResult = [];
  List get fetchNameResult {
    return _fetchNameResult;
  }

  Future<void> fetchHits() async {
    final url = "https://buddies-result2.firebaseio.com/.json";

    try {
      final res = await http.get(url);
      _hits = jsonDecode(res.body)['hits'];
      // print(jsonDecode(res.body));

      print('fetched data');
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future<void> result(String fac, BuildContext context) async {
    final url = "https://buddiesresult2.herokuapp.com/facno/$fac";
    final url1 = "https://buddies-result2.firebaseio.com/.json";
    await clearFetchResult();
    try {
      final res = await http.get(url);
      final resJson = jsonDecode(res.body);

      final res1 = await http.get(url1);
      _hits = jsonDecode(res1.body)['hits'];

      _hits += 1;

      // ignore: unused_local_variable
      final res2 = await http.put(url1, body: jsonEncode({'hits': _hits}));

      _fetchResult = resJson;
    } catch (error) {
      print(error);
      await alertDialog('Check Your Faculty Number!', context);
    }
    notifyListeners();
  }

  Future<void> nameResult(String nam, BuildContext context) async {
    final url = "https://buddiesresult2.herokuapp.com/name/$nam";
    final url1 = "https://buddies-result2.firebaseio.com/.json";

    try {
      final res = await http.get(url);
      final resJson = jsonDecode(res.body);
      // print(resJson);

      final res1 = await http.get(url1);
      _hits = jsonDecode(res1.body)['hits'];

      // print(jsonDecode(res1.body));
      _hits += 1;

      // ignore: unused_local_variable
      final res2 = await http.put(url1, body: jsonEncode({'hits': _hits}));
      // print(jsonDecode(res2.body));

      _fetchNameResult = resJson;
    } catch (error) {
      print(error);
      await alertDialog('Server Error or Check Your Entered Name!', context);
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

  void clearFetchNameResult() {
    _fetchNameResult.clear();
    notifyListeners();
  }
}
