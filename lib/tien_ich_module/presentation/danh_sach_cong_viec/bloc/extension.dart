import 'package:ccvc_mobile/tien_ich_module/domain/model/nhom_cv_moi_model.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/todo_dscv_model.dart';

import 'danh_sach_cong_viec_tien_ich_cubit.dart';

extension abc on DanhSachCongViecTienIchCubit{
  void createData (List<TodoDSCVModel> listItems ){
    for (final TodoDSCVModel e in listItems){
      mapData[e.groupId]?.items.add(e);
      if (e.inUsed ?? false  ) importance.add (e);
    }
  }

  void createView (List<TodoDSCVModel> res ){
    todoListGroup.sink.add(TodoListModelTwo.formList(res));
  }

  void createMap (List<NhomCVMoiModel> items){
    for (final  NhomCVMoiModel e in items ){
      mapData[e.id] = ItemMissionMenu(label: e.label, items: []);
      listKey.add(e.id);
    }
  }
}

class ItemMissionMenu {
  String label;
  List<TodoDSCVModel> items;

  ItemMissionMenu({this.label = '',  required this.items });
}
