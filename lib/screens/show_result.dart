import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/result.dart';
import '../widgets/result_card.dart';

class ShowResult extends StatelessWidget {
  static const routeName = 'show-result-screen';
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Result>(context, listen: false).fetchResult;
    // print(data['sub']);

    TextStyle style(double size) {
      return GoogleFonts.openSans(textStyle: TextStyle(fontSize: size));
    }

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            elevation: 10,
            backgroundColor: Colors.greenAccent,
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
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            data['info']['name'],
                            style: style(20),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Expanded(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Faculty: ' + (data['info']['facno']),
                                    style: style(15),
                                  ),
                                  Text(
                                    'Enrollment: ' + (data['info']['eno']),
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
                                    'CPI: ' + (data['info']['cpi']),
                                    style: style(15),
                                  ),
                                  Text(
                                    'SPI: ' + (data['info']['spi']),
                                    style: style(15),
                                  )
                                ]),
                          ),
                          const Divider(color: Colors.black, indent: 0),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ResultCard(index, data['sub'] as List<dynamic>);
            },
            childCount: data['sub'].length,
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
          label: const Text(
            'Go Back',
            style: const TextStyle(color: Colors.greenAccent),
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
