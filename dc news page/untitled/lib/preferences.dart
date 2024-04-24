import 'package:flutter/material.dart';
import 'package:untitled/newspage.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  List<String> interests = ['കായികം', 'രാഷ്ട്രീയം','വിനോദം','സാങ്കേതികവിദ്യ', 'കാലാവസ്ഥ', 'ഫാഷൻ','യാത്ര','ആരോഗ്യം','ബിസിനസ്സ്','വിദ്യാഭ്യാസം','നാട്ടു','കുറ്റകൃത്യവും നീതിയും' ];
  List<bool> isPressedList = List.filled(12, false);
  List<String> selectedInterests = []; //-----list of preferences stored in this when clicked ----
  bool isFirstTimePressed = true; // Flag to track first time press

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                    SizedBox(height: screenHeight*0.05),
                    Wrap(
                      spacing: screenWidth * 0.02, // Responsive spacing
                      runSpacing: screenWidth * 0.03, // Responsive spacing
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        interests.length,
                            (index) => buildElevatedButton(
                          interests[index],
                          isPressedList[index],
                              () {
                            setState(() {
                              isPressedList[index] = !isPressedList[index];
                              if (isPressedList[index]) {
                                selectedInterests.add(interests[index]);
                              } else {
                                selectedInterests.remove(interests[index]);
                              }
                            });
                          },
                        ),
                      ),

                    ),
                    SizedBox(height: screenHeight*0.17),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(_createRoute());
                          //----------code to push list of preference to backend not yet added---------

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
