import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';

class ItemListNews extends StatelessWidget {
  final String image;
  final String title;
  final String date;

  const ItemListNews(this.image, this.title, this.date, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(flex: 3 ,child: Image(image: NetworkImage(image),)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textNormalCustom(
                      color: titleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, color: iconColor,),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      date,
                      style: textNormalCustom(
                          color: unselectedLabelColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
