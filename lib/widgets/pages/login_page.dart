import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sound_bubble/models/sign_in_data.dart';

import '../app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final headerStyle = GoogleFonts.montserrat(
      color: Color(0xffdddddd),
      fontWeight: FontWeight.bold,
      fontSize: 32,
    );
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Log In", style: headerStyle),
                  Spacer(flex: 1,),
                  Image.asset("assets/images/logo.png"),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
      
                  fillColor: Color.fromARGB(255, 77, 77, 77),
                  focusColor: Colors.white,
                  filled: true,
                  hintText: "Enter Your Email",
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                onSubmitted: (login) {
                  print("Login: $login");
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
      
                  fillColor: Color.fromARGB(255, 77, 77, 77),

                  filled: true,
                  hintText: "Enter Your Password",
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                obscureText: true,
                onSubmitted: (login) {
                  print("Login: $login");
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: LoginButton(),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: SignUpButton(),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Log In"),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Color(0xff4961ca),
        textStyle: GoogleFonts.montserrat(
          fontSize: 12.8,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: Size.fromHeight(40),
        maximumSize: Size.fromHeight(40),
        primary: Colors.white,
      ),
      onPressed: () {
        appLogic.signIn(SignInData(login: "123", password: "123"));
      }
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient gr = LinearGradient(
      colors: [
        Color.fromARGB(255, 216, 124, 226),
        Color.fromARGB(255, 199, 62, 81),
      ],
      transform: GradientRotation(pi / 3)
    );
    return ElevatedButton(
      onPressed: () { },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        padding: const EdgeInsets.all(0.0),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gr,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minHeight: 40.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            'Create new account',
            style: GoogleFonts.montserrat(
              fontSize: 12.8,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

