import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/item_select_model.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/mobile/tao_lich_lam_viec_chi_tiet_screen.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/widget/item_select_widget.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/widget/title_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/slide_expand.dart';
import 'package:flutter/material.dart';

class NguoiChuTriWidget extends StatefulWidget {
  const NguoiChuTriWidget({Key? key}) : super(key: key);

  @override
  _NguoiChuTriWidgetState createState() => _NguoiChuTriWidgetState();
}

class _NguoiChuTriWidgetState extends State<NguoiChuTriWidget> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: S.current.nguoi_chu_tri,
          isColor: false,
          onTap: () {
            isExpand = !isExpand;
            setState(() {});
          },
          image: ImageAssets.icPeople,
          icon: isExpand
              ? const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: AqiColor,
                )
              : const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AqiColor,
                ),
        ),
        StreamBuilder<List<ItemSelectModel>>(
            stream: WidgetTaoLichLVInherited.of(context)
                .taoLichLamViecCubit
                .listChuTriStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              final data = snapshot.data ?? [];
              return ExpandedSection(
                expand: isExpand,
                child: Column(
                  children: data
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            WidgetTaoLichLVInherited.of(context)
                                .taoLichLamViecCubit.selectChuTri(e);
                          },
                          child: ItemSelectWidget(
                            isSelect: e.isSelect,
                            text: e.text,
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },)
      ],
    );
  }
}
