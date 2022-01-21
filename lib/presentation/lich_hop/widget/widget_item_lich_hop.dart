import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetItemLichHop extends StatelessWidget {
  final String title;
  final String dateTimeFrom;
  final String dateTimeTo;
  final String urlImage;
  final Function ontap;

  const WidgetItemLichHop(
      {Key? key,
        required this.title,
        required this.dateTimeFrom,
        required this.dateTimeTo,
        required this.urlImage,
        required this.ontap
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap(),
      child: Container(
        height: 99.0,
        width: 343.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: backgroundColorApp,
            border: Border.all(color: borderItemCalender)),
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
                      Text(title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textNormalCustom(
                              color: titleCalenderWork, fontSize: 16.0)),
                      Text('$dateTimeFrom - $dateTimeTo',
                          style: textNormalCustom(
                              color: textBodyTime, fontWeight: FontWeight.w400)),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 4.0),
                                height: 24.0,
                                width: 24.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(urlImage))),
                              ),
                            ),
                            Container(
                              height: 24,
                              width: 79,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0)
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              // SizedBox(width: 16.0,)
            ],
          ),
        ),
      ),
    );
  }
}
