import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/result.dart';
import '../screens/show_result.dart';

class NameCard extends StatelessWidget {
  final int index;
  NameCard(this.index);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Result>(context, listen: false).fetchNameResult;
    TextStyle style() {
      return GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 15));
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ShowResult.routeName,
            arguments: data[index]);
      },
      child: Card(
        elevation: 10,
        shadowColor: Colors.greenAccent,
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 9,
              ),
              Text(
                data[index]['info']['name'],
                style:
                    GoogleFonts.anton(textStyle: const TextStyle(fontSize: 18)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Faculty: ' + data[index]['info']['facno'],
                    style: style(),
                  ),
                  Text(
                    'Enrollment: ' + data[index]['info']['eno'],
                    style: style(),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
