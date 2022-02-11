import 'package:flutter/material.dart';

class FollowKeyBoardWidget extends StatelessWidget {
  final Widget child;
  const FollowKeyBoardWidget({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: child,
    );
  }
}
