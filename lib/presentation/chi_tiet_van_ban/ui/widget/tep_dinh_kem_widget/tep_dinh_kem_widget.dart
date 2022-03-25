import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/chi_tiet_van_ban_di_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/ui/widget/expand_only_nhiem_vu.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/dowload_file.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/dialog/message_dialog/message_config.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.current.phieu_trinh,
                style: titleText(
                  color: textDefault,
                  fontSize: 14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            StreamBuilder<List<FileDinhKemVanBanDiModel>>(
              stream: widget.cubit.listPhieuTrinh.stream,
              builder: (context, snapshot) {
                final _list = snapshot.data ?? [];
                if (_list.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return CellTepDinhKem(
                        obj: _list[index],
                        index: 0,
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: 50,
                    child: Text(
                      S.current.khong_co_tep_nao,
                      style: textNormal(
                        textBodyTime,
                        14.0.textScale(),
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.current.du_thao,
                style: titleText(
                  color: textDefault,
                  fontSize: 14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            StreamBuilder<List<FileDinhKemVanBanDiModel>>(
              stream: widget.cubit.listDuThao.stream,
              builder: (context, snapshot) {
                final _list = snapshot.data ?? [];
                if (_list.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return CellTepDinhKem(
                        obj: _list[index],
                        index: 0,
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: 50,
                    child: Text(
                      S.current.khong_co_tep_nao,
                      style: textNormal(
                        textBodyTime,
                        14.0.textScale(),
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.current.van_ban_ban_hanh_kem_theo_du_an,
                style: titleText(
                  color: textDefault,
                  fontSize: 14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            StreamBuilder<List<FileDinhKemVanBanDiModel>>(
              stream: widget.cubit.listVBBHKemDuTHao.stream,
              builder: (context, snapshot) {
                final _list = snapshot.data ?? [];
                if (_list.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return CellTepDinhKem(
                        obj: _list[index],
                        index: 0,
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: 50,
                    child: Text(
                      S.current.khong_co_tep_nao,
                      style: textNormal(
                        textBodyTime,
                        14.0.textScale(),
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.current.van_ban_lien_thong_khong_ban_hanh_cung,
                style: titleText(
                  color: textDefault,
                  fontSize: 14.0.textScale(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            StreamBuilder<List<FileDinhKemVanBanDiModel>>(
              stream: widget.cubit.listVBLienThong.stream,
              builder: (context, snapshot) {
                final _list = snapshot.data ?? [];
                if (_list.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return CellTepDinhKem(
                        obj: _list[index],
                        index: 0,
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: 50,
                    child: Text(
                      S.current.khong_co_tep_nao,
                      style: textNormal(
                        textBodyTime,
                        14.0.textScale(),
                      ),
                    ),
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
  final FileDinhKemVanBanDiModel obj;
  final int index;

  const CellTepDinhKem({Key? key, required this.obj, required this.index})
      : super(key: key);

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
                S.current.tep_dinh_kem,
                style: textNormal(
                  textTitle,
                  14.0.textScale(),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 7,
              child: GestureDetector(
                onTap: () async {
                  final status = await Permission.storage.status;
                  if (!status.isGranted) {
                    await Permission.storage.request();
                    await Permission.manageExternalStorage.request();
                  }
                  await saveFile(
                    obj.ten ?? '',
                    '$DO_MAIN_DOWLOAD_FILE${obj.duongDan}',
                  )
                      .then(
                        (value) => MessageConfig.show(
                            title: S.current.tai_file_thanh_cong),
                      )
                      .onError(
                        (error, stackTrace) => MessageConfig.show(
                          title: S.current.tai_file_that_bai,
                          messState: MessState.error,
                        ),
                      );
                },
                child: Text(
                  obj.ten ?? '',
                  style: textNormal(
                    choXuLyColor,
                    14.0.textScale(),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
