import 'dart:developer';

import 'package:ccvc_mobile/widgets/textformfield/form_group.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
import 'package:flutter/material.dart';

class ABC extends StatefulWidget {
  const ABC({Key? key}) : super(key: key);

  @override
  _ABCState createState() => _ABCState();
}

class _ABCState extends State<ABC> {
  final GlobalKey<FormGroupState> key = GlobalKey<FormGroupState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormGroup(
        key: key,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            TextFieldValidator(
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return "2342342";
                }
                return null;
              },
            ),
            TextFieldValidator(
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return "2342342";
                }
                return null;
              },
            ),
            GestureDetector(
                onTap: () {
                 log('${ key.currentState?.checkValidator()}');
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                )),
            GestureDetector(
                onTap: () {
                  log('${ key.currentState?.validator()}');
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
