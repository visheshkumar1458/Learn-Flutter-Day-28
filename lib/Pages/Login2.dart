import 'package:flutter/material.dart';

import '../utils/MyRoutes.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  String _name = "";
  bool _pressedbutton = false;
  final _formkey = GlobalKey<FormState>();

  moveFromHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _pressedbutton = true;
      });
      await Future.delayed(const Duration(milliseconds: 800));
      Navigator.pop(context);
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        _pressedbutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      // ignore: prefer_const_constructors
      body: Material(
        color: Theme.of(context).canvasColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.fill,
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome  $_name",
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          _name = value;
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            labelText: "User Name",
                            hintText: "Enter Your Username Here"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User Name Can't be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Your Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Password is too short";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            BorderRadius.circular(_pressedbutton ? 60 : 8),
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            moveFromHome(context);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 750),
                            height: _pressedbutton ? 60 : 60,
                            width: _pressedbutton ? 60 : 150,
                            alignment: Alignment.center,
                            child: _pressedbutton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 50,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
