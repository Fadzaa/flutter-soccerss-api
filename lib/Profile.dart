import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hit_api/loginForm.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (ctx) => Scaffold(
      backgroundColor: Color.fromRGBO(125, 255, 255,1),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: [
              //Circles White
              Positioned(
                  top: 0,
                  left: 0,
                  child: SvgPicture.asset("assets/circlesWhite.svg")),

              //Profile Text
              Align(
                alignment: Alignment(0.0, -0.82),
                child: Text("Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24
                  ),),
              ),

              //White Logo
              Align(
                  alignment: Alignment(0.0, -0.62),
                  child: SvgPicture.asset("assets/whiteLogo.svg",)),

              //Apple Logo
              Positioned(
                  top: 145,
                  left: 50,
                  right: 50,
                  child: SvgPicture.asset("assets/AppleLogo.svg")),

              //Name Text
              Align(
                alignment: Alignment(0.0, -0.31),
                child: Text("Fattah Anggit",
                  style: TextStyle(
                    color: Color.fromRGBO(70, 62, 62, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),),
              ),

              //Body Container
              Positioned(
                  left: 20,
                  bottom: 0,
                  child: FieldContainer(child: Text(""))
              ),

              //Change Username Function
              Align(
                alignment: Alignment(0.0,-0.075),
                child: FieldFunction(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: 'Change Username',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(64, 61, 13, 1.0),
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none),
                    )),
              ),

              //Arrow 1
              Align(
                alignment: Alignment(0.7,-0.07),
                child: SvgPicture.asset("assets/Arrow.svg"),
              ),

              //Reset Password Function
              Align(
                alignment: Alignment(0.0,0.125),
                child: FieldFunction(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: 'Reset Password',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(64, 61, 13, 1.0),
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none),
                    )),
              ),

              //Arrow 2
              Align(
                alignment: Alignment(0.7,0.12),
                child: SvgPicture.asset("assets/Arrow.svg"),
              ),

              //Email Address Function
              Align(
                alignment: Alignment(0.0,0.325),
                child: FieldFunction(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(64, 61, 13, 1.0),
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none),
                    )),
              ),

              //Arrow 3
              Align(
                alignment: Alignment(0.7,0.31),
                child: SvgPicture.asset("assets/Arrow.svg"),
              ),

              //Terms & Privacy Function
              Align(
                alignment: Alignment(0.0,0.525),
                child: FieldFunction(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: 'Terms & Prvacy',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(64, 61, 13, 1.0),
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none),
                    )),
              ),

              //Arrow 4
              Align(
                alignment: Alignment(0.7,0.49),
                child: SvgPicture.asset("assets/Arrow.svg"),
              ),

              //Logout Button
              Center(
                child: Align(
                  alignment: Alignment(-0.70, 0.84),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(100, 229, 236, 1.0),
                          minimumSize: Size(165, 50)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginForm()),
                        );
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      )),
                ),
              ),

              //Circles Blue
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset("assets/CirclesLightBlue.svg")),
            ],
          ),
        ),
      )
    ));
  }
}

class FieldContainer extends StatelessWidget {
  final Widget child;
  const FieldContainer({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
      width: size.width * 0.9,
      height: size.height * 0.6,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}

class FieldFunction extends StatelessWidget {
  final Widget child;
  const FieldFunction({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.7,horizontal: 18),
      height: size.height * 0.085,
      width: size.width * 0.8,
      decoration:BoxDecoration(
        color: Color.fromRGBO(194, 194, 194, 0.30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}