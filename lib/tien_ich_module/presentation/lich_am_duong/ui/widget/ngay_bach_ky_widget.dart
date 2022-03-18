import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/lich_am_duong.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NgayBachKyWidget extends StatelessWidget {
  final List<NgayBachKy> listNgayBachKy;

  const NgayBachKyWidget({Key? key, required this.listNgayBachKy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            S.current.ngay_back_ky,
            style: textNormalCustom(
              fontSize: 16.0,
              color: titleColor,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listNgayBachKy.length,
          itemBuilder: (context, index) {
            return titleNgayBachKy(
              listNgayBachKy[index].ten ?? '',
              listNgayBachKy[index].moTa ?? '',
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

Widget titleNgayBachKy(String title, String value, {Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '$title ',
            style: textNormalCustom(
              color: color ?? buttonColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
          ),
          TextSpan(
            text: value,
            style: textNormalCustom(
              fontWeight: FontWeight.w400,
              color: titleColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    ),
  );
}