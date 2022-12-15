// ignore_for_file: prefer_const_constructors

import 'package:first_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              "assets/images/user.png",
              fit: BoxFit.cover,
              height: 250, 
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "User Name",
                        hintText: "Enter Your Username Here"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Enter Your Password"),
                  )
                ])),
            ElevatedButton(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(40, 15.5, 40, 15.5)),
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
