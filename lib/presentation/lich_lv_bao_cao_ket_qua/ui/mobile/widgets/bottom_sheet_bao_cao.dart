import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/bao_cao_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:ccvc_mobile/widgets/button/button_select_file.dart';
import 'package:ccvc_mobile/widgets/button/solid_button.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
import 'package:flutter/material.dart';

class BaoCaoBottomSheet extends StatefulWidget {
  final BaoCaoModel baoCaoModel;
  const BaoCaoBottomSheet({Key? key,required this.baoCaoModel}) : super(key: key);

  @override
  _BaoCaoBottomSheetState createState() => _BaoCaoBottomSheetState();
}

class _BaoCaoBottomSheetState extends State<BaoCaoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
              onSelectItem: (index) {
                print(index);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.current.noi_dung,
              style: tokenDetailAmount(
                fontSize: 14,
                color: titleItemEdit,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
              TextFieldValidator(
               initialValue: widget.baoCaoModel.content,
             ),
            const SizedBox(height: 24,),

            // SolidButton(
            //   urlIcon: ImageAssets.ic_file,
            //   text: S.current.dinh_kem_file,
            //   onTap: () {},
            // ),
            ButtonSelectFile(title: S.current.tai_lieu_dinh_kem),
            const SizedBox(height: 24,),
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
                  onPressed: () {},
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
