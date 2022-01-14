import 'package:ccvc_mobile/domain/model/detail_doccument/detail_document.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dinh_kem_widget.dart';


class SendCommentWidgetMission extends StatefulWidget {
  final TextEditingController contentController = TextEditingController();
  final Function(String, List<String>) onSendComment;

  // tra loi y kien
  bool isReComment = false;
  DetailDocumentModel miss;
  DetailDocumentCubit? cubit;


  final ValueNotifier<bool> _isDisableButtonNotifier = ValueNotifier(true);
  SendCommentWidgetMission(
      {Key? key,
        required this.onSendComment,
        required this.miss,
        required this.isReComment})
      : super(key: key);

  @override
  _SendCommentWidgetState createState() => _SendCommentWidgetState();
}

class _SendCommentWidgetState extends State<SendCommentWidgetMission> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.cubit ??= DetailDocumentCubit();
    return Container(
      child: Column(
        children: [
          Container(
            height: 110,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      widget._isDisableButtonNotifier.value =
                          text.trim().isEmpty;
                    },
                    controller: widget.contentController,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.headline1,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffDBDFEF),
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffDBDFEF),
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      hintText: 'Nhập ý kiến của bạn',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: const Color(0xffA2AEBD)),
                      errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: widget._isDisableButtonNotifier,
                        builder: (context, value, child) {
                          final bool isDisable = value as bool;
                          return IconButton(
                            icon: SvgPicture.asset(
                              isDisable
                                  ? 'assets/images/ic_send_y_kien.svg'
                                  : 'assets/images/ic_send_active_y_kien.svg',
                            ),
                            onPressed: () {
                              if (!isDisable)
                                widget.onSendComment(
                                    widget.contentController.text,
                                    widget.isReComment
                                        ? widget.cubit!.listIdFileReComment
                                        : widget.cubit!.listIdFile);
                            },
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          AttackButtonWidget(
            onAddPresss: (totalFile, listFile) {
              // widget.cubit!
              //     .uploadFileDocument(listFile, widget.isReComment);
            },
            onRemovePress: (index) {
              // widget.cubit!.removeFileIndex(index, widget.isReComment);
            },
          ),
        ],
      ),
    );
  }
}