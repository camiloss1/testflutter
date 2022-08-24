import 'package:flutter/material.dart';
import 'package:flutter_rive/modules/plant/plant.dart';

import 'core/utils/color_util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  HexColor("7f00b2").withOpacity(0.7),
                  HexColor("8e22bb").withOpacity(0.5),
                  HexColor("ab49cc").withOpacity(0.4)
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: const [0.0, 0.5, 1.0],
                tileMode: TileMode.clamp)),
        child: const PlantScreen(),
      ),
    );
  }
}
