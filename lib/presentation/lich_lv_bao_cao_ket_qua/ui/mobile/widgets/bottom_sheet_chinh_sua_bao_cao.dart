import 'dart:io';

import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/bao_cao_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:ccvc_mobile/widgets/button/button_select_file.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:ccvc_mobile/widgets/textformfield/block_textview.dart';
import 'package:ccvc_mobile/widgets/textformfield/follow_key_board_widget.dart';
import 'package:flutter/material.dart';

class ChinhSuaBaoCaoBottomSheet extends StatefulWidget {
  final BaoCaoModel baoCaoModel;

  const ChinhSuaBaoCaoBottomSheet({Key? key, required this.baoCaoModel})
      : super(key: key);

  @override
  _ChinhSuaBaoCaoBottomSheetState createState() =>
      _ChinhSuaBaoCaoBottomSheetState();
}

class _ChinhSuaBaoCaoBottomSheetState extends State<ChinhSuaBaoCaoBottomSheet> {
  late TextEditingController controller;
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: widget.baoCaoModel.content);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      padding: const EdgeInsets.only(top: 20),
      child: FollowKeyBoardWidget(
        bottomWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: ButtonCustomBottom(
                    title: S.current.dong,
                    isColorBlue: false,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ButtonCustomBottom(
                    title: S.current.sua,
                    isColorBlue: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    S.current.trang_thai,
                    style: tokenDetailAmount(
                      fontSize: 14,
                      color: titleItemEdit,
                    ),
                  ),
                  const Text(
                    ' *',
                    style: TextStyle(color: canceledColor),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomDropDown(
                value: widget.baoCaoModel.status.getText().text,
                items: [
                  S.current.trung_binh,
                  S.current.dat,
                  S.current.khong_dat,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlockTextView(
                title: S.current.noi_dung,
                contentController: controller,
                formKey: globalKey,
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonSelectFile(
                title: S.current.tai_lieu_dinh_kem,
                onChange: (files) {},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
