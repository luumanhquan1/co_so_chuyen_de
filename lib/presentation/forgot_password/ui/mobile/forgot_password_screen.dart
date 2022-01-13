import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/forgot_password/bloc/forgot_password_cubit.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_textfield.dart';
import 'package:ccvc_mobile/presentation/reset_password/ui/mobile/send_mail_screen.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/button/double_button_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPassWordScreenState createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {
  ForgotPasswordCubit cubit = ForgotPasswordCubit();
  TextEditingController matKhauHienTaiController = TextEditingController();
  TextEditingController matKhauMoiController = TextEditingController();
  TextEditingController nhapLaiMatKhauController = TextEditingController();
  final keytextmatKhauHienTai = GlobalKey<FormState>();
  final keytextmatKhauMoi = GlobalKey<FormState>();
  final keytextnhapLaiMatKhau = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarDefaultBack(S.current.doi_mat_khau),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: SvgPicture.asset(ImageAssets.icImageChangePassword),
                ),
                const SizedBox(height: 10.0),
                Form(
                  key: keytextmatKhauHienTai,
                  child: CustomTextField(
                    controller: matKhauHienTaiController,
                    isPass: true,
                    textHint: S.current.mat_khau_hien_tai,
                    prefixIcon: SvgPicture.asset(ImageAssets.icShieldDone),
                    onChange: (text) {
                      keytextmatKhauHienTai.currentState?.validate();
                    },
                    validate: (value) {
                      return cubit.validateInputText(value!);
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Form(
                  key: keytextmatKhauMoi,
                  child: CustomTextField(
                    controller: matKhauMoiController,
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
                const SizedBox(height: 16.0),
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
                      return cubit.validateInputText(value!);
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SendMailScreen(),
                      ),
                    );
                  },
                  child: Text(
                    S.current.quen_mat_khau,
                    style: textNormalCustom(color: textDefault),
                  ),
                ),
                const SizedBox(height: 20.0),
                DoubleButtonBottom(
                  title1: S.current.cancel,
                  title2: S.current.cap_nhat,
                  onPressed1: () {
                    Navigator.of(context).pop();
                  },
                  onPressed2: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
