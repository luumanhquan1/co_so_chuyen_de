import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTableTopic extends StatelessWidget {
  final String title;
  final String index;

  const ItemTableTopic(this.title, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFFEAEEF5), width: 1)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 6),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEAEEF5))),
            child: Text(title,
                style: textNormalCustom(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: titleColumn)),
          ),
          Row(
            children: const [
              Expanded(
                  child:
                      ItemInTable('11,085', 'Bài viết', ImageAssets.icBaiViet)),
              Expanded(
                  child: ItemInTable('11,085', 'Like', ImageAssets.icLike)),
            ],
          ),
          Row(
            children: const [
              Expanded(
                  child: ItemInTable('11,085', 'Share', ImageAssets.icShare)),
              Expanded(
                  child:
                      ItemInTable('11,085', 'Comment', ImageAssets.icComment)),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                S.current.bao_cao_chi_tiet,
                style: textNormalCustom(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: buttonColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemInTable extends StatelessWidget {
  final String index;
  final String content;
  final String icon;

  const ItemInTable(this.index, this.content, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                index,
                style: textNormalCustom(
                    color: titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                content,
                style: textNormalCustom(
                    color: unselectLabelColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: SizedBox(
                  height: 24, width: 24, child: SvgPicture.asset(icon)))
        ],
      ),
    );
  }
}