import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/thanh_phan_tham_gia_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CellThanhPhanThamGia extends StatefulWidget {
  final ThanhPhanThamGiaModel infoModel;
  final DetailMeetCalenderCubit cubit;

  CellThanhPhanThamGia({Key? key, required this.infoModel, required this.cubit})
      : super(key: key);

  @override
  State<CellThanhPhanThamGia> createState() => _CellThanhPhanThamGiaState();
}

class _CellThanhPhanThamGiaState extends State<CellThanhPhanThamGia> {
  @override
  Widget build(BuildContext context) {
    final isChecked = widget.cubit.checkIsSelected(widget.infoModel.id ?? '');
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor.withOpacity(0.5)),
          color: colorNumberCellQLVB,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  CustomCheckBox(
                    title: '',
                    isCheck: isChecked,
                    onChange: (isCheck) {
                      widget.cubit.addOrRemoveId(
                        isSelected: isChecked,
                        id: widget.infoModel.id ?? '',
                      );
                      // widget.cubit.checkAllSelect();
                      setState(() {});
                    },
                  ),
                  Text(
                    '${S.current.ten_can_bo}: ${widget.infoModel.tebCanBo}',
                    style: textNormalCustom(
                      fontSize: 16,
                      color: infoColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${S.current.ten_can_bo}:  ${widget.infoModel.tenDonVi}',
                      style: textNormalCustom(
                        fontSize: 14,
                        color: infoColor,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '${S.current.trang_thai}: ${widget.infoModel.trangThai}',
                    style: textNormalCustom(
                      fontSize: 14,
                      color: infoColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${S.current.ten_can_bo}: ${widget.infoModel.tenDonVi}',
                      style: textNormalCustom(
                        fontSize: 14,
                        color: infoColor,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '${S.current.diem_danh}: ${widget.infoModel.diemDanh}',
                    style: textNormalCustom(
                      fontSize: 14,
                      color: infoColor,
                    ),
                  )
                ],
              ),
            ),
            Text(
              '${S.current.noi_dung}: ${widget.infoModel.ndCongViec}',
              style: textNormalCustom(
                fontSize: 14,
                color: infoColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
