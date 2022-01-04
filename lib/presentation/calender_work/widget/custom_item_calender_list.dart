import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomItemCalenderList extends StatelessWidget {
  final String title;

  final String dateTimeFrom;
  final String dateTimeTo;
  final String urlImage;

  const CustomItemCalenderList(
      {Key? key,
      required this.title,
      required this.dateTimeFrom,
      required this.dateTimeTo,
      required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99.0,
      width: 343.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xffffffff),
          border: Border.all(color: const Color(0xffE2E8F0), width: 1.0)),
      child: Padding(
        padding: const EdgeInsets.only(top: 11.0, bottom: 11.0, left: 16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 6.0),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: statusCalenderRed),
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: titleCalenderWork,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '$dateTimeFrom - $dateTimeTo',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: textBodyTime,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 4.0),
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(urlImage))),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            // SizedBox(width: 16.0,)
          ],
        ),
      ),
    );
  }
}
