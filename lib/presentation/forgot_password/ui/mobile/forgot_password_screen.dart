import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/forgot_password/bloc/forgot_password_cubit.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_textfield_password.dart';
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
                  child: CustomTextFieldPassWord(
                    controller: matKhauHienTaiController,
                    isInput: cubit.isHideEye,
                    onPressSuffix: () {
                      setState(() {});
                      cubit.isCheckEye = !cubit.isCheckEye;
                    },
                    obscureText: cubit.isCheckEye,
                    suffixIcon: cubit.isCheckEye
                        ? SvgPicture.asset(ImageAssets.imgViewHide)
                        : SvgPicture.asset(ImageAssets.imgView),
                    textHint: S.current.mat_khau_hien_tai,
                    prefixIcon: SvgPicture.asset(ImageAssets.icShieldDone),
                    onChange: (text) {
                      keytextmatKhauHienTai.currentState?.validate();
                      if (text.isEmpty) {
                        setState(() {});
                        return cubit.isHideEye = false;
                      }
                      setState(() {});
                      return cubit.isHideEye = true;
                    },
                    validate: (value) {
                      return cubit.validateInputText(value!);
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Form(
                  key: keytextmatKhauMoi,
                  child: CustomTextFieldPassWord(
                    controller: matKhauMoiController,
                    isInput: cubit.isHideEye1,
                    onPressSuffix: () {
                      setState(() {});
                      cubit.isCheckEye1 = !cubit.isCheckEye1;
                    },
                    obscureText: cubit.isCheckEye1,
                    suffixIcon: cubit.isCheckEye1
                        ? SvgPicture.asset(ImageAssets.imgViewHide)
                        : SvgPicture.asset(ImageAssets.imgView),
                    textHint: S.current.mat_khau_moi,
                    prefixIcon: SvgPicture.asset(ImageAssets.icLock),
                    onChange: (text) {
                      keytextmatKhauMoi.currentState?.validate();
                      if (text.isEmpty) {
                        setState(() {});
                        return cubit.isHideEye1 = false;
                      }
                      setState(() {});
                      return cubit.isHideEye1 = true;
                    },
                    validate: (value) {
                      return cubit.validateInputText(value!);
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Form(
                  key: keytextnhapLaiMatKhau,
                  child: CustomTextFieldPassWord(
                    controller: nhapLaiMatKhauController,
                    isInput: cubit.isHideEye2,
                    onPressSuffix: () {
                      setState(() {});
                      cubit.isCheckEye2 = !cubit.isCheckEye2;
                    },
                    obscureText: cubit.isCheckEye2,
                    suffixIcon: cubit.isCheckEye2
                        ? SvgPicture.asset(ImageAssets.imgViewHide)
                        : SvgPicture.asset(ImageAssets.imgView),
                    textHint: S.current.nhap_lai_mat_khau,
                    prefixIcon: SvgPicture.asset(ImageAssets.icLock),
                    onChange: (text) {
                      keytextnhapLaiMatKhau.currentState?.validate();
                      if (text.isEmpty) {
                        setState(() {});
                        return cubit.isHideEye2 = false;
                      }
                      setState(() {});
                      return cubit.isHideEye2 = true;
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
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const SendMailScreen(),
                      ),
                          (Route<dynamic> route) => route.isFirst,
                    );
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const SendMailScreen(),
                    //   ),
                    // );
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
    );
  }
}
