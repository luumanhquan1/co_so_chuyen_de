import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/chi_tiet_yknd_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/bloc/chi_tiet_y_kien_nguoidan_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/tablet/widget/chi_tiet_header_tablet.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/tablet/widget/item_row.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/tablet/widget/ket_qua_xu_ly_tablet.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/tablet/widget/thong_tin_nguoi_phan_anh_tablet.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/tablet/widget/thong_tin_xu_ly_phan_anh_tablet.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/tablet/widget/tien_trinh_xu_Ly_tablet.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class ChiTietVanBanTabletScreen extends StatefulWidget {
  final String iD;
  final String taskID;

  const ChiTietVanBanTabletScreen({
    Key? key,
    required this.taskID,
    required this.iD,
  }) : super(key: key);

  @override
  _ChiTietVanBanTabletScreenState createState() =>
      _ChiTietVanBanTabletScreenState();
}

class _ChiTietVanBanTabletScreenState extends State<ChiTietVanBanTabletScreen> {
  ChiTietYKienNguoiDanCubit cubit = ChiTietYKienNguoiDanCubit();

  @override
  void initState() {
    super.initState();
    cubit.getchiTietYKienNguoiDan(widget.iD, widget.taskID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        S.current.chi_tiet_yknd,
      ),
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('', S.current.something_went_wrong),
        stream: cubit.stateStream,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
            color: bgQLVBTablet,
            child: StreamBuilder<ChiTietYKienNguoiDanRow>(
              stream: cubit.rowDataChiTietYKienNguoiDan,
              builder: (context, snapshot) {
                final data = snapshot.data;
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: backgroundColorApp,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: cellColorborder),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowContainerColor.withOpacity(0.05),
                                    blurRadius: 10,
                                  )
                                ]
                              ),
                              child: ChiTietYKNDHeaderTablet(
                                listRow: data?.dataHeaderRow ?? [],
                              ),),
                          const SizedBox(height: 28,),
                          Container(
                            child: ExpandOnlyNhiemVu(
                              name: S.current.thong_tin_nguoi_phan_anh,
                              child: Container(
                                color: backgroundColorApp,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                child: NguoiPhanAnhTablet(
                                  indexCheck: cubit.checkIndex,
                                  listRow: data?.thongTinPhanAnhRow ?? [],
                                ),
                              ),
                            ),
                          ),
                          ExpandOnlyNhiemVu(
                            name: S.current.thong_tin_xu_ly_phan_anh,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: ThongTinXuLyTablet(
                                listRow: data?.thomgTinXuLyRow ?? [],
                              ),
                            ),
                          ),
                          ExpandOnlyNhiemVu(
                            name: S.current.ket_qua_xu_ly,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                children: [
                                  ItemRow(
                                    title: S.current.y_kien_xu_ly,
                                    content: cubit.yKienXuLy,
                                  ),
                                  const SizedBox(height: 20,),
                                  KetQuaXuLyScreenTablet(
                                    listRow: data?.ketQuaXuLyRow ?? [],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ExpandOnlyNhiemVu(
                            name: S.current.tien_trinh_xu_ly,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                children: [
                                  ItemRow(
                                    title: S.current.y_kien_xu_ly,
                                    content: cubit.yKienXuLy,
                                  ),
                                  const SizedBox(height: 20,),
                                  TienTrinhXuLyScreenTablet(
                                    listRow: data?.tienTrinhXuLy ?? [],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
