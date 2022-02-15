import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/login/bloc/login_cubit.dart';
import 'package:ccvc_mobile/presentation/reset_password/ui/tablet/send_mail_screen_tablet.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/main_screen.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:ccvc_mobile/widgets/textformfield/form_group.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
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
  final keyGroup = GlobalKey<FormGroupState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: bgQLVBTablet,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: FormGroup(
            key: keyGroup,
            child: Column(
              children: [
                SizedBox(
                  width: 590.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.imgLoginPng)
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 510.0,
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
                      TextFieldValidator(
                        fillColor: backgroundColorApp,
                        controller: textTaiKhoanController,
                        suffixIcon: loginCubit.isHideClearData
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                      textTaiKhoanController.clear();
                                      loginCubit.isHideClearData = false;
                                    },
                                    child: SvgPicture.asset(
                                      ImageAssets.icClearLogin,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        hintText: S.current.account,
                        prefixIcon: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Center(
                            child: SvgPicture.asset(ImageAssets.imgAcount),
                          ),
                        ),
                        onChange: (text) {
                          if (text.isEmpty) {
                            setState(() {});
                            return loginCubit.isHideClearData = false;
                          }
                          setState(() {});
                          return loginCubit.isHideClearData = true;
                        },
                        validator: (value) {
                          return (value ?? '').checkNull();
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldValidator(
                        fillColor: backgroundColorApp,
                        controller: textPasswordController,
                        obscureText: loginCubit.isCheckEye1,
                        suffixIcon: loginCubit.isHideEye1
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                      loginCubit.isCheckEye1 =
                                          !loginCubit.isCheckEye1;
                                    },
                                    child: loginCubit.isCheckEye1
                                        ? SvgPicture.asset(
                                            ImageAssets.imgViewHide,
                                          )
                                        : SvgPicture.asset(ImageAssets.imgView),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        hintText: S.current.password,
                        prefixIcon: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Center(
                            child: SvgPicture.asset(ImageAssets.imgPassword),
                          ),
                        ),
                        onChange: (text) {
                          if (text.isEmpty) {
                            setState(() {});
                            return loginCubit.isHideEye1 = false;
                          }
                          setState(() {});
                          return loginCubit.isHideEye1 = true;
                        },
                        validator: (value) {
                          return (value ?? '').checkNull();
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SendMailScreenTablet(),
                            ),
                          );
                        },
                        child: Text(
                          '${S.current.quen_mat_khau}?',
                          style: textNormalCustom(color: textDefault),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      ButtonCustomBottom(
                        title: S.current.login,
                        isColorBlue: true,
                        onPressed: () async {
                          keyGroup.currentState!.validator();
                          await loginCubit.loginAndSaveinfo(
                              context: context,
                              passWord: textPasswordController.text,
                              userName: textTaiKhoanController.text,
                              appCode: 'APPDIEUHANH');
                          if (loginCubit.isSuccess == true) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainTabBarView(),
                              ),
                            );
                          } else {}
                        },
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: buttonColor.withOpacity(0.1),
                              ),
                              child: Center(
                                child:
                                    SvgPicture.asset(ImageAssets.icFingerprint),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 64,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: buttonColor.withOpacity(0.1),
                              ),
                              child: Center(
                                child: SvgPicture.asset(ImageAssets.icFaceId),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
