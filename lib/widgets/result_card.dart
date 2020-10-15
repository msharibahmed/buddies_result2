import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/result.dart';
import '../provider/bool.dart';

class ResultCard extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;

  ResultCard(this.index, this.data);
  @override
  Widget build(BuildContext context) {
    final boolCheck = Provider.of<BoolCheck>(context, listen: false).val;
    final data1 = Provider.of<Result>(context, listen: false).fetchResult;

    TextStyle style() {
      return GoogleFonts.openSans();
    }

    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
                boolCheck == 1
                    ? data1['sub'][index]['code']
                    : data['sub'][index]['code'],
                style: GoogleFonts.anton(
                    textStyle: const TextStyle(fontSize: 18))),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sessionals: ' +
                      (boolCheck == 1
                          ? data1['sub'][index]['sessionals']
                          : data['sub'][index]['sessionals']),
                  style: style(),
                ),
                Text(
                    'Exam: ' +
                        (boolCheck == 1
                            ? data1['sub'][index]['exam']
                            : data['sub'][index]['exam']),
                    style: style()),
                Text(
                    'Grace: ' +
                        (boolCheck == 1
                            ? data1['sub'][index]['grace']
                            : data['sub'][index]['grace']),
                    style: style())
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    'Total: ' +
                        (boolCheck == 1
                            ? data1['sub'][index]['total']
                            : data['sub'][index]['total']),
                    style: style()),
                Text(
                    'Grade: ' +
                        (boolCheck == 1
                            ? data1['sub'][index]['grades']
                            : data['sub'][index]['grades']),
                    style: style())
              ],
            ),
            const SizedBox(height: 10),
            FittedBox(
              child: Text(
                  (boolCheck == 1
                      ? data1['sub'][index]['range']
                      : data['sub'][index]['range']),
                  style: style()),
            ),
          ],
        ),
      ),
    );
  }
}
