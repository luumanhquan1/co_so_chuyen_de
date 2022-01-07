import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BanTinBtnSheet extends StatefulWidget {
  const BanTinBtnSheet({Key? key}) : super(key: key);

  @override
  _BanTinBtnSheetState createState() => _BanTinBtnSheetState();
}

class _BanTinBtnSheetState extends State<BanTinBtnSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    );
  }
}
