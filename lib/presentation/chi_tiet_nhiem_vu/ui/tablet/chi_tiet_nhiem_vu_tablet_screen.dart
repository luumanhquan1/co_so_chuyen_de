import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_header.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/header_chi_tiet.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';

class ChiTietNhiemVuTabletScreen extends StatefulWidget {
  const ChiTietNhiemVuTabletScreen({Key? key}) : super(key: key);

  @override
  _ChiTietNhiemVuTabletScreenState createState() =>
      _ChiTietNhiemVuTabletScreenState();
}

class _ChiTietNhiemVuTabletScreenState
    extends State<ChiTietNhiemVuTabletScreen> {
  ChiTietNVCubit cubit = ChiTietNVCubit();

  @override
  void initState() {
    super.initState();
    cubit.initChiTietNV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWidgets,
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
        padding: const EdgeInsets.all(30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<ChiTietNhiemVuHeader>(
                        stream: cubit.chiTietHeaderStream,
                        builder: (context, snapshot) {
                          final data =
                              snapshot.data ?? ChiTietNhiemVuHeader.empty();
                          return HeaderChiTiet(
                            row: data.listRow(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 14),
                ),)
          ],
        ),
      ),
    );
  }
}
