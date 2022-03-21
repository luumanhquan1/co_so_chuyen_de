import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/locals/hive_local.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/home_module/domain/model/home/todo_model.dart';
import 'package:ccvc_mobile/tien_ich_module/data/request/to_do_list_request.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/nguoi_thuc_hien_model.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/tien_ich_repository.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';
import 'danh_sach_cong_viec_tien_ich_state.dart';

class DanhSachCongViecTienIchCubit
    extends BaseCubit<DanhSachCongViecTienIchState> {
  BehaviorSubject<List<bool>> selectTypeCalendarSubject =
      BehaviorSubject.seeded([true, false, false, false, false]);

  DanhSachCongViecTienIchCubit() : super(MainStateInitial());
  BehaviorSubject<bool> enabled = BehaviorSubject.seeded(true);

  Stream<bool> get getEnabled => enabled.stream;

  TienIchRepository get tienIchRep => Get.find();

  final BehaviorSubject<List<NguoiThucHienModel>> nguoiThucHien =
      BehaviorSubject<List<NguoiThucHienModel>>();

  final BehaviorSubject<WidgetType?> _showDialogSetting =
      BehaviorSubject<WidgetType?>();

  final BehaviorSubject<TodoListModel> _getTodoList =
      BehaviorSubject<TodoListModel>();

  Stream<TodoListModel> get getTodoList => _getTodoList.stream;

  void closeDialog() {
    _showDialogSetting.add(null);
  }

  void showDialog(WidgetType type) {
    if (_showDialogSetting.hasValue) {
      if (_showDialogSetting.value == type) {
        closeDialog();
      } else {
        _showDialogSetting.add(type);
      }
    } else {
      _showDialogSetting.add(type);
    }
  }

  Future<void> addTodo(String label) async {
    if (label.trim().isEmpty) {
      return;
    }
    showLoading();
    final result = await tienIchRep.createTodo(
      CreateToDoRequest(
        label: label,
        isTicked: false,
        important: false,
        inUsed: true,
      ),
    );
    await getToDoList();
    showContent();
    result.when(
      success: (res) {
        final data = _getTodoList.value;
        data.listTodoImportant.insert(
          0,
          res,
        );
        _getTodoList.sink.add(data);
      },
      error: (err) {},
    );
  }

  void tickerListWord({required TodoModel todo, bool removeDone = true}) {
    final data = _getTodoList.value;
    tienIchRep.upDateTodo(
      ToDoListRequest(
        id: todo.id,
        inUsed: true,
        important: todo.important,
        isDeleted: todo.isDeleted,
        createdOn: todo.createdOn,
        createdBy: todo.createdBy,
        isTicked: !removeDone,
        label: todo.label,
        updatedBy: HiveLocal.getDataUser()?.userInformation?.id ?? '',
        updatedOn: DateTime.now().formatApi,
      ),
    );
    if (removeDone) {
      _removeInsertImportant(data, todo);
    } else {
      _removeInsertDone(data, todo);
    }
  }

  void _removeInsertImportant(TodoListModel data, TodoModel todo) {
    final result = data.listTodoDone.removeAt(
      data.listTodoDone.indexWhere((element) => element.id == todo.id),
    );
    data.listTodoImportant.insert(0, result..isTicked = false);
    _getTodoList.sink.add(
      TodoListModel(
        listTodoImportant: data.listTodoImportant,
        listTodoDone: data.listTodoDone,
      ),
    );
  }

  void _removeInsertDone(TodoListModel data, TodoModel todo) {
    final result = data.listTodoImportant.removeAt(
      data.listTodoImportant.indexWhere((element) => element.id == todo.id),
    );

    data.listTodoDone.insert(0, result..isTicked = true);
    _getTodoList.sink.add(
      data,
    );
  }

  void deleteCongViec(TodoModel todoModel, {bool removeDone = true}) {
    final data = _getTodoList.value;
    tienIchRep.upDateTodo(
      ToDoListRequest(
        id: todoModel.id,
        inUsed: false,
        important: todoModel.important,
        isDeleted: todoModel.isDeleted,
        createdOn: todoModel.createdOn,
        createdBy: todoModel.createdBy,
        isTicked: todoModel.isTicked,
        label: todoModel.label,
        updatedBy: HiveLocal.getDataUser()?.userInformation?.id ?? '',
        updatedOn: DateTime.now().formatApi,
      ),
    );
    if (removeDone) {
      data.listTodoDone.removeAt(
        data.listTodoDone.indexWhere((element) => element.id == todoModel.id),
      );
    } else {
      data.listTodoImportant.removeAt(
        data.listTodoImportant
            .indexWhere((element) => element.id == todoModel.id),
      );
    }
    _getTodoList.sink.add(data);
  }

  void tickerQuanTrongTodo(TodoModel todo, {bool removeDone = true}) {
    final data = _getTodoList.value;
    tienIchRep.upDateTodo(
      ToDoListRequest(
        id: todo.id,
        inUsed: true,
        important: !(todo.important ?? false),
        isDeleted: todo.isDeleted,
        createdOn: todo.createdOn,
        createdBy: todo.createdBy,
        isTicked: todo.isTicked,
        label: todo.label,
        updatedBy: HiveLocal.getDataUser()?.userInformation?.id ?? '',
        updatedOn: DateTime.now().formatApi,
      ),
    );
    if (removeDone) {
      final result = data.listTodoDone.removeAt(
        data.listTodoDone.indexWhere((element) => element.id == todo.id),
      );
      data.listTodoDone
          .insert(0, result..important = !(todo.important ?? false));
    } else {
      final result = data.listTodoImportant.removeAt(
        data.listTodoImportant.indexWhere((element) => element.id == todo.id),
      );
      data.listTodoImportant
          .insert(0, result..important = !(todo.important ?? false));
    }
    _getTodoList.sink.add(data);
  }

  void changeLabelTodo(String newLabel, TodoModel todo) {
    final data = _getTodoList.value;
    if (newLabel == todo.label) {
      return;
    }
    tienIchRep.upDateTodo(
      ToDoListRequest(
        id: todo.id,
        inUsed: true,
        important: todo.important,
        isDeleted: todo.isDeleted,
        createdOn: todo.createdOn,
        createdBy: todo.createdBy,
        isTicked: todo.isTicked,
        label: newLabel,
        updatedBy: HiveLocal.getDataUser()?.userInformation?.id ?? '',
        updatedOn: DateTime.now().formatApi,
      ),
    );
    final index =
        data.listTodoImportant.indexWhere((element) => element.id == todo.id);
    final result = data.listTodoImportant.removeAt(
      index,
    );
    data.listTodoImportant.insert(0, result..label = newLabel);
    _getTodoList.sink.add(
      data,
    );
  }

  late TodoListModel dataListDefault;

  Future<void> getToDoList() async {
    showLoading();
    final result = await tienIchRep.getListTodo();
    showContent();
    result.when(
      success: (res) {
        _getTodoList.sink.add(res);
        dataListDefault = res;
      },
      error: (err) {},
    );
  }

  String dateChange = '';

  String getDate(String date) {
    dateChange = date;
    return date;
  }

  String noteChange = '';

  String getnote(String note) {
    noteChange = note;
    return note;
  }

  String titleChange = '';

  String getTitle(String title) {
    titleChange = title;
    return title;
  }

  String person = '';
  String idPerson = '';

  void getPersontodo({required String person, required String idPerson}) {
    this.person = person;
    this.idPerson = idPerson;
  }

  Future<void> editWork(TodoModel todo) async {
    await tienIchRep.upDateTodo(
      ToDoListRequest(
        id: todo.id,
        inUsed: true,
        important: todo.important,
        isDeleted: todo.isDeleted,
        createdOn: todo.createdOn,
        createdBy: todo.createdBy,
        isTicked: todo.isTicked,
        label: titleChange.isEmpty ? todo.label : titleChange,
        updatedBy: HiveLocal.getDataUser()?.userInformation?.id ?? '',
        updatedOn: DateTime.now().formatApi,
        note: noteChange.isNotEmpty ? todo.note : noteChange,
        finishDay: dateChange.isEmpty
            ? DateTime.now().formatApi
            : DateTime.parse(dateChange).formatDayCalendar,
      ),
    );
    await getToDoList();
  }

  void search(String text) {
    final data = _getTodoList.value;
    if (text != '') {
      final searchTxt = text.trim().toLowerCase().vietNameseParse();
      bool isListCanBo(TodoModel toDo) {
        return toDo.label!.toLowerCase().vietNameseParse().contains(searchTxt);
      }

      final vl = data.listTodoImportant
          .where((element) => isListCanBo(element))
          .toList();
      print(vl);
      TodoListModel todoListModel =
          TodoListModel(listTodoImportant: vl, listTodoDone: data.listTodoDone);
      _getTodoList.sink.add(todoListModel);
    } else {
      _getTodoList.sink.add(dataListDefault);
    }
  }

  void searchNguoiThucHien(String text) {
    final data = dataListNguoiThucHienModelDefault.items;
    if (text != '') {
      final searchTxt = text.trim().toLowerCase().vietNameseParse();
      bool isListNguoiThucHien(NguoiThucHienModel person) {
        return person.hoten.toLowerCase().vietNameseParse().contains(searchTxt);
      }

      final vl = data.where((element) => isListNguoiThucHien(element)).toList();
      nguoiThucHien.sink.add(vl);
    } else {
      nguoiThucHien.sink.add(dataListNguoiThucHienModelDefault.items);
    }
  }

  late ItemChonBienBanCuocHopModel dataListNguoiThucHienModelDefault;

  Future<void> listNguoiThucHien() async {
    showLoading();
    final result = await tienIchRep.getListNguoiThucHien(true, 10, 1);
    result.when(
      success: (res) {
        nguoiThucHien.sink.add(res.items);
        dataListNguoiThucHienModelDefault = res;
      },
      error: (err) {},
    );
  }
}

extension MenuDSCVEx on DanhSachCongViecTienIchCubit {}
