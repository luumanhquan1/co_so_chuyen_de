import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/widgets/text/text/no_data_widget.dart';
import 'package:ccvc_mobile/presentation/list_menu/ui/tablet/widgetTablet/dropdow_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/bloc/danh_ba_cubit_tree.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/widget/expand.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/widget/tree.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/bloc_tree/danh_sach_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/search/base_seach_bar_no_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DanhBaWidget extends StatefulWidget {
  final Function(List<NodeHSCV>) onChange;
  final DanhBaCubitTree cubit;

  const DanhBaWidget({
    Key? key,
    required this.onChange,
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
    widget.cubit.fakedata();
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
          child: Column(
            children: [
              DropdownWidgetTablet(
                title: StreamBuilder<String>(
                    stream: widget.cubit.tenDonVi.stream,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data.toString(),
                        style: textNormal(titleColor, 14),
                      );
                    }),
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 11),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.5,
                    ),
                    child: Column(
                      children: [
                        BaseSearchBarNoBorder(
                          hintText: S.current.nhap_don_vi,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: StreamBuilder(
                            stream: widget.cubit.listTreeDanhBaSubject.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (widget.cubit.listLuongPhanXuLy.isEmpty) {
                                return const NodataWidget();
                              } else {
                                return Scrollbar(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                    ),
                                    color: Colors.white,
                                    child: ListView(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: NodeWidget(
                                            key: UniqueKey(),
                                            node: widget.cubit.getRoot(),
                                            cubit: widget.cubit,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NodeWidget extends StatefulWidget {
  NodeHSCV? node;
  final DanhBaCubitTree cubit;

  NodeWidget({Key? key, this.node, required this.cubit}) : super(key: key);

  @override
  _NodeWidgetState createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  late NodeCubit nodeViewModel;
  bool isExpand = true;

  @override
  void initState() {
    super.initState();
    nodeViewModel = NodeCubit(
        tree: widget.cubit.listTreeDanhBaSubject.value
            .getChild(widget.node!.value.id));
    nodeViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double widthSize = size.width;
    return StreamBuilder<Tree>(
      stream: widget.cubit.listTreeDanhBaSubject.stream,
      builder: (BuildContext context, AsyncSnapshot<Tree> snapshot) {
        if (widget.node != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: widthSize,
                margin: const EdgeInsets.only(top: 12.5),
                child: GestureDetector(
                  onTap: () {
                    widget.node!.isHasChild == false
                        ? widget.cubit.getValueTree(
                      id: isExpand ? widget.node!.value.id : '',
                      donVi: isExpand
                          ? widget.node!.value.tenDonVi
                          : '',
                    )
                        : setState(() {});
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5.85),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.4, color: Color(0xFFECEEF7)))),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 9,
                                child: Text(
                                  widget.node!.value.tenDonVi.isNotEmpty
                                      ? widget.node!.value.tenDonVi
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      color: const Color(0xFF304261)),
                                ),
                              ),
                              Stack(
                                children: [
                                  StreamBuilder<String>(
                                    stream: widget.cubit.idDonVi.stream,
                                    builder: (context, snapshot) {
                                      return snapshot.data.toString() ==
                                          widget.node!.value.id
                                          ? (widget.node!.isHasChild)
                                          ? const SizedBox()
                                          : SvgPicture.asset(
                                        ImageAssets.ic_tick,
                                      )
                                          : const SizedBox();
                                    },
                                  ),
                                  if (widget.node!.value.iD_DonVi_Cha != '')
                                    Expanded(
                                      flex: 2,
                                      child: widget.node!.isHasChild
                                          ? isExpand
                                          ? const Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Color(0xFFA2AEBD),
                                      )
                                          : const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Color(0xFFA2AEBD))
                                          : Container(),
                                    ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (isExpand)
                StreamBuilder<List<NodeHSCV>>(
                  stream: nodeViewModel.listTreeXLPhanXuLySubject.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<NodeHSCV>> snapshot) {
                    widget.cubit.levelTree++;
                    final List<NodeHSCV> data = snapshot.data ?? [];
                    return Padding(
                      padding: EdgeInsets.only(left: size.width * 0.07),
                      child: Column(
                        children: [
                          ...data.map(
                                (e) => NodeWidget(
                              key: UniqueKey(),
                              node: e,
                              cubit: widget.cubit,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              else
                Container(),
            ],
          );
        } else {
          return const SizedBox(
            height: 0,
          );
        }
      },
    );
  }
}
