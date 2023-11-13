import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screen3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String hexColorCode = "#1E2831";
    Color appBarColor = hexToColor(hexColorCode);

    return MaterialApp(
      home: Scaffold(
        body: MyStack(appBarColor: appBarColor),
      ),
    );
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

class MyStack extends StatefulWidget {
  final Color appBarColor;

  MyStack({required this.appBarColor});

  @override
  _MyStackState createState() => _MyStackState();
}

class _MyStackState extends State<MyStack> {
  List<bool> bookmarkStates = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height / 4,
          child: Container(
            color: widget.appBarColor,
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
            color: widget.appBarColor,
            child: Center(
              child: Text(
                'India',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Zen antique',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 84,
          height: 185,
          child: Container(
            color: widget.appBarColor,
          ),
        ),
        Positioned(
          top: 160,
          left: 28,
          right: 28,
          height: 222,
          child: Container(
            margin: EdgeInsets.only(top: 33),
            color: widget.appBarColor,
            child: Image.asset(
              'assets/Details.png',
              alignment: Alignment.center,
            ),
          ),
        ),
        Positioned(
          top: 409,
          left: 32.5,
          child: Row(
            children: [
              Text(
                'Code',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 27,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 409,
          left: 166.5,
          child: Row(
            children: [
              Text(
                'Capital',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 27,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 408.99,
          left: 370,
          child: Row(
            children: [
              Text(
                'ISD',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 27,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 445,
          left: 53,
          child: Row(
            children: [
              Text(
                'IN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 445,
          left: 161.5,
          child: Row(
            children: [
              Text(
                'New Delhi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 445,
          left: 370,
          child: Row(
            children: [
              Text(
                '+91',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 497,
          height: 57,
          left: 147.5,
          child: Container(
            color: widget.appBarColor,
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
        Positioned(
          top: 581,
          width: 74,
          height: 36,
          left: 170,
          child: Container(
            child: Center(
              child: Text(
                'CITIES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 621,
          height: 60,
          left: 40,
          width: 353.92,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search country',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
            ),
            onChanged: (text) {},
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 200,
          child: Container(
            color: Colors.white,
            child: Column(
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: Container(
                    width: 354.89,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mumbai',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            bookmarkStates[index]
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              bookmarkStates[index] = !bookmarkStates[index];
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
