import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/thong_bao/ui/mobile/thong_bao_screen.dart';
import 'package:ccvc_mobile/presentation/thong_bao/ui/thong_bao_type.dart';
import 'package:ccvc_mobile/presentation/webview/web_view_screen.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class ItemThongBaoMobile extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String time;
  final bool status;

  const ItemThongBaoMobile({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0.textScale()),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(image),
              SizedBox(
                width: 16.0.textScale(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textNormalCustom(
                        color: titleColor,
                        fontSize: 16.0.textScale(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 4.0.textScale(),
                    ),
                    if (ThongBaoInherted.of(context)
                            .thongBaoCubit
                            .typeContent(title) ==
                        ThongBaoType.TinNhanMoi)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.vao_hop_truc_tuyen,
                            style: textNormalCustom(
                              color: titleColumn,
                              fontSize: 14.0.textScale(),
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3.0.textScale(),),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => WebViewScreen(
                                    title: '',
                                    url: content,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              content,
                              style: textNormalCustom(
                                color: textColorMangXaHoi,
                                fontSize: 14.0.textScale(),
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    else
                      Text(
                        content,
                        style: textNormalCustom(
                          color: titleColumn,
                          fontSize: 14.0.textScale(),
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    SizedBox(
                      height: 10.0.textScale(),
                    ),
                    Text(
                      time,
                      style: textNormalCustom(
                        color: AqiColor,
                        fontSize: 14.0.textScale(),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              if (status)
                Container()
              else
                const Icon(
                  Icons.circle,
                  size: 8,
                  color: textColorMangXaHoi,
                ),
            ],
          ),
          SizedBox(
            height: 16.0.textScale(),
          ),
          Container(
            height: 1,
            width: double.maxFinite,
            color: bgDropDown,
          )
        ],
      ),
    );
  }
}
