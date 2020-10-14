import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  static const routeName = 'developer-screen';
  _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: Text('Error Occured!'),
                // content: Text('Couln\'t Launch The URL'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OKAY', style: TextStyle(color: Colors.red)),
                  )
                ],
              ));
    }
  }

  SizedBox sb([double h = 0, double w = 0]) => SizedBox(
        height: h,
        width: w,
      );
  GestureDetector gd(BuildContext context, String url, String imagePath) =>
      GestureDetector(
        onTap: () {
          _launchURL(context, url);
        },
        child: CircleAvatar(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
            backgroundColor: Colors.white),
      );
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
      
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[200],
        title: const Text(
          'ABOUT DEVELOPER',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.green[200],
          ),
          height: mediaQuery.height,
          width: mediaQuery.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: mediaQuery.height * 0.34,
                      child: FlareActor(
                        'assets/images/hello.flr',
                        animation: 'idle',
                        fit: BoxFit.contain,
                      )),
                  SizedBox(
                    height: mediaQuery.height * 0.175 - 32,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Text(
                        'Sharib Ahmed',
                        style: GoogleFonts.anton(
                            textStyle: const TextStyle(fontSize: 25)),
                      )),
                  Text(
                      'B.Tech  Electrical  Engineering \'22' +
                          '\n' +
                          'ZHCET, Aligarh Muslim University',
                      style: GoogleFonts.openSans(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w500))),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: CupertinoButton.filled(
                      child: const Text('Developer Request'),
                      onPressed: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (ctx) => CupertinoAlertDialog(
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Close',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        _launchURL(context,
                                            'https://www.linkedin.com/in/sharib-ahmed-b3b930174/');
                                      },
                                      child: const Text('Open Linkedin',
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  ],
                                  content: const Text(
                                      'If You Like This App Then Endorse The Developer on Linked In.'),
                                ));
                      },
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Mail for any queries related to app:',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        GestureDetector(
                          onTap: () {
                            _launchURL(context,
                                'mailto:msharibahmed@gmail.com?subject=Regarding%20a%20query%20in%20zfr%20inventory%20app.&body=Please%20write%20the%20query.');
                          },
                          child: CircleAvatar(
                              child: Image.asset(
                                'assets/images/gmail.png',
                                fit: BoxFit.contain,
                              ),
                              backgroundColor: Colors.green[200]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                width: mediaQuery.width - 32,
                top: mediaQuery.height * 0.31 - 32,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      gd(
                          context,
                          'https://www.linkedin.com/in/sharib-ahmed-b3b930174/',
                          'assets/images/linkedin.png'),
                      gd(context, 'https://www.instagram.com/i._.m._.sharib/',
                          'assets/images/instagram.png'),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Colors.black,
                          child: Image.asset(
                            'assets/images/s.jpg',
                            fit: BoxFit.contain,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      gd(context, 'https://www.facebook.com/MSharib786',
                          'assets/images/facebook.png'),
                      gd(context, 'https://github.com/msharibahmed',
                          'assets/images/github.png')
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
