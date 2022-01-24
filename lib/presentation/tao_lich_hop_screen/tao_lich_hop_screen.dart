import 'package:ccvc_mobile/presentation/them_don_vi_screen/them_don_vi_screen.dart';
import 'package:flutter/material.dart';

class TaoLichHopScreen extends StatefulWidget {
  const TaoLichHopScreen({Key? key}) : super(key: key);

  @override
  _TaoLichHopScreenState createState() => _TaoLichHopScreenState();
}

class _TaoLichHopScreenState extends State<TaoLichHopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          ThemDonViScreen(),
        ],
      ),
    );
  }
}
