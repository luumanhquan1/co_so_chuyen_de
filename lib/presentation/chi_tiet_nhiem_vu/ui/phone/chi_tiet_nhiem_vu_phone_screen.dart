import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_header.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/danh_sach_cong_viec.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/van_ban_lien_quan.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/danh_sach_cong_viec.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/header_chi_tiet.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/van_ban_lien_quan_widget.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';

class ChiTietNhiemVuPhoneScreen extends StatefulWidget {
  const ChiTietNhiemVuPhoneScreen({Key? key}) : super(key: key);

  @override
  _ChiTietNhiemVuPhoneScreenState createState() =>
      _ChiTietNhiemVuPhoneScreenState();
}

class _ChiTietNhiemVuPhoneScreenState extends State<ChiTietNhiemVuPhoneScreen> {
  ChiTietNVCubit cubit = ChiTietNVCubit();

  @override
  void initState() {
    super.initState();
    cubit.initChiTietNV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: S.current.chi_tiet_nhiem_vu,
        leadingIcon: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const SizedBox(
            height: 15,
            width: 15,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: textBodyTime,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<ChiTietNhiemVuHeader>(
                stream: cubit.chiTietHeaderStream,
                builder: (context, snapshot) {
                  final data = snapshot.data ?? ChiTietNhiemVuHeader.empty();
                  return HeaderChiTiet(
                    row: data.listRow(),
                  );
                },
              ),

              StreamBuilder<VanBanLienQuanModel>(
                  stream: cubit.vanBanLienQuanStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? VanBanLienQuanModel.empty();
                    return VanBanLienQuanWidget(
                      dataModel: data,
                      cubit: cubit,
                    );
                  }),

              StreamBuilder<List<DanhSachCongViecModel>>(
                  stream: cubit.danhSachCongViecStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? [];
                    return DanhSachCongViecWidget(
                      dataModel: data,
                      cubit: cubit,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
