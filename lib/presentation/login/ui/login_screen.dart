import 'package:ccvc_mobile/presentation/login/bloc/login_cubit.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_checkbox.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit loginCubit = LoginCubit();
  TextEditingController textTaiKhoanController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 84,
          horizontal: 16,
        ),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: SvgPicture.network(
                  'https://ccvc-uat.chinhquyendientu.vn/img/login-v2.72cd8a26.svg',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                isPass: false,
                textHint: 'Tai Khoan',
                controller: textTaiKhoanController,
                loginCubit: loginCubit,
                prefixIcon: const Icon(Icons.people),
                onChange: (text) {
                  if (text.isEmpty) {
                    loginCubit.getShowEmptyTextTaiKhoan(isShow: true);
                  } else {
                    loginCubit.getShowEmptyTextTaiKhoan(isShow: false);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                isPass: true,
                textHint: 'Mat Khau',
                loginCubit: loginCubit,
                controller: textPasswordController,
                prefixIcon: const Icon(Icons.people),
                onChange: (text) {
                  if (text.isEmpty) {
                    loginCubit.getShowEmptyTextPassword(isShow: true);
                  } else {
                    loginCubit.getShowEmptyTextPassword(isShow: false);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<bool>(
                stream: loginCubit.savePassword,
                builder: (context, snapshot) {
                  final isSave = snapshot.data ?? false;
                  return CustomCheckBox(
                    title: 'Ghi nho dang nhap',
                    isCheck: isSave,
                    onChange: (data) {
                      loginCubit.setSavePassword(isSave: !data);
                    },
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  key.currentState?.validate();
                },
                child: Container(
                  height: 30,
                  width: 100,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
