import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultCard extends StatelessWidget {
  final int index;
  final List<dynamic> subList;

  ResultCard(this.index, this.subList);
  @override
  Widget build(BuildContext context) {
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
            Text(subList[index]['code'],
                style: GoogleFonts.anton(
                    textStyle: const TextStyle(fontSize: 18))),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sessionals: ' + (subList[index]['sessionals']),
                  style: style(),
                ),
                Text('Exam: ' + (subList[index]['exam']), style: style()),
                Text('Grace: ' + (subList[index]['grace']), style: style())
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total: ' + (subList[index]['total']), style: style()),
                Text('Grade: ' + (subList[index]['grades']), style: style())
              ],
            ),
            const SizedBox(height: 10),
            FittedBox(
              child: Text((subList[index]['range']), style: style()),
            ),
          ],
        ),
      ),
    );
  }
}
