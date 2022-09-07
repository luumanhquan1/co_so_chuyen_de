import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_const.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_store.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/login/bloc/login_cubit.dart';
import 'package:ccvc_mobile/presentation/otp/bloc/otp_cubit.dart';
import 'package:ccvc_mobile/presentation/otp/ui/verify_otp_screen.dart';
import 'package:ccvc_mobile/presentation/sign_up/bloc/sign_up_cubit.dart';
import 'package:ccvc_mobile/presentation/sign_up/ui/create_user_screen.dart';
import 'package:ccvc_mobile/presentation/sign_up/ui/sign_up_screen.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/main_screen.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:ccvc_mobile/widgets/textformfield/form_group.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPhoneNumberScreen extends StatefulWidget {
  const RegisterPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPhoneNumberScreen> createState() =>
      _RegisterPhoneNumberScreenState();
}

class _RegisterPhoneNumberScreenState extends State<RegisterPhoneNumberScreen> {
  OtpCubit otpCubit = OtpCubit();
  TextEditingController phoneController = TextEditingController();
  final keyGroup = GlobalKey<FormGroupState>();

  @override
  void initState() {
    super.initState();
    otpCubit.closeDialog();
  }

  @override
  Widget build(BuildContext context) {
    return StateStreamLayout(
      textEmpty: S.current.khong_co_du_lieu,
      retry: () {},
      error: AppException('', S.current.something_went_wrong),
      stream: otpCubit.stateStream,
      child: StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 60, left: 16.0, right: 16.0),
                  child: FormGroup(
                    key: keyGroup,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                ImageAssets.imgLoginPng,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Đăng ký số điện thoại',
                                style: titleAppbar(),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Vui lòng nhập số điện thoại của bạn',
                                style: textNormal(AqiColor, 14),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextFieldValidator(
                                controller: phoneController,
                                textInputType: TextInputType.number,
                                maxLength: 9,
                                validator: (value) {
                                  //    String pattern = r'(^(?:[+0]9)?[0-9]{9}$)';
                                  String pattern =
                                      '(^([3|5|7|8|9])+([0-9]{8}))';
                                  RegExp regExp = RegExp(pattern);
                                  if (value == null || value.isEmpty) {
                                    return 'Số điện thoại không được để trống';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Số điện thoại đã nhập không đúng định dạng';
                                  }
                                  return null;
                                },
                                prefixIcon: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                    child: Text(
                                      '(+84)',
                                      style: tokenDetailAmount(
                                        fontSize: 14.0.textScale(),
                                        color: titleColor,
                                      ),
                                    ),
                                  ),
                                ),
                                onChange: (text) {
                                  if (text.isEmpty) {}
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              ButtonCustomBottom(
                                title: "Gửi mã OTP",
                                isColorBlue: true,
                                onPressed: () async {
                                  if (keyGroup.currentState!.validator()) {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyOtpScreen(
                                                  phoneNumber:
                                                      "+84${phoneController.text}",
                                                )));
                                    //   final User? user = await registerPhoneNumberCubit.lognIn(
                                    //     fullNameController.text.trim(),
                                    //     textPasswordController.text.trim(),
                                    //   );
                                    //   if (user != null) {
                                    //     await PrefsService.saveUserId(user.uid);
                                    //     if (registerPhoneNumberCubit.isUserModel) {
                                    //       await Navigator.of(context)
                                    //           .pushReplacement(
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //           const MainTabBarView(),
                                    //         ),
                                    //       );
                                    //     } else {
                                    //       await Navigator.of(context)
                                    //           .pushReplacement(
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               CreateUserScreen(
                                    //                 email: user.email ?? '',
                                    //                 cubit: SignUpCubit(),
                                    //               ),
                                    //         ),
                                    //       );
                                    //     }
                                    //   } else {
                                    //     _showToast(
                                    //       context: context,
                                    //       text: EXCEPTION_LOGIN,
                                    //     );
                                    //   }
                                    // } else {
                                    //   _showToast(
                                    //     context: context,
                                    //   );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showToast({required BuildContext context, String? text}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text ?? S.current.dang_nhap_that_bai),
      ),
    );
  }
}
