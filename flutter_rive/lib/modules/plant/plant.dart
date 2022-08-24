import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../core/utils/time_util.dart';

class PlantScreen extends StatefulWidget {
  const PlantScreen({super.key});

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<double>? _progress;
  String plantButtonText = "";

  late Timer _timer;
  int _treeProgress = 0;
  int _treeMaxProgress = 60;

  @override
  void initState() {
    super.initState();
    plantButtonText = "Plant";
    rootBundle.load('assets/tree_demo.riv').then((value) async {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(artboard, 'Grow');
      if (controller != null) {
        artboard.addController(controller);
        _progress = controller.findInput('input');
      }
      setState(() {
        _riveArtboard = artboard;
      });
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_treeProgress == _treeMaxProgress) {
        stopTimer();
        plantButtonText = "Plant";
        _treeProgress = 0;
        _treeMaxProgress = 60;
      } else {
        setState(() {
          _treeProgress++;
          _progress?.value = _treeProgress.toDouble();
        });
      }
    });
  }

  void stopTimer() {
    setState(() {
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    double treeWidth = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            "Stay Focused",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: Center(
          child: _riveArtboard == null
              ? const SizedBox()
              : Container(
                  width: treeWidth,
                  height: treeWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(treeWidth / 2),
                      border: Border.all(color: Colors.white12, width: 10)),
                  child: Rive(
                      alignment: Alignment.center, artboard: _riveArtboard!),
                ),
        )),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            intToTimeLeft(_treeMaxProgress - _treeProgress).toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            "Time left to gorw the plant",
            style: TextStyle(
                color: Colors.white60,
                fontSize: 10,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: MaterialButton(
            onPressed: () {
              if (_treeProgress > 0) {
                stopTimer();
                plantButtonText = "Plant";
                _treeProgress = 0;
                _treeMaxProgress = 60;
              } else {
                plantButtonText = "surrender";
                startTimer();
              }
            },
            splashColor: Colors.redAccent,
            height: 40.0,
            minWidth: 180.0,
            elevation: 8.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: Colors.green,
            textColor: Colors.white,
            child: Text(plantButtonText),
          ),
        )
      ]),
    );
  }
}