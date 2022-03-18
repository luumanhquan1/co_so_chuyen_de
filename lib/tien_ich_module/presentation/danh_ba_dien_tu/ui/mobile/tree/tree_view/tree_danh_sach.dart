import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_checkbox.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/bloc_tree/danh_sach_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/danh_sach_model.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TreeDanhSach extends StatefulWidget {
  final Node<DanhSachModel> node;
  final DanhBaCubit danhBaCubit;
  final bool selectOnly;

  const TreeDanhSach({
    Key? key,
    required this.danhBaCubit,
    required this.node,
    this.selectOnly = false,
  }) : super(key: key);

  @override
  _TreeWidgetState createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeDanhSach> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 32.0 * widget.node.level.toDouble(),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (widget.selectOnly)
                      StreamBuilder<Node<DanhSachModel>>(
                          stream: widget.danhBaCubit.selectOnlyDonVi,
                          builder: (context, snapshot) {
                            return CustomCheckBox(
                              title: '',
                              onChange: (isCheck) {
                                widget.danhBaCubit.selectNodeOnly(widget.node);
                              },
                              isCheck: snapshot.data?.value.id ==
                                  widget.node.value.id,
                            );
                          })
                    else
                      CustomCheckBox(
                        title: '',
                        onChange: (isCheck) {
                          widget.node.isCheck.isCheck = !isCheck;
                          setState(() {});
                          widget.danhBaCubit.addSelectNode(
                            widget.node,
                            isCheck: widget.node.isCheck.isCheck,
                          );
                        },
                        isCheck: widget.node.isCheck.isCheck,
                      ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          widget.node.expand = !widget.node.expand;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  title(),
                                  style:
                                      textNormal(textTitle, 14.0.textScale()),
                                ),
                              ),
                              if (widget.node.children.isNotEmpty)
                                Transform.rotate(
                                  angle: widget.node.expand ? 0 : 3.1,
                                  child: SvgPicture.asset(
                                    ImageAssets.icDropDownButton,
                                  ),
                                )
                              else
                                const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.node.children.isNotEmpty && widget.node.expand)
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(widget.node.children.length, (index) {
              final node = widget.node.children[index];
              return TreeDanhSach(
                selectOnly: widget.selectOnly,
                danhBaCubit: widget.danhBaCubit,
                node: node,
              );
            }),
          )
        else
          const SizedBox()
      ],
    );
  }

  String title() {
    if (widget.node.children.isNotEmpty) {
      return '${widget.node.value.name} (${widget.node.children.length})';
    }
    return widget.node.value.name;
  }
}
