import 'package:flutter/material.dart';
import 'package:untitled/newspage.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;
  bool isPressed6 = false;
  bool isFirstTimePressed = true; // Flag to track first time press

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ഹലോ ആരോമൽ!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "നിങ്ങളുടെ താൽപ്പര്യങ്ങൾ തിരഞ്ഞെടുക്കുക",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.05, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25),
                    Wrap(
                      spacing: screenWidth * 0.02, // Responsive spacing
                      runSpacing: screenWidth * 0.03, // Responsive spacing
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        buildElevatedButton('കായികം', isPressed1, () {
                          setState(() {
                            isPressed1 = !isPressed1;
                          });
                        }),
                        buildElevatedButton('രാഷ്ട്രീയം', isPressed2, () {
                          setState(() {
                            isPressed2 = !isPressed2;
                          });
                        }),
                        buildElevatedButton('വിനോദം', isPressed3, () {
                          setState(() {
                            isPressed3 = !isPressed3;
                          });
                        }),
                        buildElevatedButton(
                            'സാങ്കേതികവിദ്യ', isPressed4, () {
                          setState(() {
                            isPressed4 = !isPressed4;
                          });
                        }),
                        buildElevatedButton('കാലാവസ്ഥ', isPressed5, () {
                          setState(() {
                            isPressed5 = !isPressed5;
                          });
                        }),
                        buildElevatedButton('ഫാഷൻ', isPressed6, () {
                          setState(() {
                            isPressed6 = !isPressed6;
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: 240),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(_createRoute());
                        },
                        child: Text(
                          'തുടരുക',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.05, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08,
                              vertical: screenWidth * 0.04),
                          side: BorderSide(color: Colors.blue, width: 2),
                          backgroundColor: Colors.lightBlue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newspage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    );
  }

  Widget buildElevatedButton(
      String text, bool isPressed, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        side: BorderSide(color: Colors.blue, width: 2),
        backgroundColor: isPressed ? Colors.blue[100] : Colors.white,

      ),
    );
  }
}
