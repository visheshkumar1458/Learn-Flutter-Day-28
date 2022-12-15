// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:first_app/utils/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple[100],
      child: ListView(
        children: [
          const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Gautam Yadav"),
                accountEmail: Text("gautam.gla_csd20@gla.ac.in"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Profile.jpg")),
              )),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(CupertinoIcons.home),
            title: const Text("Home"),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.profile_circled),
            title: const Text("Your Profile"),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.profileRoute);
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.mail),
            title: const Text("Mail Me"),
            onTap: () {
              // do nothing
            },
          ),
          const Divider(),
          // const Spacer(),
          ListTile(
            onTap: (() {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushNamed(context, MyRoutes.login2Route);
            }),
            leading: const Icon(CupertinoIcons.power),
            title: const Text("Log Out"),
          )
        ],
      ),
    );
  }
}
