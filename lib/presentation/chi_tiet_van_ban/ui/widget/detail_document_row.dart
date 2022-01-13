import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/document_detail_row.dart';
import 'package:ccvc_mobile/widgets/checkbox/custom_checkbox.dart';
import 'package:flutter/material.dart';

class DetailDocumentRow extends StatefulWidget {
  final DocumentDetailRow row;

  DetailDocumentRow({Key? key, required this.row}) : super(key: key);

  @override
  State<DetailDocumentRow> createState() => _DetailDocumentRowState();
}

class _DetailDocumentRowState extends State<DetailDocumentRow> {
  final DetailMissionViewMode
  l viewModel = DetailMissionViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 4,
                    child: AutoSizeText(widget.row.title,
                        style: Theme.of(context).textTheme.headline1)),
                Expanded(
                    flex: 6,
                    child: widget.row.type == TypeDocumentDetailRow.text
                        ? viewModel.isCheckLine
                        ? GestureDetector(
                      onTap: () {
                        viewModel.isCheckLine = !viewModel.isCheckLine;
                        setState(() {});
                      },
                      child: Text(
                        '${widget.row.value}',
                        style: Theme.of(context).textTheme.headline4,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        viewModel.isCheckLine = !viewModel.isCheckLine;
                        setState(() {});
                      },
                      child: Text(
                        '${widget.row.value}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                        : Row(
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
                        Container()
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}