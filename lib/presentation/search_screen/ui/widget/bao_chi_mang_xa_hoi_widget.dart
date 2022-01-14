import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/home/press_network_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/bao_chi_widget.dart';
import 'package:ccvc_mobile/presentation/webview/web_view_screen.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class BaoChiMangXaHoiWidget extends StatelessWidget {
  String time;
  List<PressNetWorkModel> listData;

  BaoChiMangXaHoiWidget({Key? key, required this.time, required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: 16.0.textScale(), vertical: 10.0.textScale()),
      margin: EdgeInsets.only(top: 6.0.textScale()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0.textScale(),
          ),
          Text(
            S.current.press_socialNetWord,
            style: textNormalCustom(
              fontSize: 16.0.textScale(),
              fontWeight: FontWeight.w500,
              color: titleCalenderWork,
            ),
          ),
          SizedBox(
            height: 3.0.textScale(),
          ),
          Text(
            time,
            style: textNormalCustom(
              fontSize: 12.0.textScale(),
              fontWeight: FontWeight.w400,
              color: textBodyTime,
            ),
          ),
          Column(
            children: List.generate(listData.length, (index) {
              final result = listData[index];
              return Padding(
                padding: EdgeInsets.only(top: 16.0.textScale()),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => WebViewScreen(
                          title: '',
                          url: result.url,
                        ),
                      ),
                    );
                  },
                  child: BaoChiWidget(
                    data: result,
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
