import 'package:ccvc_mobile/config/resources/color.dart';


import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/domain/model/home/press_network_model.dart';
import 'package:ccvc_mobile/home_module/presentation/home_screen/ui/widgets/bao_chi_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/title_item.dart';
import 'package:ccvc_mobile/presentation/webview/web_view_screen.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class BaoChiMangXaHoiWidget extends StatelessWidget {
  final String time;
  final List<PressNetWorkModel> listData;

  const BaoChiMangXaHoiWidget(
      {Key? key, required this.time, required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.textScale(),
        vertical: 10.0.textScale(),
      ),
      margin: EdgeInsets.only(top: 6.0.textScale()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleItem(
            title: S.current.press_socialNetWord,
            time: time,
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
