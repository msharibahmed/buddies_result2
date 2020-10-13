import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Hello world'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.6,
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(b,BorderSide borderSide = const BorderSide(),
               BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)), double gapPadding = 4.0),
              hintText: 'Enter Faculty Number'
            ),

            controller: TextEditingController(),
            


          ),
        ),
      ),
    );
  }
}
