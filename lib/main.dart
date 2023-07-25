import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  int appBar = 0;
  int scaffold = 0;
  Random random = new Random();

  List<Color> colours = [
    Colors.white,
    Colors.teal,
    Colors.black,
    Colors.pinkAccent,
    Colors.red,
    Colors.purple
  ];
  List sounds = [
    "1.mp3",
    "2.mp3",
    "3.mp3",
    "4.mp3",
    "5.mp3",
    "6.mp3",
    "7.mp3",
    "8.mp3",
    "9.mp3",
    "10.mp3",
    "11.mp3",
    "12.mp3",
    "13.mp3",
    "14.mp3",
    "15.mp3",
    "16.mp3",
    "17.mp3",
    "18.mp3",
    "19.mp3",
    "20.mp3",
    "21.mp3",
    "22.mp3",
    "23.mp3",
    "24.mp3",
    "25.mp3",
    "26.mp3",
    "27.mp3",
    "28.mp3",
  ];
  final player = AudioPlayer();
  int soundPosition = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LaunchPad | Web",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: false,
            title: Text(
              "LaunchPad",
              style: GoogleFonts.orbitron(
                textStyle: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "1.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "2.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "3.mp3"),
                Pad(Color(0xffE247FC), Color(0xffA23AB7), "4.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "5.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "6.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "7.mp3"),
                Pad(Color(0xffE247FC), Color(0xffA23AB7), "8.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "9.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "10.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "11.mp3"),
                Pad(Color(0xffE247FC), Color(0xffA23AB7), "12.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "13.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "14.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "15.mp3"),
                Pad(Color(0xffE247FC), Color(0xffA23AB7), "16.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "17.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "18.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "19.mp3"),
                Pad(Color(0xffE247FC), Color(0xffA23AB7), "20.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "21.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "22.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "23.wav"),
                Pad(Color(0xffE247FC), Color(0xffA23AB7), "24.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "25.wav"),
                Pad(Color(0xffff2525), Color(0xffc40050), "26.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "27.wav"),
                Pad(Color(0xffE247FC), Color(0xffA23AB7), "28.wav"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final colorCenter;
  final colorOutline;
  final note;

  const Pad(this.colorCenter, this.colorOutline, this.note, {Key? key});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();

  @override
  void initState() {
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorOutline;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
          player.play(AssetSource(widget.note));
        });
        await Future.delayed(
          Duration(milliseconds: 500),
        );
        setState(() {
          _colorCenter = widget.colorCenter;
          _colorOutline = widget.colorOutline;
        });
      },
      child: Container(
        height: height/8.2,
        width: width/4.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            gradient: RadialGradient(
              colors: [_colorCenter, _colorOutline],
              radius: 0.5,
            ),
            boxShadow: [BoxShadow(color: Colors.pinkAccent, blurRadius: 5.0)]),
      ),
    );
  }
}
