import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'developer_screen.dart';
import '../provider/bool.dart';
import '../provider/result.dart';
import '../screens/name_screen.dart';
import '../screens/show_result.dart';

class Home extends StatefulWidget {
  static const routeName = 'home-screen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    final data = Provider.of<Result>(context, listen: false);
    data.fetchHits();

    super.initState();
  }

  Future<void> facSearch() async {
    final data = Provider.of<Result>(context, listen: false);

    FocusScope.of(context).unfocus();

    if (textCtrl.text.isEmpty) {
      setState(() {
        errorText = 'Enter Faculty Number';
      });
    } else if (textCtrl.text.length != 8 && textCtrl.text.isNotEmpty) {
      setState(() {
        errorText = 'Enter valid Faculty Number';
      });
    } else {
      setState(() {
        errorText = '';
      });
      setState(() {
        _boolCheck = false;
      });
      await data.result(textCtrl.text.toUpperCase(), context).then((_) {
        setState(() {
          _boolCheck = true;
        });
      }).then((_) async {
        if (data.fetchResult.isEmpty) {
          // print('object');
          await data.alertDialog('Check You Entered Faculty Number.', context);
          return;
        } else {
          Provider.of<BoolCheck>(context, listen: false).valFunc(_value);

          Navigator.pushNamed(context, ShowResult.routeName);
          textCtrl.clear();
        }
      });
    }
  }

  Future<void> nameSearch() async {
    final data = Provider.of<Result>(context, listen: false);

    FocusScope.of(context).unfocus();

    if (textCtrl.text.isEmpty) {
      setState(() {
        nameErrorText = 'Enter Name';
      });
    } else if (!textCtrl.text.contains(RegExp(r'[A-Za-z]')) &&
        textCtrl.text.isNotEmpty) {
      setState(() {
        nameErrorText = 'Enter valid Name';
      });
    } else {
      setState(() {
        nameErrorText = '';
      });
      setState(() {
        _boolCheck = false;
      });
      await data.nameResult(textCtrl.text, context).then((_) {
        setState(() {
          _boolCheck = true;
        });
      }).then((_) {
        if (data.fetchNameResult.isEmpty) {
          // print('object');
          data.alertDialog(
              "Couln't Find Any Name Matching To The Entered Name.", context);
          return;
        } else {
          Provider.of<BoolCheck>(context, listen: false).valFunc(_value);

          Navigator.pushNamed(context, NameScreen.routeName);
          textCtrl.clear();
        }
      });
    }
  }

  var _boolCheck = true;
  var _value = 1;

  final textCtrl = TextEditingController();
  String errorText = '';
  String nameErrorText = '';
  @override
  Widget build(BuildContext context) {
    const name = ['By Faculty Number', 'By Name'];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          icon: const Icon(Icons.info, color: Colors.greenAccent),
          elevation: 5,
          onPressed: () {
            Navigator.pushNamed(context, DeveloperScreen.routeName);
          },
          label: const Text('About Developer',
              style: const TextStyle(color: Colors.greenAccent))),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Buddies Result 2.0',
            style: const TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.w300,
                letterSpacing: 1)),
        centerTitle: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'TOTAL HITS',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 10),
            Consumer<Result>(
              builder: (context, data, _) => Text(data.hits.toString(),
                  style: GoogleFonts.anton(
                      textStyle: TextStyle(
                          letterSpacing: 2,
                          foreground: Paint()
                            ..color = Colors.black
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.0,
                          fontSize: 20))),
            ),
            const SizedBox(height: 10),
            const Text(
              'THANK YOU FOR YOUR OVERWHELMING RESPONSE!',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 65,
              child: TextField(
                maxLength: _value == 1 ? 8 : null,
                decoration: InputDecoration(
                  errorText: _value == 1 ? errorText : nameErrorText,
                  hintText: _value == 1 ? 'Enter Faculty Number' : 'Enter Name',
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                ),
                controller: textCtrl,
              ),
            ),
            const SizedBox(height: 5),
            Consumer<Result>(
                builder: (context, data, chld) => CupertinoButton(
                      color: Colors.black,
                      onPressed: _value == 1 ? facSearch : nameSearch,
                      child: _boolCheck
                          ? const Text('Search',
                              style: const TextStyle(color: Colors.greenAccent))
                          : CircularProgressIndicator(
                              backgroundColor: Colors.greenAccent),
                    )),
            // Text('Search:',style: TextStyle(fontSize: 15),),
            const SizedBox(
              height: 50,
            ),
            for (int i = 1; i <= 2; i++)
              ListTile(
                title: Text(name[i - 1]),
                leading: Radio(
                  value: i,
                  groupValue: _value,
                  activeColor: Colors.greenAccent,
                  onChanged: (int value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
