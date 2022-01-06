import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class MequeeWidget extends StatefulWidget {
  final List<Widget> child;
  final int spacing;
  const MequeeWidget({Key? key, required this.child, this.spacing = 0})
      : super(key: key);

  @override
  _MequeeWidgetState createState() => _MequeeWidgetState();
}

class _MequeeWidgetState extends State<MequeeWidget> {
  double offset = 0;
  double offset1 = 0;
  double widthWidget = 0;
  double sizeScreen = 0;
  GlobalKey key = GlobalKey();
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widthWidget = key.currentContext?.size?.width ?? 0;
      sizeScreen = MediaQuery.of(context).size.width;
      offset = sizeScreen;
      offset1 = offset + widthWidget + widget.spacing;

      timer = getAnimationRun();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        timer.cancel();
      },
      onLongPressEnd: (_) {
        timer = getAnimationRun();
      },
      child: Container(
        height: 60,
        color: Colors.transparent,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 20,
                left: offset == 0 ? MediaQuery.of(context).size.width : offset,
                child: Row(
                  key: key,
                  children: List.generate(
                      widget.child.length,
                      (index) => Padding(
                            padding:
                                EdgeInsets.only(right: widget.spacing + 0.0),
                            child: widget.child[index],
                          )),
                )),
            Positioned(
                top: 20,
                left: offset == 0 ? MediaQuery.of(context).size.width : offset1,
                child: Row(
                  children: List.generate(
                    widget.child.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: widget.spacing + 0.0),
                      child: widget.child[index],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Timer getAnimationRun() {
    return Timer.periodic(const Duration(milliseconds: 40), (timer) {
      offset=offset-1;
      offset1=offset1-1;
      if (offset1 < 0 && offset1 > -2) {
        offset = widthWidget + widget.spacing;
      }
      if (offset < 0 && offset > -2) {
        offset1 = widthWidget + widget.spacing;
      }

      setState(() {});
    });
  }
}
