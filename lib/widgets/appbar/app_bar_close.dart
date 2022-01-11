

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarDefaultClose extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  AppBarDefaultClose(
      this.title, {
        Key? key,
      })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      centerTitle: true,
      title: FittedBox(
        child: Text  (
          title,
          maxLines: 1,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      elevation: 0.0,
      leading: Container(),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Color(0xffA2AEBD),
          ),
        ),
      ],
    );
  }
}