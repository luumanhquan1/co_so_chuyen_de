import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/home/calendar_metting_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class TongHopNVWidget extends StatelessWidget {
  String time;
  List<CalendarMeetingModel> listData;

  TongHopNVWidget({Key? key, required this.time, required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0.textScale(),
          ),
          Text(
            S.current.summary_of_tasks,
            style: textNormalCustom(
              fontSize: 16.0.textScale(),
              fontWeight: FontWeight.w500,
              color: titleCalenderWork,
            ),
          ),
          SizedBox(
            height: 3.0.textScale(),
          ),
          Text(
            time,
            style: textNormalCustom(
              fontSize: 12.0.textScale(),
              fontWeight: FontWeight.w400,
              color: textBodyTime,
            ),
          ),

          SizedBox(height: 10.0.textScale(),),

          Column(
            children: List.generate(listData.length, (index) {
              final data = listData[index];
              return Padding(
                padding:  EdgeInsets.only(bottom: 16.0.textScale()),
                child: ContainerInfoWidget(
                  status: data.codeStatus.getText(),
                  colorStatus: data.codeStatus.getColor(),
                  title: data.title,
                  listData: [
                    InfoData(
                      urlIcon: ImageAssets.icWork,
                      key: S.current.loai_nhiem_vu,
                      value: data.loaiNhiemVu,
                    ),
                    InfoData(
                      urlIcon: ImageAssets.icCalendar,
                      key: S.current.han_xu_ly,
                      value: S.current.han_xu_ly,
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
