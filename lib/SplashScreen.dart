import 'package:flutter/material.dart';
import 'package:hit_api/registerForm.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1.0),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: [
              //Shape Circles 1
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("assets/shape1.svg"),
              ),

              //Undraw_Soccer
              Positioned(
                left: 45,
                top: 225,
                child: SvgPicture.asset("assets/Undraw_Soccer.svg"),
              ),

              // Small Middle Text
              Align(
                alignment: Alignment(0.0, 0.38),
                child: Text(
                  "Wanna know more about your Favourite \nFootball Team?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color.fromRGBO(69, 69, 69, 1.0)),
                ),
              ),

              //Big Bottom Text
              Positioned(
                  bottom: 160,
                  left: 10,
                  child: Text(
                    "Get things done with Soccers",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(69, 69, 69, 1.0),
                    ),
                  )),

              //Shape Circles 2
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset("assets/shape2.svg"),
              ),

              // Get Started Button
              Center(
                child: Align(
                  alignment: Alignment(-0.70, 0.84),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(100, 229, 236, 1.0),
                          minimumSize: Size(170, 50)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => registerForm()),
                        );
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


