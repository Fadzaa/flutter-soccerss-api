import 'package:flutter/material.dart';
import 'package:hit_api/listFootball.dart';
import 'package:hit_api/loginForm.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hit_api/navigationBar.dart';

class registerForm extends StatefulWidget {
  const registerForm({Key? key}) : super(key: key);

  @override
  State<registerForm> createState() => _registerFormState();

}

class _registerFormState extends State<registerForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (ctx) => Scaffold(
      body: SingleChildScrollView(
        child :Form(
          key: formKey,
            child: Container(
              width: double.infinity,
              height: size.height,
              child: Stack(
                children: [
                  //Shape1
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      "assets/shape1.svg",
                      width: size.width * 0.5,
                    ),
                  ),

                  //Register Text
                  Center(
                    child: Align(
                      alignment: Alignment(0.5, -0.5),
                      child: Text(
                        "Let's Begin with Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Color.fromRGBO(68, 66, 66, 1.0)),
                      ),
                    ),
                  ),

                  //Form Name
                  Align(
                    alignment: Alignment(0.0, -0.28),
                    child: TextFieldContainer(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Enter your Full Name',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(64, 61, 13, 1.0),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name can't be empty";
                            }
                            return null;
                          },
                        )),
                  ),

                  //Form Email
                  Align(
                    alignment: Alignment(0.0, -0.05),
                    child: TextFieldContainer(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Enter your Email',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(64, 61, 13, 1.0),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email can't be empty";
                            }
                            return null;
                          },
                        )),
                  ),

                  //Form Password
                  Align(
                    alignment: Alignment(0.0, 0.18),
                    child: TextFieldContainer(
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Enter your Password',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(64, 61, 13, 1.0),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password can't be empty";
                            }
                            return null;
                          },
                        )),
                  ),

                  //Confirm Password
                  Align(
                    alignment: Alignment(0.0, 0.41),
                    child: TextFieldContainer(
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Confirm your Password',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(64, 61, 13, 1.0),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirm your password";
                            }
                            return null;
                          },
                        )),
                  ),

                  //Small Text & Text Button
                  Positioned(
                    bottom: 170,
                    left: 90,
                    child: Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(69, 69, 69, 1.0)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).push(MaterialPageRoute(
                                builder: (ctx) => loginForm()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color.fromRGBO(42, 194, 202, 1.0)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Button
                  Center(
                    child: Align(
                      alignment: Alignment(-0.72, 0.8),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                              Color.fromRGBO(100, 229, 236, 1.0),
                              minimumSize: Size(170, 50)),
                          onPressed: () {
                            if(formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => navigationBar()),
                              );
                            };
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ),

                  //Shape2
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      "assets/shape2.svg",
                      width: size.width * 0.40,
                    ),
                  ),
                ],
              ),
            ),
        )
      ),
    ));
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 25),
      height: size.height * 0.082,
      width: size.width * 0.8,
      decoration:BoxDecoration(
        color: Color.fromRGBO(194, 194, 194, 0.30),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
