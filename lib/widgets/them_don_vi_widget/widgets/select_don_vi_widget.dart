import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/tree_don_vi_model.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:ccvc_mobile/widgets/them_don_vi_widget/bloc/them_don_vi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectSearchDonViWidget extends StatelessWidget {
  final ThemDonViCubit themDonViCubit;
  const SelectSearchDonViWidget({Key? key, required this.themDonViCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Node<DonViModel>>>(
      stream: themDonViCubit.selectDonVi,
      builder: (context, snapshot) {
        final data = snapshot.data ?? <Node<DonViModel>>[];
        if (data.isNotEmpty) {
          return SelectDonViCell(
            listSelect: data,
            onDelete: (value) {
              themDonViCubit.removeTag(value);
            },
          );
        } else {
          return BaseSearchBar(
            onChange: (value) {
              themDonViCubit.onSearch(value);
            },
          );
        }
      },
    );
  }
}

class SelectDonViCell extends StatelessWidget {
  final List<Node<DonViModel>> listSelect;
  final Function(Node<DonViModel>) onDelete;
  const SelectDonViCell({
    Key? key,
    required this.listSelect,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(color: borderButtomColor),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(listSelect.length, (index) {
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
      decoration: const BoxDecoration(
        color: bgTag,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: textNormal(linkColor, 12),
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
                color: labelColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
