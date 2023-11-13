import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String hexColorCode = "#1E2831";
Color appBarColor = hexToColor(hexColorCode);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height / 4,
          child: Container(
            color: appBarColor,
          ),
        ),
        Positioned(
          top: 67.09,
          left: 0,
          right: 0,
          height: 44,
          child: Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.white),
              SizedBox(width: 115),
              Text(
                'Country Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 111.09,
          left: 0,
          right: 0,
          height: 40,
          child: Container(
            color: appBarColor,
            child: Center(
              child: Text(
                'India',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Zen Antique',
                ),
              ),
            ),
          ),
        ),
        // Card Carousel
        Positioned(
          top: 160.0,
          left: 0,
          right: 0,
          height: 250.0,
          child: CardCarousel(),
        ),
      ],
    );
  }
}

class CardCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0,),
          width: 342.0,
          height: 772.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20.0,
                left: 20.0,
                child: Text(
                  'Latitude',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Container(
                  color: appBarColor,
                  child: Center(
                    child: TextButton(
                      onPressed: () async {
                        const url = 'https://en.wikipedia.org/wiki/India';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        'WIKIPEDIA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
