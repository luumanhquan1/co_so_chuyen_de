import 'package:ccvc_mobile/domain/model/detail_doccument/detail_document.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  DetailDocumentCubit cubit;

  HistoryWidget(this.cubit);

  // final ContentHistoryJobViewModel viewModel;
  // const ContentHistoryJob({Key? key, required this.viewModel})
  //     : super(key: key);

  @override
  _ContentHistoryMissionState createState() => _ContentHistoryMissionState();
}

class _ContentHistoryMissionState extends State<HistoryWidget>
    with AutomaticKeepAliveClientMixin<HistoryWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.viewModel.loadingHistoryProcess();
  }

  @override
  void dispose() {
    // widget.viewModel.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Size getSize() {
    final RenderBox? cardBox =
        _scaffoldKey.currentContext!.findRenderObject() as RenderBox?;
    print(cardBox?.size);
    return cardBox?.size ?? const Size(0, 0);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              key: PageStorageKey<State>(this),
              controller: scrollController,
              itemCount: 3,
              // widget.cubit.listHistory.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffDBDFEF).withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                              color: const Color(0xffDBDFEF).withOpacity(0.5))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   child: Row(
                            //     children: [
                            //       Text(
                            //         '${widget.viewModel.listHistory[index].nguoiGiaoViec.value}',
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .headline3!
                            //             .copyWith(
                            //                 color: const Color(
                            //                     0xff304261),
                            //                 fontWeight:
                            //                     FontWeight.w600),
                            //       ),
                            //       if (widget.viewModel.type ==
                            //           TypeProcessJob
                            //               .LICH_SU_THAY_DOI_TRANG_THAI)
                            //         Expanded(
                            //           child: Text(
                            //               widget
                            //                   .viewModel
                            //                   .listHistory[index]
                            //                   .trangThai,
                            //               textAlign: TextAlign.end,
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline3!
                            //                   .copyWith(
                            //                       fontSize: 12,
                            //                       color: widget
                            //                           .viewModel
                            //                           .listHistory[
                            //                               index]
                            //                           .trangThai
                            //                           .getColorByjObStatusHistory(),
                            //                       fontWeight:
                            //                           FontWeight
                            //                               .w600)),
                            //         )
                            //       else
                            //         Container()
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(height: 8),
                            Column(
                              children: [
                                ...widget.cubit.listHistory[index]
                                    .toListRow()
                                    .map(
                                  (data) {
                                    return Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                data.title,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const SizedBox(width: 1),
                                            Expanded(
                                              flex: 6,
                                              child: Text(
                                                data.value,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8)
                                      ],
                                    );
                                  },
                                ).toList(),
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
