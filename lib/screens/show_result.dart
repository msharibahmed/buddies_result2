import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/result.dart';
import '../widgets/result_card.dart';

class ShowResult extends StatelessWidget {
  static const routeName = 'show-result-screen';
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Result>(context).fetchResult;
    TextStyle style(double size) {
      return GoogleFonts.openSans(textStyle: TextStyle(fontSize: size));
    }

    // print(data['sub']);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            elevation: 10,
            backgroundColor: Colors.white,
            expandedHeight: 150,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['info']['name'],
                            style: style(20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Faculty: ' + data['info']['facno'],
                                    style: style(15),
                                  ),
                                  Text(
                                    'Enrollment: ' + data['info']['eno'],
                                    style: style(15),
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'CPI: ' + data['info']['cpi'],
                                    style: style(15),
                                  ),
                                  Text(
                                    'SPI: ' + data['info']['spi'],
                                    style: style(15),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ResultCard(index);
            },
            childCount: (data['sub'] as List).length,
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.arrow_back, color: Colors.greenAccent),
          label: Text(
            'Go Back',
            style: TextStyle(color: Colors.greenAccent),
          ),
          backgroundColor: Colors.black,
          elevation: 5,
          onPressed: () {
            Navigator.pop(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
