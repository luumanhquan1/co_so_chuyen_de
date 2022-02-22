import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/document_detail_row.dart';
import 'package:ccvc_mobile/widgets/checkbox/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'bloc/detail_row_cubit.dart';

class DetailDocumentRow extends StatefulWidget {
  final DocumentDetailRow row;

  DetailDocumentRow({Key? key, required this.row}) : super(key: key);

  @override
  State<DetailDocumentRow> createState() => _DetailDocumentRowState();
}

class _DetailDocumentRowState extends State<DetailDocumentRow> {
  final DetailRowCubit cubit = DetailRowCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        if (widget.row.type == TypeDocumentDetailRow.text)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: AutoSizeText(
                  widget.row.title,
                  style: textNormalCustom(
                    color: titleItemEdit,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: widget.row.type == TypeDocumentDetailRow.text
                    ? cubit.isCheckLine
                        ? GestureDetector(
                            onTap: () {
                              cubit.isCheckLine = !cubit.isCheckLine;
                              setState(() {});
                            },
                            child: Text(
                              '${widget.row.value}',
                              style: textNormalCustom(
                                fontSize: 14,
                                color: titleColor,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              cubit.isCheckLine = !cubit.isCheckLine;
                              setState(
                                () {},
                              );
                            },
                            child: Text(
                              '${widget.row.value}',
                              style: textNormalCustom(
                                fontSize: 14,
                                color: titleColor,
                              ),
                            ),
                          )
                    : const SizedBox(),
              )
            ],
          )
        else
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 2.3,
            children: [
              checkBoxCusTom(widget.row),
              // checkBoxCusTom(widget.row),
            ],
          )
      ],
    );
  }
}

Widget checkBoxCusTom(DocumentDetailRow row) {
  return Row(
    // mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: 20,
        width: 41,
        child: CustomCheckBox(
          title: '',
          isCheck: row.value,
        ),
      ),
      AutoSizeText(row.title,
          style: textNormalCustom(
            fontSize: 14,
            color: titleItemEdit,
          )),
    ],
  );
}
