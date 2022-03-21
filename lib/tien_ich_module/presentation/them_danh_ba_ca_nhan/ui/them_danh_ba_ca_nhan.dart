import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/them_danh_ba_ca_nhan/widget/chon_anh.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/them_danh_ba_ca_nhan/widget/select_date.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/button/double_button_bottom.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/folow_key_broard/follow_key_broad.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/form_group/form_group.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/radio_button/custom_radio_button.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/textformfield/text_form_field_them_moi.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemDanhBaCaNhan extends StatefulWidget {
  const ThemDanhBaCaNhan({Key? key}) : super(key: key);

  @override
  _ThemDanhBaCaNhanState createState() => _ThemDanhBaCaNhanState();
}

class _ThemDanhBaCaNhanState extends State<ThemDanhBaCaNhan> {
  final keyGroup = GlobalKey<FormGroupState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FollowKeyBoardWidget(
        child: SingleChildScrollView(
          child: FormGroup(
            key: keyGroup,
            child: Column(
              children: [
                spaceH24,
                const AvatarDanhBa(),
                TextFieldStyle(
                  urlIcon: ImageAssets.icEditDb,
                  hintText: S.current.ho_ten_cb,
                  onChange: (value) {},
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return S.current.khong_duoc_de_trong;
                    }
                    return null;
                  },
                ),
                TextFieldStyle(
                  urlIcon: ImageAssets.icLocation,
                  hintText: S.current.dia_diem,
                  onChange: (value) {},
                ),
                SelectDate(
                  leadingIcon: SvgPicture.asset(ImageAssets.icCalenderDb),
                  value: '',
                  onSelectDate: (dateTime) {
                    print("zzz${dateTime}");
                  },
                ),
                TextFieldStyle(
                  urlIcon: ImageAssets.icMessage,
                  hintText: S.current.email,
                  onChange: (value) {},
                ),
                TextFieldStyle(
                  urlIcon: ImageAssets.icCmt,
                  hintText: S.current.so_cmt,
                  onChange: (value) {},
                ),
                TextFieldStyle(
                  urlIcon: ImageAssets.icCalling,
                  hintText: S.current.so_dien_thoai,
                  onChange: (value) {},
                  validator: (value) {
                    return (value ?? '').checkSdt();
                  },
                ),
                TextFieldStyle(
                  urlIcon: ImageAssets.icPhoneCp,
                  hintText: S.current.sdt_co_quan,
                  onChange: (value) {},
                ),
                TextFieldStyle(
                  urlIcon: ImageAssets.icCallDb,
                  hintText: S.current.sdt_nha_rieng,
                  onChange: (value) {},
                ),
                spaceH16,
                CustomRadioButton(
                  title: S.current.gioi_tinh,
                  onchange: (value) {},
                ),
                spaceH16,
                DoubleButtonBottom(
                  onPressed2: () {
                    if (keyGroup.currentState!.validator()) {
                    } else {}
                  },
                  onPressed1: () {
                    Navigator.pop(context);
                  },
                  title2: S.current.luu_danh_ba,
                  title1: S.current.huy,
                ),
                spaceH24
              ],
            ),
          ),
        ),
      ),
    );
  }
}
