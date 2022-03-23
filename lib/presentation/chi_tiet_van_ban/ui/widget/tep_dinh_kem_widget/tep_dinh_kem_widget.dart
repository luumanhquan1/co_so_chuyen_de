import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/widgets/text/text/no_data_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class TepDinhKemMobile extends StatefulWidget {
  final DetailDocumentCubit cubit;

  const TepDinhKemMobile({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<TepDinhKemMobile> createState() => _TepDinhKemMobileState();
}

class _TepDinhKemMobileState extends State<TepDinhKemMobile> {
  @override
  Widget build(BuildContext context) {
    return ExpandOnlyNhiemVu(
      name: S.current.tep_dinh_kem,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Phiếu trình',
                    style: textNormal(
                      infoColor,
                      14.0.textScale(),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    widget.cubit.phieuTrinh,
                    style: textNormal(
                      textTitle,
                      14.0.textScale(),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Dự thảo',
                    style: textNormal(
                      infoColor,
                      14.0.textScale(),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    widget.cubit.duThao,
                    style: textNormal(
                      textTitle,
                      14.0.textScale(),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Văn bản ban hành kèm theo dự thảo',
                style: titleText(
                  color: textDefault,
                  fontSize: 14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            StreamBuilder<List<String>>(
              stream: widget.cubit.vanBanBanHanh.stream,
              builder: (context, snapshot) {
                final _list = snapshot.data ?? [];
                if (_list.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return CellTepDinhKem(
                        nameFile: _list[index],
                      );
                    },
                  );
                } else {
                  return const SizedBox(
                    height: 200,
                    child: NodataWidget(),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Văn bản liên thông (không ban hành cùng)',
                style: titleText(
                  color: textDefault,
                  fontSize: 14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            StreamBuilder<List<String>>(
              stream: widget.cubit.vanBanLienThong.stream,
              builder: (context, snapshot) {
                final _list = snapshot.data ?? [];
                if (_list.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return CellTepDinhKem(
                        nameFile: _list[index],
                      );
                    },
                  );
                } else {
                  return const SizedBox(
                    height: 200,
                    child: NodataWidget(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CellTepDinhKem extends StatelessWidget {
  final String nameFile;

  const CellTepDinhKem({Key? key, required this.nameFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: bgDropDown),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                'Tệp đính kèm',
                style: textNormal(
                  textTitle,
                  14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 7,
              child: Text(
                nameFile,
                style: textNormal(
                  choXuLyColor,
                  14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
