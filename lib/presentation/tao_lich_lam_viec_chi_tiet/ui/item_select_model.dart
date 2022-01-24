import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ItemSelectModel {
  bool isSelect;
  String text;

  ItemSelectModel({required this.isSelect, required this.text});
}

List<ItemSelectModel> listLoaiLich = [
  ItemSelectModel(isSelect: true, text: S.current.lich_cong_tac_trong_nuoc),
  ItemSelectModel(isSelect: false, text: S.current.lich_lam_viec),
  ItemSelectModel(isSelect: true, text: S.current.lich_cong_tac_trong_nuoc),
  ItemSelectModel(isSelect: true, text: S.current.lich_cong_tac_trong_nuoc),
  ItemSelectModel(isSelect: true, text: S.current.lich_cong_tac_trong_nuoc),
];