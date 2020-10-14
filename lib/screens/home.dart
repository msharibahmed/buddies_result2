import 'package:buddies_result2/provider/result.dart';
import 'package:buddies_result2/screens/show_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'developer_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
     Provider.of<Result>(context, listen: false).fetchHits();
    super.initState();
  }

  var _boolCheck = true;
  final textCtrl = TextEditingController();
  String errorText = '';
  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<Result>(context).fetchResult['info'];
    // data = null;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          icon: Icon(Icons.info, color: Colors.greenAccent),
          elevation: 5,
          onPressed: () {
            Navigator.pushNamed(context, DeveloperScreen.routeName);
          },
          label: Text('About Developer',
              style: TextStyle(color: Colors.greenAccent))),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Buddies Result 2.0',
            style: TextStyle(color: Colors.greenAccent)),
        centerTitle: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Align(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
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
            SizedBox(height: 10),
            Text(
              'THANK YOU FOR YOUR OVERWHELMING RESPONSE!',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 65,
              child: TextField(
                maxLength: 8,
                decoration: InputDecoration(
                  errorText: errorText,
                  hintText: 'Enter Faculty Number',
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
            SizedBox(height: 5),
            Consumer<Result>(
                builder: (context, data, chld) => CupertinoButton(
                      color: Colors.black,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (textCtrl.text.isEmpty) {
                          setState(() {
                            errorText = 'Enter Faculty Number';
                          });
                        } else if (textCtrl.text.length != 8 &&
                            textCtrl.text.isNotEmpty) {
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
                          await data
                              .result(textCtrl.text.toUpperCase(), context)
                              .then((_) {
                            setState(() {
                              _boolCheck = true;
                            });
                          }).then((_) {
                            if (data.fetchResult['info'] == null ||
                                data.fetchResult['sub'] == null) {
                              return;
                            } else {
                              Navigator.pushNamed(
                                  context, ShowResult.routeName);
                            }
                          });
                        }
                      },
                      child: _boolCheck
                          ? Text('Search',
                              style: TextStyle(color: Colors.greenAccent))
                          : CircularProgressIndicator(
                              backgroundColor: Colors.greenAccent),
                    )),
          ],
        ),
      ),
    );
  }
}
