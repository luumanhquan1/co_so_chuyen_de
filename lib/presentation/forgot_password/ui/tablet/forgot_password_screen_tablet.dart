import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/forgot_password/bloc/forgot_password_cubit.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_textfield.dart';
import 'package:ccvc_mobile/presentation/reset_password/ui/tablet/send_mail_screen_tablet.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/button/double_button_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ForgotPassWordScreenTablet extends StatefulWidget {
  const ForgotPassWordScreenTablet({Key? key}) : super(key: key);

  @override
  _ForgotPassWordScreenTabletState createState() =>
      _ForgotPassWordScreenTabletState();
}

class _ForgotPassWordScreenTabletState
    extends State<ForgotPassWordScreenTablet> {
  ForgotPasswordCubit cubit = ForgotPasswordCubit();
  TextEditingController matKhauHienTaiController = TextEditingController();
  TextEditingController matKhauMoiController = TextEditingController();
  TextEditingController nhapLaiMatKhauController = TextEditingController();
  final keytextmatKhauHienTai = GlobalKey<FormState>();
  final keytextmatKhauMoi = GlobalKey<FormState>();
  final keytextnhapLaiMatKhau = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarDefaultBack(S.current.doi_mat_khau),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 510.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 400.0,
                    child: Center(
                      child: SvgPicture.asset(
                        ImageAssets.icImageChangePasswordTablet,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                    key: keytextmatKhauHienTai,
                    child: CustomTextField(
                      controller: matKhauHienTaiController,
                      isPass: true,
                      textHint: S.current.mat_khau_hien_tai,
                      prefixIcon: SvgPicture.asset(ImageAssets.icShieldDone),
                      sizeWith: 500.0,
                      onChange: (text) {
                        keytextmatKhauHienTai.currentState?.validate();
                      },
                      validate: (value) {
                        return cubit.validateInputText(value!);
                      },
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Form(
                    key: keytextmatKhauMoi,
                    child: CustomTextField(
                      controller: matKhauMoiController,
                      sizeWith: 502.0,
                      isPass: true,
                      textHint: S.current.mat_khau_moi,
                      prefixIcon: SvgPicture.asset(ImageAssets.icLock),
                      onChange: (text) {
                        keytextmatKhauMoi.currentState?.validate();
                      },
                      validate: (value) {
                        return cubit.validateInputText(value!);
                      },
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Form(
                    key: keytextnhapLaiMatKhau,
                    child: CustomTextField(
                      controller: nhapLaiMatKhauController,
                      isPass: true,
                      textHint: S.current.nhap_lai_mat_khau,
                      prefixIcon: SvgPicture.asset(ImageAssets.icLock),
                      onChange: (text) {
                        keytextnhapLaiMatKhau.currentState?.validate();
                      },
                      validate: (value) {
                        if (value != matKhauMoiController.value.text &&
                            value!.isNotEmpty) {
                          return S.current.khong_trung_mat_khau_moi;
                        } else {
                          return cubit.validateInputText(value!);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SendMailScreenTablet(),
                        ),
                      );
                    },
                    child: Text(
                      S.current.quen_mat_khau,
                      style: textNormalCustom(
                        color: textDefault,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  DoubleButtonBottom(
                    title1: S.current.cancel,
                    title2: S.current.cap_nhat,
                    onPressed1: () {
                      Navigator.of(context).pop();
                    },
                    onPressed2: () {
                      keytextmatKhauMoi.currentState?.validate();
                      keytextnhapLaiMatKhau.currentState?.validate();
                      keytextmatKhauHienTai.currentState?.validate();
                      if (matKhauHienTaiController.value.text.isNotEmpty &&
                          matKhauMoiController.value.text.isNotEmpty &&
                          nhapLaiMatKhauController.value.text.isNotEmpty &&
                          matKhauMoiController.value.text ==
                              nhapLaiMatKhauController.value.text) {
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
