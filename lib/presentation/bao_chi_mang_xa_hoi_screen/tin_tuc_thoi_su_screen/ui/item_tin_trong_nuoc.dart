import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemTinTrongNuoc extends StatelessWidget {
  String imgTitle;
  String imgContent;
  String title;
  String content;
  String date;

  ItemTinTrongNuoc(
      {Key? key,
      required this.imgTitle,
      required this.imgContent,
      required this.title,
      required this.content,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.12),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: const Color(0xFFDBDFEF).withOpacity(0.5), width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      imgTitle,
                      fit: BoxFit.cover,

                    ),
                  )),
              Expanded(
                flex: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textNormalCustom(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: indicatorColor),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.date_range,
                            color: Color(0xFFDADADA),
                          ),
                          Text(
                            date,
                            style: textNormalCustom(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: dateColor,
                            ),
                          ),

                          const SizedBox(width: 30,),

                          SvgPicture.asset(ImageAssets.icPlay,)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
              child: Image.network(imgContent)),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            style: textNormalCustom(
                color: titleColor, fontSize: 14, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
