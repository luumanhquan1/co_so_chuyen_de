import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/tao_lich_hop_screen/widgets/container_toggle_widget.dart';
import 'package:ccvc_mobile/presentation/tao_lich_hop_screen/widgets/text_field_style.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_group.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/select_only_expands.dart';
import 'package:ccvc_mobile/widgets/thanh_phan_tham_gia/thanh_phan_tham_gia_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaoLichHopScreen extends StatefulWidget {
  const TaoLichHopScreen({Key? key}) : super(key: key);

  @override
  _TaoLichHopScreenState createState() => _TaoLichHopScreenState();
}

class _TaoLichHopScreenState extends State<TaoLichHopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.tao_lich_hop),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ExpandGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldStyle(
                urlIcon: ImageAssets.icEdit,
                hintText: 'Tiêu đề',
              ),
              spaceH5,
              ContainerToggleWidget(
                title: 'Họp trực tiếp',
                onChange: (value) {},
              ),
              spaceH5,
              ContainerToggleWidget(
                title: 'Trong đơn vị',
                onChange: (value) {},
              ),
              spaceH5,
              SelectOnlyExpand(
                urlIcon: ImageAssets.icCalendar,
                title: 'Loại họp',
                value: 'Lịch công tác trong nước',
                listSelect: [
                  'Lịch công tác trong nước',
                  'Lịch làm việc',
                  'Lịch công tác nước ngoài',
                  'Lịch tiếp dân',
                  'Admin tạo',
                  'Lịch công tác trong nước',
                  'Lịch làm việc',
                  'Lịch công tác nước ngoài',
                  'Lịch tiếp dân',
                  'Admin tạo',
                  'Lịch công tác trong nước',
                  'Lịch làm việc',
                  'Lịch công tác nước ngoài',
                  'Lịch tiếp dân',
                  'Admin tạo'
                ],
              ),
              spaceH5,
              SelectOnlyExpand(
                urlIcon: ImageAssets.icWork,
                title: 'Lĩnh vực',
                value: 'Không bao giờ',
                listSelect: [
                  'Không bao giờ',
                  'Trước 5 phút',
                  'Trước 10 phút',
                  'Trước 15 phút',
                  'Trước 30 phút',
                  'Trước 1 giờ'
                ],
              ),
              spaceH5,
              TextFieldStyle(
                urlIcon: ImageAssets.icDoublePerson,
                hintText: 'Thêm người',
              ),
              spaceH5,
              SelectOnlyExpand(
                urlIcon: ImageAssets.icNhacLai,
                title: 'Nhắc lại',
                value: 'Không bao giờ',
                listSelect: [
                  'Không bao giờ',
                  'Trước 5 phút',
                  'Trước 10 phút',
                  'Trước 15 phút',
                  'Trước 30 phút',
                  'Trước 1 giờ'
                ],
              ),
              spaceH5,
              SelectOnlyExpand(
                urlIcon: ImageAssets.icNhacLai,
                title: 'Lĩnh lặp',
                value: 'Không bao giờ',
                listSelect: [
                  'Không bao giờ',
                  'Trước 5 phút',
                  'Trước 10 phút',
                  'Trước 15 phút',
                  'Trước 30 phút',
                  'Trước 1 giờ'
                ],
              ),
              spaceH5,
              SelectOnlyExpand(
                urlIcon: ImageAssets.icWork,
                title: 'Mức độ họp',
                value: '',
                listSelect: [
                  'Không bao giờ',
                  'Trước 5 phút',
                  'Trước 10 phút',
                  'Trước 15 phút',
                  'Trước 30 phút',
                  'Trước 1 giờ'
                ],
              ),
              spaceH5,
              SelectOnlyExpand(
                urlIcon: ImageAssets.icPeople,
                title: 'Người chủ trì',
                value: '',
                listSelect: [
                  'Không bao giờ',
                  'Trước 5 phút',
                  'Trước 10 phút',
                  'Trước 15 phút',
                  'Trước 30 phút',
                  'Trước 1 giờ'
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
