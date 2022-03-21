import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/bloc/danh_ba_cubit_tree.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/tree_danh_ba.dart';
import 'package:flutter/material.dart';

class ViewTongWidget extends StatefulWidget {
  final Function() onChange;

  const ViewTongWidget({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  _ViewTongWidgetState createState() => _ViewTongWidgetState();
}

class _ViewTongWidgetState extends State<ViewTongWidget> {
  final DanhBaCubitTree _cubit = DanhBaCubitTree();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DanhBaWidget(
      cubit: _cubit,
      onChange: (value) {},
    );
  }
}
