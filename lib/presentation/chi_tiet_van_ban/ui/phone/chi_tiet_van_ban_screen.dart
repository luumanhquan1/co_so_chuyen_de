import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class DetailDocument extends StatefulWidget {
  final String taskId;

  // final DetailMissionViewModel viewModel;
  final bool isPersonal;

  // const DetailDocument(
  //     {required this.taskId,
  //       required this.viewModel,
  //       required this.isPersonal});

  @override
  State<DetailDocument> createState() => _DetailDocumentState();
}

class _DetailDocumentState extends State<DetailDocument> {
  @override
  void initState() {
    super.initState();
    // widget.viewModel.loadingDetail(widget.taskId, widget.isPersonal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBarDefaultBack('Chi tiết văn bản'),
        // floatingActionButton: StreamBuilder<DetailMission>(
        //     stream: widget.viewModel.detailMissionSubject.stream,
        //     builder: (context, snapshot) {
        //       return CustomDocumentFloatButton(
        //         opTapCallBack: (type) {
        //           presentDocProcessorScreen(
        //               type, context, snapshot.data ?? widget.viewModel.info);
        //         },
        //         detailMission: widget.viewModel.info,
        //         state: StateDocument.nhiemvu,
        //       );
        //     }),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: StreamBuilder<DetailMission>(
                  stream: widget.viewModel.detailMissionSubject,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          children: snapshot.data!.toListRow().map((row) {
                        return DetailDocumentRow(
                          row: row,
                        );
                      }).toList());
                    } else {
                      return Container();
                    }
                  }),
            ),
            StreamBuilder(
                stream: widget.viewModel.streamCheckExpand,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return Column(
                    children: [
                      StreamBuilder(
                          stream: widget.viewModel.streamVanBanLQ,
                          builder: (context,
                              AsyncSnapshot<List<VanBanLienQuan>> snapshot) {
                            final listVBLQ = snapshot.data ?? [];
                            return VanBanLienQuanExpand(
                              listVanBanLienQuan: listVBLQ,
                              viewModel: widget.viewModel,
                            );
                          }),
                      StreamBuilder(
                          stream: widget.viewModel.streamDSCV,
                          builder: (context,
                              AsyncSnapshot<List<DanhSachCongViec>>
                                  snapshot) {
                            final List<DanhSachCongViec> listDSCV =
                                snapshot.data ?? [];
                            return DanhSachCongViecExpand(
                              listDSCV: listDSCV,
                              viewModel: widget.viewModel,
                            );
                          }),
                      StreamBuilder<List<HandingCommentInDocumment>>(
                        stream: widget.viewModel.commentDocumentStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return YKienXuLyExpand(
                              miss: widget.viewModel.info,
                              viewModel: widget.viewModel,
                              opTapDowloadFile: (file) {
                                dowloadFile(file);
                              },
                              listComment: snapshot.data ?? [],
                              onSendComment: (text, listFileId) {
                                EasyLoading.show();
                                widget.viewModel
                                    .createHandingComment(
                                        text, listFileId, widget.taskId)
                                    .then((response) {
                                  EasyLoading.dismiss(animation: true);
                                  if (response.hasData) {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.success,
                                      text: 'Cho ý kiến thành công!',
                                    );
                                    widget.viewModel
                                        .getListChoYKien(widget.taskId);
                                  } else {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      text: response.error.toString(),
                                    );
                                  }
                                });
                              },
                            );
                          }
                          return Container();
                        },
                      )
                    ],
                  );
                })
          ],
        ));
  }

// void dowloadFile(YKienXuLyFileDinhKem file) {
//   // EasyLoading.show();
//
//   APICommon.shared.dowloadFile(file.Ten, file.Id).then((value) {
//     EasyLoading.dismiss(animation: true);
//
//     if (value.error != null) {
//       CoolAlert.show(
//         context: context,
//         type: CoolAlertType.error,
//         text: value.error,
//       );
//     } else {
//       CoolAlert.show(
//         context: context,
//         type: CoolAlertType.success,
//         text: value.data,
//       );
//     }
//   });
// }

}
