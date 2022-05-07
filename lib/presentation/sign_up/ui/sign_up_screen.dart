import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/textformfield/form_group.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final keyGroup = GlobalKey<FormGroupState>();

  @override
  Widget build(BuildContext context) {
    // return FormGroup(
    //   child: Center(
    //     child: Column(
    //       children: [
    //         Text(
    //           S.current.wellcom_login,
    //           style: textNormal(AqiColor, 14),
    //         ),
    //         const SizedBox(
    //           height: 12,
    //         ),
    //         TextFieldValidator(
    //           controller: textTaiKhoanController,
    //           hintText: S.current.account,
    //           prefixIcon: SizedBox(
    //             width: 20.0,
    //             height: 20.0,
    //             child: Center(
    //               child: SvgPicture.asset(ImageAssets.imgAcount),
    //             ),
    //           ),
    //           onChange: (text) {
    //             if (text.isEmpty) {
    //               setState(() {});
    //             }
    //             setState(() {});
    //           },
    //           validator: (value) {
    //             return (value ?? '').checkNull();
    //           },
    //         ),
    //         const SizedBox(
    //           height: 16,
    //         ),
    //         TextFieldValidator(
    //           obscureText: loginCubit.isCheckEye1,
    //           suffixIcon: loginCubit.isHideEye1
    //               ? SizedBox(
    //                   width: 20,
    //                   height: 20,
    //                   child: Center(
    //                     child: GestureDetector(
    //                       onTap: () {
    //                         setState(() {});
    //                         loginCubit.isCheckEye1 = !loginCubit.isCheckEye1;
    //                       },
    //                       child: loginCubit.isCheckEye1
    //                           ? SvgPicture.asset(ImageAssets.imgView)
    //                           : SvgPicture.asset(
    //                               ImageAssets.imgViewHide,
    //                             ),
    //                     ),
    //                   ),
    //                 )
    //               : const SizedBox(),
    //           hintText: S.current.password,
    //           prefixIcon: SizedBox(
    //             width: 20.0,
    //             height: 20.0,
    //             child: Center(
    //               child: SvgPicture.asset(ImageAssets.imgPassword),
    //             ),
    //           ),
    //           onChange: (text) {
    //             if (text.isEmpty) {
    //               setState(() {});
    //               return loginCubit.isHideEye1 = false;
    //             }
    //             setState(() {});
    //             return loginCubit.isHideEye1 = true;
    //           },
    //           validator: (value) {
    //             return (value ?? '').checkNull();
    //           },
    //         ),
    //         const SizedBox(
    //           height: 35,
    //         ),
    //         ButtonCustomBottom(
    //           title: S.current.login,
    //           isColorBlue: true,
    //           onPressed: () async {
    //             if (keyGroup.currentState!.validator()) {
    //               User? user = await signInUsingEmailPassword(
    //                 email: textTaiKhoanController.text,
    //                 password: textPasswordController.text,
    //                 context: context,
    //               );
    //               if (user != null) {
    //                 await Navigator.of(context).pushReplacement(
    //                   MaterialPageRoute(
    //                     builder: (context) => MainTabBarView(),
    //                   ),
    //                 );
    //               }
    //             } else {}
    //
    //             if (loginCubit.passIsError == true) {
    //               _showToast(context);
    //             }
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Container();
  }
}
