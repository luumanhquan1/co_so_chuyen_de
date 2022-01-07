import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/reset_password/ui/reset_password_screen.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:flutter/material.dart';

class SendMailScreen extends StatefulWidget {
  const SendMailScreen({Key? key}) : super(key: key);

  @override
  _SendMailScreenState createState() => _SendMailScreenState();
}

class _SendMailScreenState extends State<SendMailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.dat_lai_mat_khau),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20.0),
                ButtonCustomBottom(
                  isColorBlue: false,
                  title: S.current.tiep_theo,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
