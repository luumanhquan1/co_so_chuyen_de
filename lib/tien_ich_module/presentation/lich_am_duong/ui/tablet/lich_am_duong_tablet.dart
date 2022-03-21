import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/lich_am_duong.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/bloc/lichh_am_duong_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/tablet/widget/gio_hoang_dao_widget_tablet.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/gio_ly_thuan_phong_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/ngay_bach_ky_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/nhi_thap_bat_tu_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/sao_tot_sao_xau_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/thap_nhi_kien_tru_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/tuoi_xung_theo_ngay_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/ui/widget/tuoi_xung_theo_thang_widget.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class LichAmDuongTablet extends StatefulWidget {
  const LichAmDuongTablet({Key? key}) : super(key: key);

  @override
  _LichAmDuongTabletState createState() => _LichAmDuongTabletState();
}

class _LichAmDuongTabletState extends State<LichAmDuongTablet> {
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
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(S.current.lich_am_duong),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: StreamBuilder<LichAmDuong>(
            stream: cubit.lichAmDuongStream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: backgroundColorApp,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: borderColor.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: shadowContainerColor.withOpacity(0.05),
                                offset: const Offset(0, 4),
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: Column(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: backgroundColorApp,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: borderColor.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: shadowContainerColor.withOpacity(0.05),
                                offset: const Offset(0, 4),
                                blurRadius: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColorApp,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: borderColor.withOpacity(0.5)),
                      boxShadow: [
                        BoxShadow(
                          color: shadowContainerColor.withOpacity(0.05),
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GioHoangDaoWidgetTablet(
                          listGioHoangDao: snapshot.data?.gioHoangDao ?? [],
                          sao: snapshot.data?.nguHanh?.sao ?? '',
                          truc: snapshot.data?.nguHanh?.truc ?? '',
                          hanh: snapshot.data?.nguHanh?.hanh ?? '',
                          ngayAmLichStr: snapshot.data?.ngayAmLicgStr ?? '',
                          tietKhi: snapshot.data?.tietKhi ?? '',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 24.0,
                            left: 24.0,
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Divider(
                                  thickness: 1,
                                  color: bgDropDown,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TuoiXungTheoNgayWidget(
                                      listTuoiXungTheoNgay:
                                          snapshot.data?.tuoiXungTheoNgay ?? [],
                                    ),
                                  ),
                                  Expanded(
                                    child: TuoiXungTheoThangWidget(
                                      listTuoiXungTheoThang:
                                          snapshot.data?.tuoiXungTheoThang ??
                                              [],
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Divider(
                                  thickness: 1,
                                  color: bgDropDown,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ThapNhiKienTruWidget(
                                      thapNhiKienTru:
                                          snapshot.data?.thapNhiKienTru ??
                                              ThapNhiKienTru(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  Expanded(
                                    child: NgayBachKyWidget(
                                      listNgayBachKy:
                                          snapshot.data?.ngayBachKy ?? [],
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Divider(
                                  thickness: 1,
                                  color: bgDropDown,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ThapNhiBatTuWidget(
                                      thapNhiBatTu:
                                          snapshot.data?.thapNhiBatTu ??
                                              ThapNhiBatTu(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  Expanded(
                                    child: SaoTotSaoXauWidget(
                                      listSaoTot: snapshot.data?.saoTot ?? [],
                                      listSaoXau: snapshot.data?.saoXau ?? [],
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Divider(
                                  thickness: 1,
                                  color: bgDropDown,
                                ),
                              ),
                              GioLyThuanPhongWidget(
                                listGioLyThuanPhong:
                                    snapshot.data?.gioLyThuanPhong ?? [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
