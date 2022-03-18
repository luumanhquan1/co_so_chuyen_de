import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/bloc/danh_sach_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/danh_sach_model.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/search/base_seach_bar_no_border.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  final DanhBaCubit danhBaCubit;

  const SearchWidget({Key? key, required this.danhBaCubit}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Node<DanhSachModel>>>(
      stream: widget.danhBaCubit.selectDonVi,
      builder: (context, snapshot) {
        final data = snapshot.data ?? <Node<DanhSachModel>>[];
        if (data.isNotEmpty) {
          return SelectDonViCell(
            controller: controller,
            listSelect: data,
            onChange: (value) {
              widget.danhBaCubit.onSearch(value);
            },
            onDelete: (value) {
              widget.danhBaCubit.removeTag(value);
            },
          );
        } else {
          return BaseSearchBarNoBorder(
            controller: controller,
            onChange: (value) {
              widget.danhBaCubit.onSearch(value);
            },
          );
        }
      },
    );
  }
}

class SelectDonViCell extends StatelessWidget {
  final List<Node<DanhSachModel>> listSelect;
  final Function(Node<DanhSachModel>) onDelete;
  final TextEditingController controller;
  final Function(String) onChange;

  const SelectDonViCell({
    Key? key,
    required this.listSelect,
    required this.onDelete,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(7.0.textScale(space: 5)),
      decoration: BoxDecoration(
          boxShadow: APP_DEVICE == DeviceType.MOBILE
              ? []
              : [
                  BoxShadow(
                    color: shadowContainerColor.withOpacity(0.05),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  )
                ],
          border: Border.all(
            color: APP_DEVICE == DeviceType.MOBILE
                ? borderButtomColor
                : borderColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.all(Radius.circular(6.0.textScale())),
          color: Colors.white),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(listSelect.length + 1, (index) {
          if (index == listSelect.length) {
            return Container(
              width: 200,
              color: Colors.transparent,
              child: TextField(
                onChanged: onChange,
                controller: controller,
                style: textNormal(textTitle, 14.0.textScale()),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
              ),
            );
          }
          final data = listSelect[index];
          return tag(
            title: data.value.name,
            onDelete: () {
              onDelete(data);
            },
          );
        }),
      ),
    );
  }

  Widget tag({required String title, required Function onDelete}) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: APP_DEVICE == DeviceType.MOBILE ? bgTag : labelColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: textNormal(
              APP_DEVICE == DeviceType.MOBILE ? linkColor : backgroundColorApp,
              12.0.textScale(),
            ),
          ),
          GestureDetector(
            onTap: () {
              onDelete();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 9.25),
              child: SvgPicture.asset(
                ImageAssets.icClose,
                width: 7.5,
                height: 7.5,
                color: APP_DEVICE == DeviceType.MOBILE
                    ? labelColor
                    : backgroundColorApp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
