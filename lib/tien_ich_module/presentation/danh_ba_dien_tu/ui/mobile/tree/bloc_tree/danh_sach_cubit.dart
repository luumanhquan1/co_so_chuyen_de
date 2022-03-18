import 'dart:async';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/bloc_tree/danh_ba_state.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/danh_sach_model.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:rxdart/rxdart.dart';

class DanhBaCubit extends BaseCubit<DanhBaState> {
  DanhBaCubit() : super(MainStateInitial());
  List<Node<DanhSachModel>> listTree = [];
  Timer? _debounce;
  final List<Node<DanhSachModel>> selectNode = [];
  Node<DanhSachModel>? selectNodeOnlyValue;

  ///
  final BehaviorSubject<List<Node<DanhSachModel>>> _getTree =
      BehaviorSubject<List<Node<DanhSachModel>>>();

  Stream<List<Node<DanhSachModel>>> get getTree => _getTree.stream;

  final BehaviorSubject<List<Node<DanhSachModel>>> _selectDonVi =
      BehaviorSubject<List<Node<DanhSachModel>>>();

  Stream<List<Node<DanhSachModel>>> get selectDonVi => _selectDonVi.stream;

  final BehaviorSubject<Node<DanhSachModel>> _selectOnlyDonVi =
      BehaviorSubject<Node<DanhSachModel>>();

  Stream<Node<DanhSachModel>> get selectOnlyDonVi => _selectOnlyDonVi.stream;

  void getTreeDonVi(List<Node<DanhSachModel>> tree) {
    final data = <Node<DanhSachModel>>[];
    for (final vl in tree) {
      data.add(vl.coppyWith());
    }
    _getTree.sink.add(data);
    listTree = data;
  }

  void addSelectNode(Node<DanhSachModel> node, {required bool isCheck}) {
    if (isCheck) {
      selectNode.add(node);
    } else {
      selectNode.remove(node);
    }
    _selectDonVi.sink.add(selectNode);
  }

  void selectNodeOnly(Node<DanhSachModel> node) {
    selectNodeOnlyValue = node;
    _selectOnlyDonVi.sink.add(node);
  }

  void removeTag(Node<DanhSachModel> node) {
    selectNode.remove(node);
    _selectDonVi.sink.add(selectNode);
    node.isCheck.isCheck =
        false; //dùng tham chiếu không phải loop lại tree để xét lại checkbox
    _getTree.sink.add(listTree);
  }

  void initSelectNode(List<DanhSachModel> value) {
    selectNode.clear();
    for (final element in listTree) {
      element.removeCkeckBox();
      for (final vl in value) {
        final node = Node<DanhSachModel>(vl);
        final result = element.search(node);
        if (result != null) {
          selectNode.add(result);
          result.isCheck.isCheck = true;
        }
      }
    }
    _getTree.sink.add(listTree);
  }

  void onSearch(String search) {
    final String textSearch = search.trim();
    if (_debounce != null) {
      if (_debounce!.isActive) _debounce!.cancel();
    }
    final List<Node<DanhSachModel>> listNode = [];
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (textSearch.isNotEmpty) {
        for (final node in listTree) {
          final nodeSearch = _searchNode(node, textSearch);
          if (nodeSearch != null) {
            listNode.add(nodeSearch);
          }
        }
        _getTree.sink.add(listNode);
      } else {
        _getTree.sink.add(listTree);
      }
    });
  }

  Node<DanhSachModel>? _searchNode(Node<DanhSachModel> node, String search) {
    final Set<Node<DanhSachModel>> listNodeSearch = {};
    _listSearch(listNodeSearch, node, search);
    if (listNodeSearch.isNotEmpty &&
        listNodeSearch.where((element) => element.parent == null).isNotEmpty) {
      final parent =
          listNodeSearch.where((element) => element.parent == null).first;
      final Node<DanhSachModel> treeSearch = Node.init(parent);
      _makeBuildTreeSearch(treeSearch, listNodeSearch);
      return treeSearch;
    }
    return null;
  }

  void _makeBuildTreeSearch(
    Node<DanhSachModel> node,
    Set<Node<DanhSachModel>> listNodeSearch,
  ) {
    final children = listNodeSearch
        .where((element) => element.parent?.value.id == node.value.id);
    if (children.isNotEmpty) {
      for (final vl in children) {
        final Node<DanhSachModel> treeSearch = Node.init(vl);
        treeSearch.expand = true;
        node.addChild(treeSearch);

        _makeBuildTreeSearch(treeSearch, listNodeSearch);
      }
    }
  }

  void _listSearch(
    Set<Node<DanhSachModel>> list,
    Node<DanhSachModel> node,
    String search,
  ) {
    if (node.value.name
        .toLowerCase()
        .vietNameseParse()
        .contains(search.toLowerCase().vietNameseParse())) {
      list.add(node);
      if (node.parent != null) {
        _addParent(list, node);
      }
    }
    if (node.children.isNotEmpty) {
      for (final vl in node.children) {
        _listSearch(list, vl, search);
      }
    }
  }

  void _addParent(Set<Node<DanhSachModel>> list, Node<DanhSachModel> node) {
    if (node.parent != null) {
      list.add(node.parent!);
      _addParent(list, node.parent!);
    } else {
      return;
    }
  }

  void dispose() {
    _getTree.close();
  }
}
