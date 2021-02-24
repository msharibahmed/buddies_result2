import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'developer_screen.dart';
import '../provider/result.dart';
import '../screens/show_result.dart';
import '../helper/constants.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _boolCheck = true; //search button loading condition

  @override
  void initState() {
    //fetching search hit counts
    final data = Provider.of<Result>(context, listen: false);
    data.fetchHits();

    super.initState();
  }

//textfield controllers
  var facultyTfCtrl = TextEditingController();
  var enrollmentTfCtrl = TextEditingController();

//textfield errortexts
  var _facultyErrorText = '';
  var _enrollmentErrorText = '';

  //
  Future<void> _search() async {
    final data = Provider.of<Result>(context, listen: false);

    FocusScope.of(context).unfocus();

    if (facultyTfCtrl.text.isEmpty) {
      setState(() {
        _facultyErrorText = 'Enter Faculty Number';
      });
      return;
    } else if (facultyTfCtrl.text.trim().length != 8 &&
        facultyTfCtrl.text.isNotEmpty) {
      setState(() {
        _facultyErrorText = 'Enter valid Faculty Number';
      });
      return;
    } else {
      setState(() {
        _facultyErrorText = '';
      });
    }
    if (enrollmentTfCtrl.text.isEmpty) {
      setState(() {
        _enrollmentErrorText = 'Enter Enrollment Number';
      });
      return;
    } else if (enrollmentTfCtrl.text.trim().length != 6 &&
        enrollmentTfCtrl.text.isNotEmpty) {
      setState(() {
        _enrollmentErrorText = 'Enter valid Enrollment Number';
      });
      return;
    } else {
      setState(() {
        _enrollmentErrorText = '';
      });
      setState(() {
        _boolCheck = false;
      });
      await data
          .result(facultyTfCtrl.text.toUpperCase(),
              enrollmentTfCtrl.text.toUpperCase(), context)
          .then((_) {
        setState(() {
          _boolCheck = true;
        });
      }).then((_) {
        if (data.fetchResult['sub'].length == 0) {
          return data.alertDialog('Student record not found!', context);
        } else {
          Navigator.pushNamed(context, ShowResult.routeName);
        }

        facultyTfCtrl.clear();
        enrollmentTfCtrl.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Buddies Result 2.0',
              style: const TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1)),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.developer_mode,
                color: Colors.greenAccent,
              ),
              onPressed: () {
                Navigator.pushNamed(context, DeveloperScreen.routeName);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
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
                Constants().sz(h: 10),
                const Text(
                  'THANK YOU FOR YOUR OVERWHELMING RESPONSE!',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: mq.width * 0.7,
                  child: TextField(
                      controller: facultyTfCtrl,
                      // maxLength: 8,
                      maxLengthEnforced: true,
                      decoration: Constants().decoration(
                          'Enter Faculty Number', _facultyErrorText)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: mq.width * 0.7,
                  child: TextField(
                      controller: enrollmentTfCtrl,
                      // maxLength: 6,
                      decoration: Constants().decoration(
                          'Enter Enrollment Number', _enrollmentErrorText)),
                ),
                const SizedBox(height: 20),
                Consumer<Result>(
                    builder: (context, data, chld) => CupertinoButton(
                          color: Colors.black,
                          onPressed: _search,
                          child: _boolCheck
                              ? const Text('Search',
                                  style: const TextStyle(
                                      color: Colors.greenAccent))
                              : CircularProgressIndicator(
                                  backgroundColor: Colors.greenAccent),
                        )),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
