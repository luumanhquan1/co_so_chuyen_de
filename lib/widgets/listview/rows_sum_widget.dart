import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowSumInfoWidget extends StatelessWidget {
  final List<DataRow> data;
  const RowSumInfoWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final result = data[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 247,
              height: 88,
              decoration: const BoxDecoration(
                color: backgroundRowColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    result.urlIcon,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        result.title,
                        style: textNormal(
                          AppTheme.getInstance().titleColor(),
                          16,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        result.value,
                        style: titleText(
                          color: AppTheme.getInstance().subTitleColor(),
                          fontSize: 26,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DataRow {
  final String urlIcon;
  final String title;
  final String value;
  DataRow({required this.urlIcon, required this.title, required this.value});
}
