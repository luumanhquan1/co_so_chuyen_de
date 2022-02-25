import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_only_widget.dart';
import 'package:flutter/material.dart';

class CongTacChuanBiWidget extends StatelessWidget {
  const CongTacChuanBiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyWidget(
      child: body(),
      header: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.transparent,
              child: Text(
                S.current.cong_tac_chuan_bi,
                style: textNormalCustom(color: titleColumn, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleType(
            title: S.current.thong_tin_phong, child: ThongTinPhongWidget()),
        titleType(
            title: S.current.thong_tin_phong,
            child: ThongTinYeuCauThietBiWidget()),
      ],
    );
  }

  Widget titleType({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textNormalCustom(color: infoColor, fontSize: 14),
        ),
        spaceH16,
        child
      ],
    );
  }
}

class ThongTinPhongWidget extends StatelessWidget {
  const ThongTinPhongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

        ],
      ),
    );
  }
}

class ThongTinYeuCauThietBiWidget extends StatelessWidget {
  const ThongTinYeuCauThietBiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
