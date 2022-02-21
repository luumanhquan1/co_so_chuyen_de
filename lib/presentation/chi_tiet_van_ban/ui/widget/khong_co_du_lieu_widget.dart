import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class KhongCoDuLieuWidget extends StatelessWidget {
  const KhongCoDuLieuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return  SizedBox(
      height: 200,
      child: Center(
        child: Text(S.current.khong_co_du_lieu),
      ),
    );
  }
}
