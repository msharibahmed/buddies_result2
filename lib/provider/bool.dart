import 'package:flutter/material.dart';

class BoolCheck with ChangeNotifier {
  int _val = 1;

  int get val {
    return _val;
  }

  void valFunc(int val) {
    _val = val;
    print(_val);
    notifyListeners();
  }
}
