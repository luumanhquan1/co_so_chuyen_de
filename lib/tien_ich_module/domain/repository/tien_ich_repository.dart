import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/home_module/domain/model/home/todo_model.dart';
import 'package:ccvc_mobile/tien_ich_module/data/request/to_do_list_request.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/nguoi_thuc_hien_model.dart';

import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';

mixin TienIchRepository {
  Future<Result<List<TopicHDSD>>> getTopicHDSD();

  Future<Result<TodoListModel>> getListTodo();

  Future<Result<TodoModel>> upDateTodo(ToDoListRequest toDoListRequest);

  Future<Result<TodoModel>> createTodo(CreateToDoRequest createToDoRequest);

  Future<Result<ItemChonBienBanCuocHopModel>> getListNguoiThucHien(
    bool isGetAll,
    int pageSize,
    int pageIndex,
  );
}
