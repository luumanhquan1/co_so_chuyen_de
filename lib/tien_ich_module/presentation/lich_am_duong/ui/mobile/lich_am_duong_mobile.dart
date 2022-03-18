import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/app_bar/base_app_bar.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/lich_am_duong.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/bloc/lichh_am_duong_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/gio_hoang_dao_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/ngay_bach_ky_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/nhi_thap_bat_tu_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/thap_nhi_kien_tru_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/tuoi_xung_theo_ngay_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/tuoi_xung_theo_thang_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LichAmDuongMobile extends StatefulWidget {
  const LichAmDuongMobile({Key? key}) : super(key: key);

  @override
  _LichAmDuongMobileState createState() => _LichAmDuongMobileState();
}

class _LichAmDuongMobileState extends State<LichAmDuongMobile> {
  late LichAmDuongCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LichAmDuongCubit();
    cubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SvgPicture.asset(
                ImageAssets.icIconMenuLichAmDuong,
              ),
            ),
          ),
        ],
        title: S.current.lich_am_duong,
        leadingIcon: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset(
            ImageAssets.icBack,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: StreamBuilder<LichAmDuong>(
                stream: cubit.lichAmDuongStream,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 140,
                      ),
                      GioHoangDaoWidget(
                        listGioHoangDao: snapshot.data?.gioHoangDao ?? [],
                        sao: snapshot.data?.truc ?? '',
                        truc: snapshot.data?.truc ?? '',
                        hanh: snapshot.data?.truc ?? '',
                      ),
                      TuoiXungTheoNgayWidget(
                        listTuoiXungTheoNgay:
                            snapshot.data?.tuoiXungTheoNgay ?? [],
                      ),
                      TuoiXungTheoThangWidget(
                        listTuoiXungTheoThang:
                            snapshot.data?.tuoiXungTheoThang ?? [],
                      ),
                      NgayBachKyWidget(
                        listNgayBachKy: snapshot.data?.ngayBachKy ?? [],
                      ),
                      ThapNhiKienTruWidget(
                        thapNhiKienTru:
                            snapshot.data?.thapNhiKienTru ?? ThapNhiKienTru(),
                      ),
                      ThapNhiBatTuWidget(
                        thapNhiBatTu:
                            snapshot.data?.thapNhiBatTu ?? ThapNhiBatTu(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          TableCalendarWidget(
            onChange: (DateTime start, DateTime end, selectDay) {},
            onChangeRange:
                (DateTime? start, DateTime? end, DateTime? focusedDay) {},
          ),
        ],
      ),
    );
  }
}
