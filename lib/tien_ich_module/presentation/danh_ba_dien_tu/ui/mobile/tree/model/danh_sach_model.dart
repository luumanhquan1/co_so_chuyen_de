class DanhSachModel {
  String id = '';
  String name = '';
  String tenCanBo = '';
  String chucVu = '';
  String canBoId = '';
  String noidung = '';

  DanhSachModel({
    required this.id,
    required this.name,
    this.tenCanBo = '',
    this.chucVu = '',
    this.canBoId = '',
  });
}

class Node<T> {
  late T value;
  Node<T>? parent;
  bool expand = false;
  CheckBox isCheck = CheckBox();
  int level = 0;
  List<Node<T>> children = [];

  Node(T init) {
    value = init;
  }

  Node.init(Node<T> node) {
    value = node.value;
    parent = node.parent;
    expand = node.expand;
    isCheck = node.isCheck;
  }

  Node<DanhSachModel>? search(Node<DanhSachModel> node) {
    final nodeTree = value as DanhSachModel;
    if (node.value.id == nodeTree.id) {
      return this as Node<DanhSachModel>;
    } else {
      if (children.isNotEmpty) {
        for (final vl in children) {
          final found = vl.search(node);
          if (found != null) {
            return found;
          }
        }
      }
      return null;
    }
  }

  void removeCkeckBox() {
    isCheck.isCheck = false;
    if (children.isNotEmpty) {
      for (final vl in children) {
        vl.removeCkeckBox();
      }
    }
  }

  void addChild(Node<T> child) {
    child.level = level + 1;
    children.add(child);
    child.parent = this;
  }

  Node.copyWith(Node<T> node) {
    value = node.value;
    parent = node.parent;
    expand = node.expand;
    isCheck = node.isCheck;
    level = node.level;
  }

  Node<T> coppyWith() {
    final Node<T> node = Node.copyWith(this);
    for (final vl in children) {
      node.addChild(vl.coppyWith());
    }
    return node;
  }
}

class CheckBox {
  //dùng tham chiếu để đỡ phải duyệt tree
  bool isCheck = false;

  CheckBox({this.isCheck = false});
}