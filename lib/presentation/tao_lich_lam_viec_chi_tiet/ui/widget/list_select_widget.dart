import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/item_select_model.dart';
import 'package:flutter/cupertino.dart';

class ListSelectWidget extends StatelessWidget {
  final List<ItemSelectModel> listData;
  final Widget widget;

  const ListSelectWidget(
      {Key? key, required this.listData, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: listData.map((e) => widget).toList(),
      ),
    );
  }
}
