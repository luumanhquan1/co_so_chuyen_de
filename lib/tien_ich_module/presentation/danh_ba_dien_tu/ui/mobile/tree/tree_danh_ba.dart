import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/bloc/danh_ba_cubit_tree.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/danh_sach_model.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/search/search.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/tree_view/tree_danh_sach.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/extensions/screen_device_extension.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/dialog/show_dia_log_tablet.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class DanhBaWidget extends StatefulWidget {
  final Function(List<Node<DanhSachModel>>) onChange;
  final List<DanhSachModel> listSelectNode;

  final DanhBaCubitTree cubit;

  const DanhBaWidget({
    Key? key,
    required this.onChange,
    this.listSelectNode = const [],
    required this.cubit,
  }) : super(key: key);

  @override
  State<DanhBaWidget> createState() => _DanhBaScreenState();
}

class _DanhBaScreenState extends State<DanhBaWidget> {
  final DanhBaCubit danhBaCubit = DanhBaCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cubit.getTreeDonVi.listen((event) {
      danhBaCubit.getTreeDonVi(event);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    danhBaCubit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: ExpansionTile(
              title: const Text('Lãnh đạo UBND Tỉnh'),
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.9),
                    child: TreeDanhBaTienIch(
                      cubit: danhBaCubit,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void showSelect() {
    danhBaCubit.initSelectNode(widget.listSelectNode);
    if (APP_DEVICE == DeviceType.MOBILE) {
      showBottomSheetCustom<List<Node<DanhSachModel>>>(
        context,
        title: S.current.chon_thanh_phan_tham_gia,
        child: TreeDanhBaTienIch(
          cubit: danhBaCubit,
        ),
      ).then((value) {
        if (value != null) {
          widget.onChange(value);
        }
        danhBaCubit.onSearch('');
      });
    } else {
      showDiaLogTablet(
        context,
        title: S.current.chon_thanh_phan_tham_gia,
        child: TreeDanhBaTienIch(
          cubit: danhBaCubit,
        ),
        isBottomShow: true,
        funcBtnOk: () {
          Navigator.pop(context, danhBaCubit.selectNode);
        },
      ).then((value) {
        if (value != null) {
          widget.onChange(value);
        }
        danhBaCubit.onSearch('');
      });
    }
  }
}

class TreeDanhBaTienIch extends StatelessWidget {
  final DanhBaCubit cubit;

  const TreeDanhBaTienIch({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 6.0.textScale(space: 4),
          ),
          SearchWidget(
            danhBaCubit: cubit,
          ),
          SizedBox(
            height: 4.0.textScale(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 22.0.textScale(space: -9),
                  ),
                  Expanded(
                    child: StreamBuilder<List<Node<DanhSachModel>>>(
                      stream: cubit.getTree,
                      builder: (context, snapshot) {
                        final data = snapshot.data ?? <Node<DanhSachModel>>[];
                        if (data.isNotEmpty) {
                          return ListView.builder(
                            keyboardDismissBehavior: isMobile()
                                ? ScrollViewKeyboardDismissBehavior.onDrag
                                : ScrollViewKeyboardDismissBehavior.manual,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return TreeDanhSach(
                                node: data[index],
                                danhBaCubit: cubit,
                              );
                            },
                          );
                        }
                        return Column(
                          children: const [
                            NodataWidget(),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
