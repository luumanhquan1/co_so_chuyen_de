import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/home/document_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/title_item.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class YKienNguoiDanWidget extends StatelessWidget {
  final String time;
  final List<DocumentModel> listData;

  const YKienNguoiDanWidget(
      {Key? key, required this.time, required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 6.0.textScale()),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.textScale(),
        vertical: 10.0.textScale(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleItem(
            title: S.current.people_opinions,
            time: time,
          ),
          Column(
            children: List.generate(listData.length, (index) {
              final data = listData[index];
              return Padding(
                padding: EdgeInsets.only(top: 16.0.textScale()),
                child: ContainerInfoWidget(
                  title: data.title,
                  status: data.documentStatus.getText(),
                  colorStatus: data.documentStatus.getColor(),
                  listData: [
                    InfoData(
                      urlIcon: ImageAssets.icSoKyHieu,
                      key: S.current.so_ky_hieu,
                      value: data.kyHieu,
                    ),
                    InfoData(
                      urlIcon: ImageAssets.icAddress,
                      key: S.current.noi_gui,
                      value: data.noiGui,
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
