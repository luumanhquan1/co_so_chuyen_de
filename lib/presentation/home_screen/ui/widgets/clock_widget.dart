import 'dart:async';

import 'package:flutter/material.dart';
class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 timer=Timer.periodic(const Duration(seconds: 5), (timer) {
   setState(() {

   });
 });
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return  Text(
      "${now.hour}:${now.minute}",
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          color: Color(0xff3D5586)),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
