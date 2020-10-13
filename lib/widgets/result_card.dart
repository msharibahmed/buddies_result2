import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/result.dart';

class ResultCard extends StatelessWidget {
  final int index;
  ResultCard(this.index);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Result>(context).fetchResult;
    TextStyle style() {
      return GoogleFonts.openSans();
    }

    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shadowColor: Colors.greenAccent[400],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(data['sub'][index]['code'],
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Sessionals: ' + data['sub'][index]['sessionals'],style: style(),),
                Text('Exam: ' + data['sub'][index]['exam'],style: style()),
                Text('Grace: ' + data['sub'][index]['grace'],style: style())
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total: ' + data['sub'][index]['total'],style: style()),
                Text('Grade: ' + data['sub'][index]['grades'],style: style())
              ],
            ),
            SizedBox(height: 10),
            FittedBox(
              child: Text(data['sub'][index]['range'],style: style()),
            ),
          ],
        ),
      ),
    );
  }
}
