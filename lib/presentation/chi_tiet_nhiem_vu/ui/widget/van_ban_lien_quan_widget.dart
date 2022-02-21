import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/van_ban_lien_quan.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/widget_in_expand.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VanBanLienQuanWidget extends StatefulWidget {
  final VanBanLienQuanModel dataModel;
  final ChiTietNVCubit cubit;

  const VanBanLienQuanWidget({
    Key? key,
    required this.dataModel,
    required this.cubit,
  }) : super(key: key);

  @override
  State<VanBanLienQuanWidget> createState() => _VanBanLienQuanWidgetState();
}

class _VanBanLienQuanWidgetState extends State<VanBanLienQuanWidget> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isExpand = !isExpand;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0.textScale()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0.textScale(space: 4),
                vertical: 10.5.textScale(space: 4),
              ),
              decoration: BoxDecoration(
                color: borderColor.withOpacity(0.1),
                border: Border.all(color: borderColor.withOpacity(0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.van_ban_lien_quan,
                    style: textNormalCustom(
                      color: textTitle,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0.textScale(),
                    ),
                  ),
                  Icon(
                    isExpand
                        ? Icons.keyboard_arrow_down_outlined
                        : Icons.keyboard_arrow_up_rounded,
                    color: AqiColor,
                  ),
                ],
              ),
            ),
            ExpandedSection(
              expand: isExpand,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.textScale(space: 4),
                  vertical: 16.0.textScale(space: 4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.van_ban_giao_nhiem_vu,
                      style: textNormalCustom(
                        color: radioFocusColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0.textScale(),
                      ),
                    ),

                    Column(
                      children: widget.dataModel.vanBanGiaoNV
                          .map((e) => WidgetInExpand(
                                row: e,
                                cubit: widget.cubit,
                              ))
                          .toList(),
                    ),

                    SizedBox(
                      height: 14.0.textScale(),
                    ),

                    Text(
                      S.current.van_ban_khac,
                      style: textNormalCustom(
                        color: radioFocusColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0.textScale(),
                      ),
                    ),

                    Column(
                      children: widget.dataModel.vanBanKhac
                          .map((e) => WidgetInExpand(row: e, cubit: widget.cubit,))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
