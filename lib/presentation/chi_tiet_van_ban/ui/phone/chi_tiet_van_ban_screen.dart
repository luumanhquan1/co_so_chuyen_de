import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/detail_document.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/detail_document_row/detail_document_row_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/dropdown_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/widget/send_comment_widget.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:flutter/material.dart';

// todo chi tiet van ban
class DetailDocument extends StatefulWidget {
  // final String taskId;

  // final DetailMissionViewModel viewModel;
  // final bool isPersonal;

  // const DetailDocument(
  //     {required this.taskId,
  //       required this.viewModel,
  //       required this.isPersonal});

  @override
  State<DetailDocument> createState() => _DetailDocumentState();
}

class _DetailDocumentState extends State<DetailDocument> {
  late DetailDocumentCubit cubit;
  bool expanded = false;
  bool expanded2 = false;
  bool expanded3 = false;
  bool expanded4 = false;
  bool expanded5 = false;
  bool expanded6 = false;

  @override
  void initState() {
    super.initState();
    cubit = DetailDocumentCubit();
    // widget.viewModel.loadingDetail(widget.taskId, widget.isPersonal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarDefaultBack('Chi tiết văn bản'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: StreamBuilder<DetailDocumentModel>(
              // initialData: ,
              stream: cubit.detailDocumentSubject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data!.toListRow().map((row) {
                    return DetailDocumentRow(
                      row: row,
                    );
                  }).toList());
                } else {
                  return Container(
                    color: Colors.red,
                  );
                }
              },
            ),
          ),
          // StreamBuilder(
          //     stream: widget.DetailDocument.streamCheckExpand,
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return Container();
          //       }
          //       return Column(
          //         children: [
          //           StreamBuilder(
          //               stream: widget.viewModel.streamVanBanLQ,
          //               builder: (context,
          //                   AsyncSnapshot<List<VanBanLienQuan>> snapshot) {
          //                 final listVBLQ = snapshot.data ?? [];
          //                 return VanBanLienQuanExpand(
          //                   listVanBanLienQuan: listVBLQ,
          //                   viewModel: widget.viewModel,
          //                 );
          //               }),
          //           StreamBuilder(
          //               stream: widget.viewModel.streamDSCV,
          //               builder: (context,
          //                   AsyncSnapshot<List<DanhSachCongViec>>
          //                       snapshot) {
          //                 final List<DanhSachCongViec> listDSCV =
          //                     snapshot.data ?? [];
          //                 return DanhSachCongViecExpand(
          //                   listDSCV: listDSCV,
          //                   viewModel: widget.viewModel,
          //                 );
          //               }),
          //           StreamBuilder<List<HandingCommentInDocumment>>(
          //             stream: widget.viewModel.commentDocumentStream,
          //             builder: (context, snapshot) {
          //               if (snapshot.hasData) {
          //                 return YKienXuLyExpand(
          //                   miss: widget.viewModel.info,
          //                   viewModel: widget.viewModel,
          //                   opTapDowloadFile: (file) {
          //                     dowloadFile(file);
          //                   },
          //                   listComment: snapshot.data ?? [],
          //                   onSendComment: (text, listFileId) {
          //                     EasyLoading.show();
          //                     widget.viewModel
          //                         .createHandingComment(
          //                             text, listFileId, widget.taskId)
          //                         .then((response) {
          //                       EasyLoading.dismiss(animation: true);
          //                       if (response.hasData) {
          //                         CoolAlert.show(
          //                           context: context,
          //                           type: CoolAlertType.success,
          //                           text: 'Cho ý kiến thành công!',
          //                         );
          //                         widget.viewModel
          //                             .getListChoYKien(widget.taskId);
          //                       } else {
          //                         CoolAlert.show(
          //                           context: context,
          //                           type: CoolAlertType.error,
          //                           text: response.error.toString(),
          //                         );
          //                       }
          //                     });
          //                   },
          //                 );
          //               }
          //               return Container();
          //             },
          //           )
          //         ],
          //       );
          //     }),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTitleCustom(
              expand: expanded,
              paddingRightIcon: const EdgeInsets.only(right: 21),
              title: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 10.5,
                  bottom: 10.5,
                ),
                child: const Text('Thông tin gửi nhận'),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 17),
                color: Colors.red,
                height: 100,
              ),
              onChangeExpand: () {
                setState(() {
                  expanded = !expanded;
                  // expanded2 = !expanded2;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTitleCustom(
              expand: expanded2,
              paddingRightIcon: const EdgeInsets.only(right: 21),
              title: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 10.5,
                  bottom: 10.5,
                ),
                child: const Text('Ý kiến xử lý'),
              ),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.listComment.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CommentWidget(
                                  object: widget.listComment[index],
                                  opTapCallBack: (comment) {
                                    widget.opTapDowloadFile(comment);
                                  },
                                );
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
              onChangeExpand: () {
                setState(() {
                  expanded2 = !expanded2;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTitleCustom(
              expand: expanded3,
              paddingRightIcon: const EdgeInsets.only(right: 21),
              title: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 10.5,
                  bottom: 10.5,
                ),
                child: const Text('Lịch sử cập nhật tình hình xử lý'),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 17),
                color: Colors.red,
                height: 100,
              ),
              onChangeExpand: () {
                setState(() {
                  expanded3 = !expanded3;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTitleCustom(
              expand: expanded4,
              paddingRightIcon: const EdgeInsets.only(right: 21),
              title: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 10.5,
                  bottom: 10.5,
                ),
                child: const Text('Lịch sử trả lại'),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 17),
                color: Colors.red,
                height: 100,
              ),
              onChangeExpand: () {
                setState(() {
                  expanded4 = !expanded4;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTitleCustom(
              expand: expanded5,
              paddingRightIcon: const EdgeInsets.only(right: 21),
              title: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 10.5,
                  bottom: 10.5,
                ),
                child: const Text('Lịch sử thu hồi'),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 17),
                color: Colors.red,
                height: 100,
              ),
              onChangeExpand: () {
                setState(() {
                  expanded5 = !expanded5;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ExpansionTitleCustom(
              expand: expanded6,
              paddingRightIcon: const EdgeInsets.only(right: 21),
              title: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 10.5,
                  bottom: 10.5,
                ),
                child: const Text('Lịch sử văn bản liên thông'),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 17),
                color: Colors.red,
                height: 100,
              ),
              onChangeExpand: () {
                setState(() {
                  expanded6 = !expanded6;
                });
              },
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 24),
            child: ButtonCustomBottom(
                title: 'Xem luồng', onPressed: () {}, isColorBlue: true),
          )
        ],
      ),
    );
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
