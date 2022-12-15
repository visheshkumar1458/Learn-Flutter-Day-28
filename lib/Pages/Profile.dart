import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
      ),
      body: const Material(
        child: Center(
          child: Text("From here Your will be able to alter your profile"),
        ),
      ),
    );
  }
}
