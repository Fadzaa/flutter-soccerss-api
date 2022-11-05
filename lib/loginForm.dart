import 'package:flutter/material.dart';
import 'package:hit_api/Profile.dart';
import 'package:hit_api/listFootball.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hit_api/navigationBar.dart';

class loginForm extends StatefulWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  final formKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwordController = TextEditingController();

@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();

  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _ScaffoldKey= GlobalKey<ScaffoldState>();
    return Builder(
        builder: (ctx) => Scaffold(
          key: _ScaffoldKey,
          body: SingleChildScrollView(
            child: Form(
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

                    //Login Text
                    Align(
                      alignment: Alignment(0.1, -0.55),
                      child: Text(
                        "Hello Again!",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(68, 66, 66, 1.0),
                          fontSize: 32,
                        ),
                      ),
                    ),

                    //Login Image
                    Positioned(
                        top: -5,
                        bottom: 105,
                        right: 45,
                        left: 55,
                        child: SvgPicture.asset("assets/undraw_login.svg")),

                    //Email Form
                    Align(
                      alignment: Alignment(0.0, 0.275),
                      child: TextFieldContainer(
                        child: TextFormField(
                          controller: emailController,
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
                        ),
                      ),
                    ),

                    //Password Form
                    Align(
                      alignment: Alignment(0.0, 0.5),
                      child: TextFieldContainer(
                          child: TextFormField(
                            controller: passwordController,
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

                    //Forgot Password?
                    Positioned(
                      bottom: 133,
                      left: 50,
                      right: 50,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromRGBO(42, 194, 202, 1.0)),
                        ),
                      ),
                    ),

                    //Login Button
                    Center(
                      child: Align(
                        alignment: Alignment(-0.70, 0.855),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(100, 229, 236, 1.0),
                                minimumSize: Size(170, 50)),
                            onPressed: () {
                              if(formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => navigationBar()),
                                );
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 20,
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
        ),
    );
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

// Future signIn() async {
//   await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: emailController.text.trim(),
//     password: passwordController.text.trim(),
//   );
// }
