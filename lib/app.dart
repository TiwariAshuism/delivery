import 'package:delivery/screens/boarding/title_page/titlepage.dart';
import 'package:delivery/screens/sign_in/loading_page.dart';
import 'package:delivery/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  final User? user;

  App(this.user);
  // const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Delievry",
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: user != null ? TitlePage() : AddLoadingPage(), //AddLoadingPage(),
    );
  }
}
