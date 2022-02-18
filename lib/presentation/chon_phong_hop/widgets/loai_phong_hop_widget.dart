import 'package:ccvc_mobile/domain/model/chon_phong_hop_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/input_infor_user/input_info_user_widget.dart';
import 'package:ccvc_mobile/widgets/radio/radio_button.dart';
import 'package:flutter/material.dart';

class LoaiPhongHopWidget extends StatefulWidget {
  final Function(LoaiPhongHopEnum) onChange;

  const LoaiPhongHopWidget({Key? key, required this.onChange})
      : super(key: key);
  @override
  _LoaiPhongHopWidgetState createState() => _LoaiPhongHopWidgetState();
}

class _LoaiPhongHopWidgetState extends State<LoaiPhongHopWidget> {
  @override
  Widget build(BuildContext context) {
    return InputInfoUserWidget(
      title: S.current.loai_phong_hop,
      child: _LoaiPhongHopGroup(
        onChange: widget.onChange,
      ),
    );
  }
}

class _LoaiPhongHopGroup extends StatefulWidget {
  final Function(LoaiPhongHopEnum) onChange;

  const _LoaiPhongHopGroup({Key? key, required this.onChange})
      : super(key: key);
  @override
  __LoaiPhongHopGroupState createState() => __LoaiPhongHopGroupState();
}

class __LoaiPhongHopGroupState extends State<_LoaiPhongHopGroup> {
  LoaiPhongHopEnum selectLoaiPhong = LoaiPhongHopEnum.PHONG_HOP_THUONG;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioButton<LoaiPhongHopEnum>(
          value: LoaiPhongHopEnum.PHONG_HOP_THUONG,
          groupValue: selectLoaiPhong,
          title: S.current.phong_hop_thuong,
          onChange: (value) {
            selectLoaiPhong = value ?? LoaiPhongHopEnum.PHONG_HOP_THUONG;
            widget.onChange(selectLoaiPhong);
            setState(() {});
          },
        ),
        const SizedBox(
          height: 20,
        ),
        RadioButton<LoaiPhongHopEnum>(
          value: LoaiPhongHopEnum.PHONG_TRUNG_TAM_DIEU_HANH,
          groupValue: selectLoaiPhong,
          title: S.current.phong_trung_tam_dieu_hanh,
          onChange: (value) {
            selectLoaiPhong = value ?? LoaiPhongHopEnum.PHONG_HOP_THUONG;
            widget.onChange(selectLoaiPhong);

            setState(() {});
          },
        )
      ],
    );
  }
}