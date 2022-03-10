import 'dart:io';

import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_cubit.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/widgets/button/button_select_file.dart';
import 'package:ccvc_mobile/widgets/button/double_button_bottom.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:ccvc_mobile/widgets/textformfield/follow_key_board_widget.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chon_ngay_widget.dart';

class XemKetLuanHopWidget extends StatefulWidget {
  const XemKetLuanHopWidget({Key? key}) : super(key: key);

  @override
  _XemKetLuanHopWidgetState createState() => _XemKetLuanHopWidgetState();
}

class _XemKetLuanHopWidgetState extends State<XemKetLuanHopWidget> {
  DetailMeetCalenderCubit cubit = DetailMeetCalenderCubit();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: FollowKeyBoardWidget(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        S.current.tinh_trang,
                        style: textNormal(titleItemEdit, 14),
                      ),
                      Text(
                        ' *',
                        style: textNormalCustom(color: canceledColor),
                      ),
                    ],
                  ),
                ),
                CustomDropDown(
                  hint: Text(
                    '${cubit.xemKetLuanHopModel.reportStatus}',
                    style: textNormal(titleItemEdit, 14),
                  ),
                  items: cubit.dataTinhTrangKetLuanHop,
                  onSelectItem: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    S.current.chon_mau_bien_ban,
                    style: textNormal(titleItemEdit, 14),
                  ),
                ),
                CustomDropDown(
                  hint: Text(
                    S.current.mau_bien_ban_1,
                    style: textNormal(titleItemEdit, 14),
                  ),
                  items: cubit.dataMauBienBan,
                  onSelectItem: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    S.current.noi_dung,
                    style: textNormal(titleItemEdit, 14),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(bottom: 8, top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    '${cubit.xemKetLuanHopModel.content}',
                    style: textNormal(titleItemEdit, 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: PickDateWidget(
                    title: S.current.han_xu_ly,
                    minimumDate: DateTime.now(),
                    onChange: (DateTime value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: RichText(
                    text: TextSpan(
                      text: S.current.tong_so_luong_khach,
                      style: textNormal(infoColor, 14),
                      children: const <TextSpan>[
                        TextSpan(
                            text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ),
                TextFieldValidator(
                  hintText: S.current.nhap_so_luong,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: ButtonSelectFile(
                    title: S.current.them_tai_lieu_cuoc_hop,
                    onChange: (List<File> files) {
                      print(files);
                    },
                    files: const [],
                  ),
                ),
                Padding(
                  padding: APP_DEVICE == DeviceType.MOBILE
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.symmetric(horizontal: 100),
                  child: DoubleButtonBottom(
                    title1: S.current.dong,
                    title2: S.current.xac_nhan,
                    onPressed1: () {
                      Navigator.pop(context);
                    },
                    onPressed2: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
