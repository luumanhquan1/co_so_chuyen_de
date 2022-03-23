import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/tien_ich_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/TreeModel.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/widget/tree.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class DanhBaCubitTree {
  TienIchRepository get tienIchRep => Get.find();

  BehaviorSubject<Tree> listTreeDanhBaSubject = BehaviorSubject<Tree>();

  List<TreeDonViDanhBA> listTreeDanhBa = [];

  final List<String> _listId = [];
  final List<String> _listParent = [];

  Future<void> getTree() async {
    final result = await tienIchRep.TreeDanhBa(3);
    result.when(
      success: (res) {
        Tree ans = Tree();
        listTreeDanhBa = res;
        for (final e in listTreeDanhBa) {
          _listId.add(e.id);
          _listParent.add(e.iD_DonVi_Cha);
        }
        ans.initTree(listNode: listTreeDanhBa);
        listTreeDanhBaSubject.add(ans);
      },
      error: (error) {},
    );
  }

  NodeHSCV? getRoot() {
    if (listTreeDanhBaSubject.hasValue) {
      return listTreeDanhBaSubject.value.getRoot();
    }
  }

  TreeDonViDanhBA tree = TreeDonViDanhBA.Emty();
  int levelTree = 0;
  BehaviorSubject<String> tenDonVi =
      BehaviorSubject.seeded(S.current.UBND_tinh_dong_nai);
  BehaviorSubject<String> idDonVi = BehaviorSubject();

  void getValueTree({required String donVi, required String id}) {
    if (idDonVi.value != id) {
      tenDonVi.sink.add(donVi);
      idDonVi.sink.add(id);
    }
  }

  bool checkDad(
      {required NodeHSCV? node,
      required bool boolCheck,
      required Function(bool) onChange}) {
    if (node!.value.iD_DonVi_Cha != '') {
      boolCheck = false;
      onChange(boolCheck);
    } else {
      boolCheck = true;
      onChange(boolCheck);
    }
    return boolCheck;
  }

  void search(String text) {
    final searchTxt = text.toLowerCase().vietNameseParse();
    bool isListCanBo(TreeDonViDanhBA tree) {
      return tree.tenDonVi.toLowerCase().vietNameseParse().contains(searchTxt);
    }

    List<TreeDonViDanhBA> result = [];
    void findDonViCha(List<TreeDonViDanhBA> listAll, TreeDonViDanhBA node) {
      var parentsNode =
          listAll.where((x) => x.id == node.iD_DonVi_Cha).toList();
      if (parentsNode.isNotEmpty) {
        var parentNode = parentsNode.first;
        if (!result.contains(parentNode)) {
          result.add(parentNode);
          findDonViCha(listAll, parentNode);
        }
      }
    }

    final vlAfterSearch =
        listTreeDanhBa.where((element) => isListCanBo(element)).toList();
    try {
      if (vlAfterSearch.isNotEmpty) {
        for (var x = 0; x <= vlAfterSearch.length; x++) {
          if (!(result.map((e) => e.id)).contains(vlAfterSearch[x].id)) {
            result.add(vlAfterSearch[x]);
          }
          findDonViCha(listTreeDanhBa, vlAfterSearch[x]);
        }
      } else {
        result = listTreeDanhBa;
      }
    } catch (er) {}

    Tree ans = Tree();
    ans.initTree(listNode: result);
    listTreeDanhBaSubject.add(ans);

    print('${result.where((element) => element.iD_DonVi_Cha == '').toList()}');
  }

  void dispose() {}
}
