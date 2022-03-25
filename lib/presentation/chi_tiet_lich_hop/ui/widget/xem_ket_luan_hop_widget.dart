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
import 'package:flutter_html/flutter_html.dart';
import 'chon_ngay_widget.dart';
import 'edit_ket_luan_hop_screen.dart';

class XemKetLuanHopWidget extends StatefulWidget {
  final DetailMeetCalenderCubit cubit;

  const XemKetLuanHopWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  _XemKetLuanHopWidgetState createState() => _XemKetLuanHopWidgetState();
}

class _XemKetLuanHopWidgetState extends State<XemKetLuanHopWidget> {
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
                StreamBuilder<List<String>>(
                    stream: widget.cubit.dataTinhTrangKetLuanHop,
                    builder: (context, snapshot) {
                      return CustomDropDown(
                        hint: Text(
                          '${widget.cubit.xemKetLuanHopModel.reportStatus ?? ''}',
                          style: textNormal(titleItemEdit, 14),
                        ),
                        items: snapshot.data ?? [],
                        onSelectItem: (value) {},
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    S.current.chon_mau_bien_ban,
                    style: textNormal(titleItemEdit, 14),
                  ),
                ),
                StreamBuilder<List<String>>(
                    stream: widget.cubit.dataMauBienBan,
                    builder: (context, snapshot) {
                      return CustomDropDown(
                        hint: Text(
                          widget.cubit.dataMauBienBan.value.last,
                          style: textNormal(titleItemEdit, 14),
                        ),
                        items: snapshot.data ?? [],
                        onSelectItem: (value) {
                          widget.cubit.getValueMauBienBan(value);
                        },
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    S.current.noi_dung,
                    style: textNormal(titleItemEdit, 14),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditKetLuanHopScreen(
                          key: keyEditKetLuanHop,
                          cubit: widget.cubit,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    padding: const EdgeInsets.only(
                        bottom: 8, top: 10, left: 8, right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SingleChildScrollView(
                      child: StreamBuilder<String>(
                        stream: widget.cubit.noiDung,
                        builder: (context, snapshot) {
                          return widget.cubit.valueEdit != snapshot.data
                              ? Html(
                                  data: snapshot.data ?? '',
                                )
                              : Html(
                                  data: widget.cubit.valueEdit,
                                );
                        },
                      ),
                    ),
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
