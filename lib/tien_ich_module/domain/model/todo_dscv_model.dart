class TodoListModelTwo {
  final List<TodoDSCVModel> listTodoImportant;
  final List<TodoDSCVModel> listTodoDone;

  TodoListModelTwo(
      {required this.listTodoImportant, required this.listTodoDone});
}

class TodoDSCVModel {
  String? id;
  String? label;
  bool? isTicked;
  bool? important;
  bool? inUsed;
  bool? isDeleted;
  String? createdOn;
  String? createdBy;
  String? updatedOn;
  String? updatedBy;
  String? note;
  String? performer;
  String? groupId;

  TodoDSCVModel(
      {this.id,
      this.label,
      this.isTicked,
      this.important,
      this.inUsed,
      this.isDeleted,
      this.createdOn,
      this.createdBy,
      this.updatedOn,
      this.updatedBy,
      this.note,
      this.performer,
      this.groupId});
}
