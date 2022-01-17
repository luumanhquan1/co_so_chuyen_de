import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/home/calendar_metting_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/title_item.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class LichLamViecWidget extends StatelessWidget {
  final String time;
  final List<CalendarMeetingModel> listData;

  const LichLamViecWidget(
      {Key? key, required this.time, required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.textScale(),
        vertical: 10.0.textScale(),
      ),
      margin: EdgeInsets.only(top: 6.0.textScale()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleItem(
            title:  S.current.calendar_work,
            time: time,
          ),

          Column(
            children: List.generate(listData.length, (index) {
              final data = listData[index];
              return Padding(
                padding: EdgeInsets.only(top: 16.0.textScale()),
                child: ContainerInfoWidget(
                  status: data.codeStatus.getText(),
                  colorStatus: data.codeStatus.getColor(),
                  backGroundStatus: true,
                  title: data.title,
                  listData: [
                    InfoData(
                      urlIcon: ImageAssets.icTime,
                      key: S.current.time,
                      value: data.time,
                    ),
                    InfoData(
                      urlIcon: ImageAssets.icAddress,
                      key: S.current.dia_diem,
                      value: data.address,
                    ),
                    InfoData(
                      urlIcon: ImageAssets.icPeople,
                      key: S.current.nguoi_chu_tri,
                      value: data.nguoiChuTri,
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