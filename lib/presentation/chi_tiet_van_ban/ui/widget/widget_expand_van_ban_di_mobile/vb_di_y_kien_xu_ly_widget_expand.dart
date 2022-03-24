import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/y_kien_xu_ly_van_ban_di_widget.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';

class VBDiYKienXuLyExpandWidget extends StatelessWidget {
  final DetailDocumentCubit cubit;

  const VBDiYKienXuLyExpandWidget({Key? key, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.y_kien_xu_ly,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StreamBuilder<ChiTietVanBanDiModel>(
          stream: cubit.chiTietVanBanDiSubject,
          builder: (context, snapshot) {
            final dataDSCYK = snapshot.data?.danhSachChoYKien ?? [];
            if (dataDSCYK.isNotEmpty) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data?.danhSachChoYKien?.length,
                itemBuilder: (context, index) {
                  return YKienSuLyVanBanDiWidget(
                    object: snapshot.data?.danhSachChoYKien?[index] ??
                        DanhSachChoYKien(),
                  );
                },
              );
            } else {
              return const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: NodataWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}
