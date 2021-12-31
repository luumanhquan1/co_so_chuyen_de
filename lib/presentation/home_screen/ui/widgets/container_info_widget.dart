import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerInfoWidget extends StatelessWidget {
  final List<InfoData> listData;
  final String title;
  final String status;
  final Color? colorStatus;
  final bool backGroundStatus;
  const ContainerInfoWidget({
    Key? key,
    required this.listData,
    this.title = '',
    this.status = '',
    this.colorStatus,
    this.backGroundStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          border: Border.all(
            color: const Color(0xffDBDFEF).withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff6566E9).withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textNormal(const Color(0xff3D5586), 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: List.generate(listData.length, (index) {
              final data = listData[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(data.urlIcon),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        '${data.key}: ${data.value}',
                        style: textNormal(const Color(0xff667793), 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28, top: backGroundStatus ? 4 : 0),
            child: Container(
              padding: !backGroundStatus
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: backGroundStatus ? colorStatus : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Text(
                status,
                style: textNormalCustom(
                  color:
                      backGroundStatus ? const Color(0xffFFFFFF) : colorStatus,
                  fontSize: backGroundStatus ? 12 : 14,
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}

class InfoData {
  final String key;
  final String value;
  final String urlIcon;
  const InfoData({this.key = '', this.value = '', this.urlIcon = ''});
}
