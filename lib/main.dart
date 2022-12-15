import 'package:first_app/Pages/Home.dart';
import 'package:first_app/Pages/Login.dart';
import 'package:first_app/Pages/Profile.dart';
import 'package:first_app/Pages/cart_page.dart';
import 'package:first_app/core/store.dart';
import 'package:first_app/utils/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/Login2.dart';
import 'package:first_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      // theme: MyThemes.darkTheme(context),
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      debugShowCheckedModeBanner: false,
      // initialRoute: MyRoutes.login2Route,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const Home(),
        MyRoutes.loginRoute: (context) => const Login(),
        MyRoutes.login2Route: (context) => const Login2(),
        MyRoutes.profileRoute: (context) => const MyProfile(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
