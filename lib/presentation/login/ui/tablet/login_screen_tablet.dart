import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/login/bloc/login_cubit.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_checkbox_tablet.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_textfield_tablet.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/button/tablet/button_custom_bottom_tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginTabletScreen extends StatefulWidget {
  const LoginTabletScreen({Key? key}) : super(key: key);

  @override
  _LoginTabletScreenState createState() => _LoginTabletScreenState();
}

class _LoginTabletScreenState extends State<LoginTabletScreen> {
  LoginCubit loginCubit = LoginCubit();
  TextEditingController textTaiKhoanController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 150, right: 150, top: 100),
                child: Container(
                  color: Colors.red,
                  height: 350,
                  // child: SvgPicture.network(
                  //   'https://ccvc-uat.chinhquyendientu.vn/img/login-v2.72cd8a26.svg',
                  // ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            '${S.current.hello} 👋',
                            style: titleAppbar(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            S.current.wellcom_login,
                            style: textNormal(AqiColor, 16.0.textScale()),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextFieldTablet(
                      isPass: false,
                      textHint: S.current.account,
                      prefixIcon: SvgPicture.asset(ImageAssets.imgAcount),
                      onChange: (text) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldTablet(
                      isPass: true,
                      textHint: S.current.password,
                      prefixIcon: SvgPicture.asset(ImageAssets.imgPassword),
                      onChange: (text) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<bool>(
                      stream: loginCubit.savePassword,
                      builder: (context, snapshot) {
                        final isSave = snapshot.data ?? false;
                        return CustomCheckBoxTablet(
                          title: S.current.save_password,
                          isCheck: isSave,
                          onChange: (data) {
                            loginCubit.setSavePassword(isSave: !data);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonCustomBottomTablet(
                      title: S.current.login,
                      isColorBlue: true,
                      onPressed: () {
                        key.currentState?.validate();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
