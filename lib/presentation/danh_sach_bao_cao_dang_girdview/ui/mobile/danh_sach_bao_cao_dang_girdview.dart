import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/mobile/base_app_bar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DanhSachBaoCaoDangGirdview extends StatefulWidget {
  const DanhSachBaoCaoDangGirdview({Key? key}) : super(key: key);

  @override
  _DanhSachBaoCaoDangGirdviewState createState() =>
      _DanhSachBaoCaoDangGirdviewState();
}

class _DanhSachBaoCaoDangGirdviewState
    extends State<DanhSachBaoCaoDangGirdview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarMobile(
        title: S.current.bac_cao,
        actions: [
          Container(
            color: Colors.yellow,
            child: SvgPicture.asset(ImageAssets.icGridView),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(top: 16, left: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: backgroundColorApp,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                  border: Border.all(color: borderItemCalender),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(ImageAssets.icItemGridView),
                    Text('báo cáo 1')
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
