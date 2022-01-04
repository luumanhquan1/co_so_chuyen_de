import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkListWidget extends StatefulWidget {
  final HomeItemType homeItemType;
  const WorkListWidget({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  _WorkListWidgetState createState() => _WorkListWidgetState();
}

class _WorkListWidgetState extends State<WorkListWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      title: S.current.work_list,
      urlIcon: ImageAssets.icPlus,
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          congViecCell(),

          congViecCell(),

          congViecCell(),

          congViecCell(),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Đã hoàn thành",
                style: textNormalCustom(fontSize: 14, color: infoColor),
              ),
              SizedBox(
                height: 20,
              ),
              congViecCell(enabled: false),

              congViecCell(enabled: false),

              congViecCell(enabled: false),

              congViecCell(enabled: false),
            ],
          )
        ],
      ),
    );
  }

  Widget congViecCell({bool enabled = true}) {
    return Container(
      // padding: const EdgeInsets.only(),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffE2E8F0))),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: Checkbox(
              checkColor: Colors.white, // color of tick Mark
              activeColor: const Color(0xff7966FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              side: const BorderSide(width: 1.5, color: Color(0xffECEEF7)),
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: !enabled
                ? SizedBox(
              height: 48,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "234234243",
                        style: textNormal(
                          infoColor,
                          14,
                        ),
                      ),
                  ),
                )
                : TextFormField(
                    enabled: enabled,
                    style: textNormal(infoColor, 14),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Color(0xff7966FF),
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(ImageAssets.icClose)
            ],
          )
        ],
      ),
    );
  }
}
