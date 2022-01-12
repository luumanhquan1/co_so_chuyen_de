import 'dart:developer';

import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollBarWidget extends StatefulWidget {
  final List<Widget> children;
  const ScrollBarWidget({Key? key, required this.children}) : super(key: key);

  @override
  State<ScrollBarWidget> createState() => _ScrollBarWidgetState();
}

class _ScrollBarWidgetState extends State<ScrollBarWidget> {
  final ScrollController scrollController = ScrollController();
  GlobalKey key = GlobalKey();
  double _alignmentY = -1;
  bool isShowScrollBar = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: false,
      thickness: 6,
      radius: const Radius.circular(12),
      child: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}
