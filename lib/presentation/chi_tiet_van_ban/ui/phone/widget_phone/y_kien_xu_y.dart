import 'package:ccvc_mobile/domain/model/detail_doccument/detail_document.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/send_comment_widget.dart';
import 'package:flutter/material.dart';

class YKienXuLyExpand extends StatefulWidget {
  // final List<HandingCommentInDocumment> listComment;
  // final DetailMissionViewModel viewModel;
  final Function(String, List<String>) onSendComment;
  final DetailDocumentModel miss;

  // final ValueSetter<YKienXuLyFileDinhKem> opTapDowloadFile;

  const YKienXuLyExpand(
      {Key? key,
      // required this.listComment,
      // required this.viewModel,
      required this.onSendComment,
      // required this.opTapDowloadFile,
      required this.miss})
      : super(key: key);

  @override
  State<YKienXuLyExpand> createState() => _YKienXuLyExpandState();
}

class _YKienXuLyExpandState extends State<YKienXuLyExpand> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
              child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: true,
                        child: SendCommentWidgetMission(
                          isReComment: false,
                          onSendComment: (text, listFile) =>
                              widget.onSendComment(text, listFile),
                          miss: widget.miss,
                        ),
                      ),
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: widget.listComment.length,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemBuilder: (context, index) {
                      //       return CommentWidget(
                      //         object: widget.listComment[index],
                      //         opTapCallBack: (comment) {
                      //           widget.opTapDowloadFile(comment);
                      //         },
                      //       );
                      //     })
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
