import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkListWidget extends StatefulWidget {
  const WorkListWidget({Key? key}) : super(key: key);

  @override
  _DanhSachCongViecState createState() => _DanhSachCongViecState();
}

class _DanhSachCongViecState extends State<WorkListWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroudWidget(
      title: S.current.work_list,
      urlIcon: ImageAssets.icPlus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          congViecCell(),
          SizedBox(
            height: 15,
          ),
          congViecCell(),
          SizedBox(
            height: 15,
          ),
          congViecCell(),
          SizedBox(
            height: 15,
          ),
          congViecCell(),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Đã hoàn thành",
                style: TextStyle(
                    color: Color(0xff667793),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              congViecCell(enabled: false),
              SizedBox(
                height: 15,
              ),
              congViecCell(enabled: false),
              SizedBox(
                height: 15,
              ),
              congViecCell(enabled: false),
              SizedBox(
                height: 15,
              ),
              congViecCell(enabled: false),
            ],
          )
        ],
      ),
    );
  }

  Widget congViecCell({bool enabled = true}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffE2E8F0))),),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: Checkbox(
                checkColor: Colors.white, // color of tick Mark
                activeColor: const Color(0xff7966FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
                side: const BorderSide(width: 1.5, color: Color(0xffECEEF7)),
                value: true,
                onChanged: (value) {},),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
              child: SizedBox(
            height: 20,
            child: TextFormField(
              enabled: enabled,
              style: textNormal(const Color(0xff667793), 14),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          )),
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
