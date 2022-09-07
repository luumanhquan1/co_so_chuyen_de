import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_const.dart';
import 'package:ccvc_mobile/data/helper/firebase/firebase_store.dart';
import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/login/bloc/login_cubit.dart';
import 'package:ccvc_mobile/presentation/otp/bloc/otp_cubit.dart';
import 'package:ccvc_mobile/presentation/sign_up/bloc/sign_up_cubit.dart';
import 'package:ccvc_mobile/presentation/sign_up/ui/create_user_screen.dart';
import 'package:ccvc_mobile/presentation/sign_up/ui/sign_up_screen.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/main_screen.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:ccvc_mobile/widgets/textformfield/form_group.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
import 'package:ccvc_mobile/widgets/views/state_layout.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  OtpCubit _otpCubit = OtpCubit();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final keyGroup = GlobalKey<FormGroupState>();

  @override
  void initState() {
    super.initState();
    _otpCubit.closeDialog();
    initSmsListener();
    _otpCubit.verifyPhoneNumber(widget.phoneNumber);
  }

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  String _comingSms = 'Unknown';

  Future<void> initSmsListener() async {
    debugPrint('tttttttt');
    String comingSms;
    try {
      comingSms = await AltSmsAutofill().listenForSms ?? '';
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;
    setState(() {
      _comingSms = comingSms;
      debugPrint("====>Message: ${_comingSms}");
      debugPrint("${_comingSms[0]}");
      otpController.text = _comingSms[0] + _comingSms[1] + _comingSms[2] + _comingSms[3]
          + _comingSms[4] + _comingSms[5];
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _otpCubit.stateStream,
      builder: (context, state) {
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
                      state == StateLayout.showLoading?
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Xác thực',
                                  style: titleAppbar(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Mã OTP đang được gửi đến số điện thoại: ${widget.phoneNumber.substring(0,5)}****${widget.phoneNumber.substring(9,12)}",
                                  style: textNormal(AqiColor, 14),
                                ),
                              ],
                            ),
                          )
                          :
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Xác thực',
                              style: titleAppbar(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                            "Mã OTP đã được gửi đến số điện thoại: ${widget.phoneNumber.substring(0,5)}****${widget.phoneNumber.substring(9,12)}",
                              style: textNormal(AqiColor, 14),
                            ),



                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:

                              PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 6,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(10),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    inactiveFillColor: Colors.white,
                                    inactiveColor: Colors.black12,
                                    selectedColor: colorPrimary,
                                    selectedFillColor: Colors.white,
                                    activeFillColor: Colors.white,
                                    activeColor: colorPrimary
                                ),
                                cursorColor: Colors.black,
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                controller: otpController,
                                keyboardType: TextInputType.number,

                                onCompleted: (v) {
                                  //do something or move to next screen when code complete
                                },
                                onChanged: (value) {
                                  // print(value);
                                  // setState(() {
                                  //   print('$value');
                                  // });
                                },
                              ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     _textFieldOTP(first: true, last: false),
                                  //     _textFieldOTP(first: false, last: false),
                                  //     _textFieldOTP(first: false, last: false),
                                  //     _textFieldOTP(first: false, last: false),
                                  //     _textFieldOTP(first: false, last: false),
                                  //     _textFieldOTP(first: false, last: true),
                                  //   ],
                                  // ),


                            ),
                            ButtonCustomBottom(
                              title: S.current.login,
                              isColorBlue: true,
                              onPressed: () async {
                                if (keyGroup.currentState!.validator()) {
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
                            const SizedBox(
                              height: 30,
                            ),

                            Center(
                              child: Text(
                                "Bạn không nhận được mã OTP?",
                                style: textNormal(AqiColor, 14),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),

                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //     const SignUpScreen(),
                                //   ),
                                // );
                              },
                              child: Center(
                                child: Text(
                                  'Gửi lại mã OTP',
                                  style: textNormalCustom(
                                    color: colorPrimary,

                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
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

      }
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

Widget _textFieldOTP({required bool first, last}) {
  return Container(
    height: 50,
    child: AspectRatio(
      aspectRatio: 1.0,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: titleText(color: Colors.black).copyWith(height: 0.8),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: colorPrimary),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
  );
}
}
