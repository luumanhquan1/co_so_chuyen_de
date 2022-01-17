import 'package:flutter/material.dart';

void showDiaLogFeature(BuildContext context,
    {required String title,
    required Widget child,
    String btnRightTxt = 'Cập Nhật',
    String btnLeftTxt = 'Xem trước',
    bool isBottomShow = true,
    required Function funcBtnOk}) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Theme.of(context).primaryColor,
        insetPadding: const EdgeInsets.symmetric(horizontal: 50),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        clipBehavior: Clip.antiAlias,
        child: DiaLogFeatureWidget(
          title: title,
          btnLeftTxt: btnLeftTxt,
          btnRightTxt: btnRightTxt,
          funcBtnOk: funcBtnOk,
          isBottomShow: isBottomShow,
          child: child,
        ),
      );
    },
  );
}

class DiaLogFeatureWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final String btnRightTxt;
  final String btnLeftTxt;
  final Function funcBtnOk;
  final bool isBottomShow;

  const DiaLogFeatureWidget(
      {Key? key,
      required this.title,
      required this.child,
      required this.btnLeftTxt,
      required this.btnRightTxt,
      required this.funcBtnOk,
      required this.isBottomShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 629),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 56,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffEDF0FD),
                  ),
                ),
              ),
              padding: const EdgeInsets.only(left: 28, right: 19),
              child: Stack(
                children: [
                  Align(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xffA2AEBD),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
