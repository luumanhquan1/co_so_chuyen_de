import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/item_select_model.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/mobile/tao_lich_lam_viec_chi_tiet_screen.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/widget/item_select_widget.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/widget/title_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/slide_expand.dart';
import 'package:flutter/material.dart';

class LinhVucWidget extends StatefulWidget {
  const LinhVucWidget({Key? key}) : super(key: key);

  @override
  _LinhVucWidgetState createState() => _LinhVucWidgetState();
}

class _LinhVucWidgetState extends State<LinhVucWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleWidget(
            image: ImageAssets.icWork,
            title: S.current.linh_vuc,
            isColor: false,
            onTap: () {
              setState(() {
                isCheck = !isCheck;
              });
            },
            icon: isCheck
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
                .listLinhVucStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              final data = snapshot.data ?? [];

              return ExpandedSection(
                expand: isCheck,
                child: Column(
                  children: data
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            WidgetTaoLichLVInherited.of(context)
                                .taoLichLamViecCubit.selectLinhVuc(e);
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
            },
          ),
        ],
      ),
    );
  }
}
