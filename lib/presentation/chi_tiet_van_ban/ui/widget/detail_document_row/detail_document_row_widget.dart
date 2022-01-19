import 'package:auto_size_text/auto_size_text.dart';
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
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff667793),
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
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
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
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                          )
                    // : Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       SizedBox(
                    //         height: 20,
                    //         width: 41,
                    //         child: CustomCheckBox(
                    //           title: '',
                    //           isCheck: widget.row.value,
                    //         ),
                    //       ),
                    //       Container()
                    //     ],
                    //   ),
                    : const SizedBox(),
              )
            ],
          )
        else
          GridView.count(
            shrinkWrap: true,
            // crossAxisSpacing: 4.0,
            // mainAxisSpacing: 8.0,
            crossAxisCount: 2,
            children: [
              Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 41,
                      child: CustomCheckBox(
                        title: '',
                        isCheck: widget.row.value,
                      ),
                    ),
                    AutoSizeText(
                      widget.row.title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff667793),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
