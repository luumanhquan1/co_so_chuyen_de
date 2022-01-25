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

class NhacLaiWidget extends StatefulWidget {
  const NhacLaiWidget({Key? key}) : super(key: key);

  @override
  _NhacLaiWidgetState createState() => _NhacLaiWidgetState();
}

class _NhacLaiWidgetState extends State<NhacLaiWidget> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0.textScale()),
      child: Column(
        children: [
          StreamBuilder<ItemSelectModel>(
            stream: WidgetTaoLichLVInherited.of(context)
                .taoLichLamViecCubit
                .timeSelectStream,
            builder: (context, snapshot) {
              return TitleWidget(
                image: ImageAssets.icNhacLai,
                title: S.current.nhac_lai,
                onTap: () {
                  isExpand = !isExpand;
                  setState(() {});
                },
                title2: snapshot.data?.text ?? listTime[3].text,
                icon: isExpand
                    ? const Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: AqiColor,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AqiColor,
                      ),
                isColor: false,
              );
            },
          ),
          StreamBuilder<List<ItemSelectModel>>(
            stream: WidgetTaoLichLVInherited.of(context)
                .taoLichLamViecCubit
                .listTimeStream,
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
                                .taoLichLamViecCubit
                                .selectNhacLai(e);
                          },
                          child: ItemSelectWidget(
                            text: e.text,
                            isSelect: e.isSelect,
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
