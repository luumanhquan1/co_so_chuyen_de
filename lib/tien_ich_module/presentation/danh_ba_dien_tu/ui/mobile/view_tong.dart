import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/bloc/danh_ba_cubit_tree.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/danh_sach_model.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/tree_danh_ba.dart';
import 'package:flutter/material.dart';

class ViewTongWidget extends StatefulWidget {
  final Function(List<DanhSachModel>) onChange;

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
    _cubit.getTree();
    _cubit.listPeopleThamGia.listen((event) {
      widget.onChange(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<List<DanhSachModel>>(
          stream: _cubit.listPeopleThamGia,
          builder: (context, snapshot) {
            return DanhBaWidget(
              cubit: _cubit,
              listSelectNode: snapshot.data ?? [],
              onChange: (value) {
                _cubit.addPeopleThamGia(
                  value.map((e) => e.value).toList(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
