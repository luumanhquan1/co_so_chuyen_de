import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTinRadio extends StatelessWidget {
  String image;
  String title;
  String date;

  ItemTinRadio(this.image, this.title, this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF6566E9).withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: const Color(0xFFDBDFEF).withOpacity(0.5), width: 1)),
      child: Row(
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
                  image,
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textNormalCustom(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: titleColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(ImageAssets.icCalendar),
                      Text(
                        date,
                        style: textNormalCustom(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dateColor,
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      SvgPicture.asset(ImageAssets.icPlay)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
