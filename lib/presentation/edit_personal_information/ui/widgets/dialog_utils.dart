import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

class DialogUtils {
  static final DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static Future<void> showDialogDelete(BuildContext context,
      {required String title,
        required Widget icon,
        String okBtnText = 'Đồng ý',
        String cancelBtnText = 'Bỏ qua',
        required Function okBtnFunction}) async {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 21, top: 21),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_x.svg',
                        height: 14,
                        width: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                icon,
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: btnActionWidget(
                            context: context,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            text: cancelBtnText,
                            backgroundColor: Colors.transparent,
                            colorText: const Color(0xffDB353A)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: btnActionWidget(
                            context: context,
                            onTap: () {
                              Navigator.pop(context);
                              okBtnFunction();
                            },
                            text: okBtnText,
                            backgroundColor: const Color(0xffDB353A),
                            colorText: const Color(0xffFFFFFF)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget btnActionWidget(
      {required BuildContext context,
        required Function() onTap,
        required String text,
        required Color backgroundColor,
        required Color colorText}) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(60)),
      onTap: onTap,
      child: Ink(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              border: Border.all(color: const Color(0xffDB353A), width: 1)),
          child: Text(
            text,
            style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                fontSize: 16, fontWeight: FontWeight.w500, color: colorText),
          ),
        ),
      ),
    );
  }

  static Future<void> showDialogSetting(
      BuildContext context, {
        String okBtnText = 'Mở cài đặt',
        String cancelBtnText = 'Bỏ qua',
      }) async {
    final Widget okButton = TextButton(
      child: Text(
        'Mở cài đặt',
        style:
        Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red),
      ),
      onPressed: () {
        Navigator.pop(context);
        openAppSettings();
      },
    );

    final Widget cancelBtnText = TextButton(
      child: Text(
        'Bỏ qua',
        style:
        Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      title: Text('Bạn cần mở quyền truy cập ứng dụng',
          style: Theme.of(context).textTheme.headline4),
      actions: [okButton, cancelBtnText],
    );

    return showDialog(
      context: context,
      builder: (_) {
        return alert;
      },
    );
  }
}