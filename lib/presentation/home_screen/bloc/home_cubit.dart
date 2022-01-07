import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/domain/model/home/press_network_model.dart';
import 'package:ccvc_mobile/domain/model/home/tinh_huong_khan_cap_model.dart';
import 'package:ccvc_mobile/domain/model/home/todo_model.dart';
import 'package:ccvc_mobile/domain/model/user_infomation_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_state.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:rxdart/rxdart.dart';

class HomeCubit extends BaseCubit<HomeState>{
  HomeCubit() : super(MainStateInitial());

  final BehaviorSubject<HomeItemType?> _showDialogSetting =
      BehaviorSubject<HomeItemType?>();
  final BehaviorSubject<List<TinhHuongKhanCapModel>> _tinhHuongKhanCap =
      BehaviorSubject<List<TinhHuongKhanCapModel>>();
  final BehaviorSubject<UserInformationModel> _userInformation =
      BehaviorSubject<UserInformationModel>();
  final BehaviorSubject<DocumentDashboardModel> _getDocumentVBDen =
      BehaviorSubject<DocumentDashboardModel>();
  final BehaviorSubject<DocumentDashboardModel> _getDocumentVBDi =
      BehaviorSubject<DocumentDashboardModel>();
  final BehaviorSubject<TodoListModel> _getTodoList =
      BehaviorSubject<TodoListModel>();
  final BehaviorSubject<List<PressNetWorkModel>> _getPressNetWork =
      BehaviorSubject<List<PressNetWorkModel>>();
  final BehaviorSubject<List<TagModel>> _getTag =
      BehaviorSubject<List<TagModel>>();
  final BehaviorSubject<bool> _showAddTag=BehaviorSubject<bool>();



  void _getTinhHuongKhanCap() {
    _tinhHuongKhanCap.sink.add(FakeData.tinhKhanCap);
  }

  void showDialog(HomeItemType? type) {
    _showDialogSetting.add(type);
  }

  Future<void> getDocument() async {
    await Future.delayed(const Duration(seconds: 10));
    _getDocumentVBDen.sink.add(FakeData.tinhHinhXuLyDocVBDen);
    _getDocumentVBDi.sink.add(FakeData.tinhHinhXuLyDocVBDi);
  }

  void loadApi() {
    _getTinhHuongKhanCap();
  }

  void dispose() {
    _showDialogSetting.close();
    _tinhHuongKhanCap.close();
    _getTodoList.close();
    _getDocumentVBDen.close();
    _getDocumentVBDi.close();
    _getTag.close();
    _getPressNetWork.close();
    _userInformation.close();
    _showAddTag.close();
  }

  Stream<DocumentDashboardModel> get getDocumentVBDen =>
      _getDocumentVBDen.stream;
  Stream<List<TagModel>> get getTag => _getTag.stream;
  Stream<List<PressNetWorkModel>> get getPressNetWork =>
      _getPressNetWork.stream;
  Stream<DocumentDashboardModel> get getDocumentVBDi => _getDocumentVBDi.stream;
  Stream<UserInformationModel> get userInformation => _userInformation;
  Stream<List<TinhHuongKhanCapModel>> get tinhHuongKhanCap =>
      _tinhHuongKhanCap.stream;
  Stream<HomeItemType?> get showDialogSetting => _showDialogSetting.stream;
  Stream<TodoListModel> get getTodoList => _getTodoList.stream;
}

///Báo chí mạng xã hội
extension BaoChiMangXaHoi on HomeCubit {
  void getPress() {
    _getTag.sink.add(FakeData.tag);
    _getPressNetWork.sink.add(FakeData.fakeDataPress);
  }

  void selectTag(TagModel tagModel) {
    final oldSelect = _getTag.value.indexWhere(
      (element) => element.select == true,
    );
    _getTag.value[oldSelect].select = false;
    final newSelect = _getTag.value.indexWhere(
      (element) => element.title == tagModel.title,
    );
    _getTag.value[newSelect].select = true;
    _getTag.sink.add(_getTag.value);
  }
  void showAddTag(){

  }
}

///Danh sách công việc
extension DanhSachCongViec on HomeCubit {
  void tickerListWord({required TodoModel todo, bool removeDone = true}) {
    final data = _getTodoList.value;
    if (removeDone) {
      _removeInsertImportant(data, todo);
    } else {
      _removeInsertDone(data, todo);
    }
  }

  void addTodo(String label) {
    final data = _getTodoList.value;
    data.listTodoImportant.insert(
      0,
      TodoModel(
        important: true,
        inUsed: true,
        isDeleted: false,
        isTicked: false,
        label: label,
      ),
    );
    _getTodoList.sink.add(data);
  }

  void _removeInsertImportant(TodoListModel data, TodoModel todo) {
    final result = data.listTodoDone.removeAt(
      data.listTodoDone.indexWhere((element) => element.id == todo.id),
    );

    data.listTodoImportant.insert(0, result..important = true);
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

    data.listTodoDone.insert(0, result..important = false);
    _getTodoList.sink.add(
      data,
    );
  }

  String changeLabelTodo(String newLabel, TodoModel todo) {
    final data = _getTodoList.value;
    if (newLabel == todo.label) {
      return newLabel;
    } else if (newLabel.isEmpty) {
      return todo.label.toString();
    }
    final index =
        data.listTodoImportant.indexWhere((element) => element.id == todo.id);
    final result = data.listTodoImportant.removeAt(
      index,
    );
    data.listTodoImportant[index] = result..label = newLabel;
    return newLabel;
  }

  void tickerQuanTrongTodo(TodoModel todo, {bool removeDone = true}) {
    final data = _getTodoList.value;
    if (removeDone) {
      final result = data.listTodoDone.removeAt(
        data.listTodoDone.indexWhere((element) => element.id == todo.id),
      );
      data.listTodoDone.insert(0, result..isTicked = !(todo.isTicked ?? false));
    } else {
      final result = data.listTodoImportant.removeAt(
        data.listTodoImportant.indexWhere((element) => element.id == todo.id),
      );
      data.listTodoImportant
          .insert(0, result..isTicked = !(todo.isTicked ?? false));
    }
    _getTodoList.sink.add(data);
  }

  void getToDoList() {
    final data = FakeData.listTodoWork;
    final result = TodoListModel(
      listTodoDone: data
          .where((element) => element.toDoStatus == ToDoStatus.done)
          .toList(),
      listTodoImportant: data
          .where((element) => element.toDoStatus == ToDoStatus.unfinished)
          .toList(),
    );
    _getTodoList.sink.add(result);
  }
}
