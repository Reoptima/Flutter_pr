import 'package:flutter/material.dart';
import 'package:flutter_pr/screen.dart';
import 'package:flutter_pr/screens/medinow.dart';
import 'package:flutter_pr/screens/meditateOfSond.dart';
import 'package:flutter_pr/screens/menu_view.dart';
import 'package:flutter_pr/screens/mindDeepRelax.dart';
import 'package:flutter_pr/screens/secretOfAtlantis.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MenuScreen(),
      //home: Medinow(),
      //home: MeditateOfSond(),
      debugShowCheckedModeBanner: false,
    );
  }
}

