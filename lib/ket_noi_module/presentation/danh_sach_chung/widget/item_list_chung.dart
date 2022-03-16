import 'package:ccvc_mobile/home_module/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/color.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/styles.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/detail_chung_ket_noi/ui/phone/detail_chung_ket_noi.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/screen_device_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ItemListChung extends StatefulWidget {
  final DanhSachChungModel danhSachChungModel;
  final int index;

  const ItemListChung({
    Key? key,
    required this.danhSachChungModel,
    required this.index,
  }) : super(key: key);

  @override
  _ItemListChungState createState() => _ItemListChungState();
}

class _ItemListChungState extends State<ItemListChung> {
  @override
  Widget build(BuildContext context) {
    return screenDevice(
      mobileScreen: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  DetailChungKetNoi(id: widget.danhSachChungModel.id ?? ''),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  subStringImage(
                    widget.danhSachChungModel.danhSachHinhAnh ?? '',
                  ).first,
                  fit: BoxFit.cover,
                  height: 186,
                  width: 343,
                  errorBuilder: (_, __, ___) {
                    return SvgPicture.asset(ImageAssets.ic_no_image);
                  },
                ),
              ),
              spaceH12,
              Text(
                widget.danhSachChungModel.tenSuKien ?? '',
                style: textListChung(
                  color: titleColor,
                  textHeight: 1.7,
                ),
              ),
              spaceH8,
              Row(
                children: [
                  SvgPicture.asset(ImageAssets.ic_calender),
                  spaceW12,
                  Text(
                    '${DateFormat('dd/MM/yyyy hh:mm:ss').parse(widget.danhSachChungModel.thoiGianBatDau ?? '').formatDdMMYYYY} ',
                    style: textNormal(color: dateColor),
                  )
                ],
              ),
              spaceH8,
              Row(
                children: [
                  SvgPicture.asset(ImageAssets.ic_location),
                  spaceW12,
                  Text(
                    widget.danhSachChungModel.diaChi ?? '',
                    style: textNormal(color: dateColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      tabletScreen: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  DetailChungKetNoi(id: widget.danhSachChungModel.id ?? ''),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Image.network(
                subStringImage(widget.danhSachChungModel.danhSachHinhAnh ?? '')
                    .first,
                fit: BoxFit.cover,
                height: 241,
                width: 468,
                errorBuilder: (_, __, ___) {
                  return SvgPicture.asset(
                    ImageAssets.ic_no_image,
                    height: 241,
                    width: 468,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            spaceH12,
            Flexible(
              child: Text(
                widget.danhSachChungModel.tenSuKien ?? '',
                style: textListChung(
                  color: titleColor,
                  textHeight: 1.7,
                  fontSize: 16,
                ),
              ),
            ),
            spaceH8,
            Row(
              children: [
                SvgPicture.asset(ImageAssets.ic_calender),
                spaceW12,
                Flexible(
                  child: Text(
                    '${DateFormat('dd/MM/yyyy hh:mm:ss').parse(widget.danhSachChungModel.thoiGianBatDau ?? '').formatDdMMYYYY} ',
                    style: textNormal(color: dateColor, fontSize: 16),
                  ),
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                SvgPicture.asset(ImageAssets.ic_location),
                spaceW12,
                Flexible(
                  child: Text(
                    widget.danhSachChungModel.diaChi ?? '',
                    style: textNormal(color: dateColor, fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
