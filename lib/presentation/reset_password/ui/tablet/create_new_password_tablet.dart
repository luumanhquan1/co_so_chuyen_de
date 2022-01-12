import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_textfield.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'change_success_password_tablet.dart';

class CreateNewPassWordTablet extends StatefulWidget {
  const CreateNewPassWordTablet({Key? key}) : super(key: key);

  @override
  _CreateNewPassWordTabletState createState() =>
      _CreateNewPassWordTabletState();
}

class _CreateNewPassWordTabletState extends State<CreateNewPassWordTablet> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarDefaultBack(S.current.dat_lai_mat_khau),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150.0),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  const SizedBox(height: 80.0),
                  Text(
                    S.current.tao_mk_moi_cho,
                    style: textNormalCustom(color: titleColor, fontSize: 20.0),
                  ),
                  const SizedBox(height: 28.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${S.current.account}:',
                        style: textNormalCustom(color: titleColor,fontSize: 16.0),
                      ),
                      Text(
                        'hungto228@gmail.com',
                        style: textNormalCustom(color: textDefault,fontSize: 16.0),
                      ),
                    ],
                  ),

                  const SizedBox(height: 48.0),
                  CustomTextField(
                    isPass: true,
                    textHint: S.current.mat_khau_moi,
                    prefixIcon: SvgPicture.asset(ImageAssets.icLock),
                    onChange: (text) {},
                  ),
                  const SizedBox(height: 24.0),
                  CustomTextField(
                    isPass: true,
                    textHint: S.current.nhap_lai_mat_khau,
                    prefixIcon: SvgPicture.asset(ImageAssets.icLock),
                    onChange: (text) {},
                  ),
                  const SizedBox(height: 36.0),
                  ButtonCustomBottom(
                    isColorBlue: false,
                    title: S.current.tiep_theo,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ChangeSuccessPasswordTablet(),
                        ),
                        (Route<dynamic> route) => route.isFirst,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
