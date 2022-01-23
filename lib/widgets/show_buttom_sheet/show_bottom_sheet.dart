import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:flutter/material.dart';

void showBottomSheetCustom(BuildContext context,{required Widget child}) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    clipBehavior: Clip.hardEdge,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          lineContainer(),
          child
        ],
      );
    },
  );
}

Widget lineContainer() {
  return Container(
    height: 6,
    width: 48,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: lineColor,
    ),
  );
}
