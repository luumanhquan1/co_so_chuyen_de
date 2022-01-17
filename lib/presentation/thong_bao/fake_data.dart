import 'package:ccvc_mobile/domain/model/thong_bao/thong_bao_model.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';

final fakeDataThongBao = <ThongBaoModel>[
  ThongBaoModel(
    image: ImageAssets.icVideo,
      title: 'Có lịch họp mới',
      content:
          'Họp đề án sắp xếp ổn định dân cư tại chỗ các ấp vè lòng hồ Trị An, huyện Vĩnh Cửu',
      status: false,
      time: '10/06/2021 | 09:49:02',),
  ThongBaoModel(
    image: ImageAssets.icMessenge,
      title: 'Có tin nhắn mới',
      content:
          'http://call.chinhquyendientu.vn/UBND-DN-HOP-thuong-truc-tinh-uy',
      status: false,
      time: '10/06/2021 | 09:49:02',),
  ThongBaoModel(
    image: ImageAssets.icVideo,
      title: 'Có lịch họp mới',
      content: 'Họp phòng chống covid-19',
      status: true,
      time: '10/06/2021 | 09:49:02',),
];
