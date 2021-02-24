import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/constants.dart';

class ResultCard extends StatelessWidget {
  final int index;
  final List<dynamic> subList;

  ResultCard(this.index, this.subList);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(subList[index]['code'],
                style: GoogleFonts.anton(
                    textStyle: const TextStyle(fontSize: 18))),
            Constants().sz(h: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sessionals: ' + (subList[index]['sessionals']),
                  style: Constants().style(),
                ),
                Text('Exam: ' + (subList[index]['exam']),
                    style: Constants().style()),
                Text('Grace: ' + (subList[index]['grace']),
                    style: Constants().style())
              ],
            ),
            Constants().sz(h: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total: ' + (subList[index]['total']),
                    style: Constants().style()),
                Text('Grade: ' + (subList[index]['grades']),
                    style: Constants().style())
              ],
            ),
            Constants().sz(h: 10),
            FittedBox(
              child:
                  Text((subList[index]['range']), style: Constants().style()),
            ),
          ],
        ),
      ),
    );
  }
}
