import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/mobile/widget/radio_button.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/subjects.dart';

// ignore: must_be_immutable
class CustomSelectHuyen extends StatefulWidget {
  final String? value;
  final BuildContext context;
  final List<String> items;
  String? title;
  final Function(int) onChange;
  Function(int)? onSelectItem;
  Function? onRemove;
  ManagerPersonalInformationCubit cubit;

  CustomSelectHuyen({
    Key? key,
    this.value,
    this.onSelectItem,
    this.onRemove,
    this.title,
    required this.context,
    required this.items,
    required this.onChange,
    required this.cubit,
  }) : super(key: key);

  @override
  _CustomSelectHuyenState createState() => _CustomSelectHuyenState();
}

class _CustomSelectHuyenState extends State<CustomSelectHuyen> {
  List<String> selectedItems = [];
  List<String> searchList = [];
  bool isSearching = false;
  double sizeWitdhTag = 0;
  BehaviorSubject<List<String>> searchItemSubject = BehaviorSubject();
  final GlobalKey keyDiaLog = GlobalKey();
  bool isCheck = false;
  int isCheckSelectedItem = 0;
  String contents = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      sizeWitdhTag = keyDiaLog.currentContext?.size?.width ?? 0;
    });
    widget.cubit.managerStream.listen((event) {
      contents = event.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return contents.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, top: 14, bottom: 14),
                decoration: BoxDecoration(
                  color: borderColor.withOpacity(0.2),
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: selectedItems.isNotEmpty
                    ? _buildTagView()
                    : Text(
                        widget.title ?? S.current.danh_sach_rong,
                        style: tokenDetailAmount(
                          fontSize: 14.0.textScale(),
                          color: titleColor,
                        ),
                      ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              searchItemSubject = BehaviorSubject.seeded(widget.items);
              showBottomSheetCustom(
                context,
                title: S.current.chon_tinh_thanh_pho,
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: const BoxDecoration(
                      color: backgroundColorApp,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        spaceH20,
                        BaseSearchBar(
                          onChange: (keySearch) async {
                            searchList = widget.items
                                .where(
                                  (item) => item.trim().toLowerCase().contains(
                                        keySearch.trim().toLowerCase(),
                                      ),
                                )
                                .toList();
                            searchItemSubject.sink.add(searchList);
                            //cubit.isCheckRadioButton.sink.add('');
                          },
                        ),
                        spaceH4,
                        Expanded(
                          child: StreamBuilder<List<String>>(
                            stream: searchItemSubject,
                            builder: (context, snapshot) {
                              final listData = snapshot.data ?? [];
                              return listData.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(S.current.danh_sach_rong),
                                    )
                                  : ListView.builder(
                                      itemCount: listData.length,
                                      itemBuilder: (context, index) {
                                        final itemTitle =
                                            snapshot.data?[index] ?? '';
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              padding: const EdgeInsets.only(
                                                top: 18,
                                                bottom: 18,
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      itemTitle,
                                                      style: tokenDetailAmount(
                                                        color: titleColor,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        StreamBuilder<String>(
                                                          stream: widget.cubit
                                                              .isCheckRadioButton,
                                                          builder: (
                                                            context,
                                                            snapshot,
                                                          ) {
                                                            return CustomRadioButtonCheck(
                                                              isCheckButton:
                                                                  snapshot.data ==
                                                                      listData[
                                                                          index],
                                                              onSelectItem: () {
                                                                widget
                                                                    .cubit
                                                                    .isCheckRadioButton
                                                                    .sink
                                                                    .add(
                                                                  listData[
                                                                      index],
                                                                );
                                                                index =
                                                                    isCheckSelectedItem;
                                                                setState(() {
                                                                  if (selectedItems
                                                                      .contains(
                                                                    itemTitle,
                                                                  )) {
                                                                  } else {
                                                                    selectedItems
                                                                        .clear();
                                                                    selectedItems
                                                                        .add(
                                                                      itemTitle,
                                                                    );
                                                                  }
                                                                });
                                                                widget.onChange(
                                                                    index);
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                                searchItemSubject
                                                                    .close();
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              color: cellColorborder,
                                            )
                                          ],
                                        );
                                      },
                                    );
                            },
                          ),
                        ),
                        spaceH10
                      ],
                    ),
                  ),
                ),
              );
              //  showListItem(widget.context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  key: keyDiaLog,
                  padding: const EdgeInsets.only(left: 8, top: 14, bottom: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: StreamBuilder<String>(
                    stream: widget.cubit.isCheckRadioButton,
                    initialData: widget.title,
                    builder: (context, snapshot) {
                      return selectedItems.isNotEmpty
                          ? _buildTagView()
                          : Text(
                              snapshot.data ?? S.current.danh_sach_rong,
                              style: tokenDetailAmount(
                                fontSize: 14.0.textScale(),
                                color: titleColor,
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          );
  }

//   @override
//   Widget build(BuildContext context) {
//     return contents.isNotEmpty
//         ? GestureDetector(
//             onTap: () {
//               searchItemSubject = BehaviorSubject.seeded(widget.items);
//               showBottomSheetCustom(
//                 context,
//                 title: S.current.chon_tinh_thanh_pho,
//                 child: SingleChildScrollView(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     decoration: const BoxDecoration(
//                       color: backgroundColorApp,
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         spaceH20,
//                         BaseSearchBar(
//                           onChange: (keySearch) async {
//                             searchList = widget.items
//                                 .where(
//                                   (item) => item.trim().toLowerCase().contains(
//                                         keySearch.trim().toLowerCase(),
//                                       ),
//                                 )
//                                 .toList();
//                             searchItemSubject.sink.add(searchList);
//                           },
//                         ),
//                         spaceH4,
//                         Expanded(
//                           child: StreamBuilder<List<String>>(
//                             stream: searchItemSubject,
//                             builder: (context, snapshot) {
//                               final listData = snapshot.data ?? [];
//                               return listData.isEmpty
//                                   ? Padding(
//                                       padding: const EdgeInsets.all(16),
//                                       child: Text(S.current.danh_sach_rong),
//                                     )
//                                   : ListView.builder(
//                                       itemCount: listData.length,
//                                       itemBuilder: (context, index) {
//                                         final itemTitle =
//                                             snapshot.data?[index] ?? '';
//                                         return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                               color: Colors.transparent,
//                                               padding: const EdgeInsets.only(
//                                                 top: 18,
//                                                 bottom: 18,
//                                               ),
//                                               child: Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       itemTitle,
//                                                       style: tokenDetailAmount(
//                                                         color: titleColor,
//                                                         fontSize: 14,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .end,
//                                                       children: [
//                                                         StreamBuilder<String>(
//                                                           stream: widget.cubit
//                                                               .isCheckRadioButton,
//                                                           builder: (
//                                                             context,
//                                                             snapshot,
//                                                           ) {
//                                                             return CustomRadioButtonCheck(
//                                                               isCheckButton:
//                                                                   snapshot.data ==
//                                                                       listData[
//                                                                           index],
//                                                               onSelectItem: () {
//                                                                 print(
//                                                                     'lcccc${widget.cubit.tinhHuyenXaModel[index].id}');
//
//                                                                 widget.cubit.getDataTinhHuyenXaChild(
//                                                                     parentId: widget
//                                                                             .cubit
//                                                                             .tinhHuyenXaModel[index]
//                                                                             .id ??
//                                                                         '');
// //
//                                                                 widget.cubit.getDataTinhHuyenXaChildHuyen(
//                                                                     parentId: widget
//                                                                             .cubit
//                                                                             .tinhHuyenXaModel[index]
//                                                                             .id ??
//                                                                         '');
// //
//                                                                 widget.cubit.getDataTinhHuyenXaChildXa(
//                                                                     parentId: widget
//                                                                             .cubit
//                                                                             .tinhHuyenXaModel[index]
//                                                                             .id ??
//                                                                         '');
//
//                                                                 setState(() {});
//                                                                 widget
//                                                                     .cubit
//                                                                     .isCheckRadioButton
//                                                                     .sink
//                                                                     .add(
//                                                                   listData[
//                                                                       index],
//                                                                 );
//                                                                 index =
//                                                                     isCheckSelectedItem;
//                                                                 if (selectedItems
//                                                                     .contains(
//                                                                   itemTitle,
//                                                                 )) {
//                                                                 } else {
//                                                                   selectedItems
//                                                                       .clear();
//                                                                   selectedItems
//                                                                       .add(
//                                                                     itemTitle,
//                                                                   );
//                                                                 }
//                                                                 widget.onChange(
//                                                                   index,
//                                                                 );
//                                                                 Navigator.of(
//                                                                   context,
//                                                                 ).pop();
//                                                                 searchItemSubject
//                                                                     .close();
//                                                               },
//                                                             );
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                             Container(
//                                               height: 1,
//                                               color: cellColorborder,
//                                             )
//                                           ],
//                                         );
//                                       },
//                                     );
//                             },
//                           ),
//                         ),
//                         spaceH10
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   key: keyDiaLog,
//                   padding: const EdgeInsets.only(left: 8, top: 14, bottom: 14),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: borderColor),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: StreamBuilder<String>(
//                     stream: widget.cubit.isCheckRadioButton,
//                     initialData: contents,
//                     builder: (context, snapshot) {
//                       return selectedItems.isNotEmpty
//                           ? _buildTagView()
//                           : Text(
//                               snapshot.data ?? S.current.danh_sach_rong,
//                               style: tokenDetailAmount(
//                                 fontSize: 14.0.textScale(),
//                                 color: titleColor,
//                               ),
//                             );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : widget.isCheckEnable
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                     padding:
//                         const EdgeInsets.only(left: 8, top: 14, bottom: 14),
//                     decoration: BoxDecoration(
//                       color: borderColor.withOpacity(0.2),
//                       border: Border.all(color: borderColor),
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: selectedItems.isNotEmpty
//                         ? _buildTagView()
//                         : Text(
//                             widget.title ?? S.current.danh_sach_rong,
//                             style: tokenDetailAmount(
//                               fontSize: 14.0.textScale(),
//                               color: titleColor,
//                             ),
//                           ),
//                   ),
//                 ],
//               )
//             : GestureDetector(
//                 onTap: () {
//                   searchItemSubject = BehaviorSubject.seeded(widget.items);
//                   showBottomSheetCustom(
//                     context,
//                     title: S.current.chon_tinh_thanh_pho,
//                     child: SingleChildScrollView(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.5,
//                         decoration: const BoxDecoration(
//                           color: backgroundColorApp,
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             spaceH20,
//                             BaseSearchBar(
//                               onChange: (keySearch) async {
//                                 searchList = widget.items
//                                     .where(
//                                       (item) =>
//                                           item.trim().toLowerCase().contains(
//                                                 keySearch.trim().toLowerCase(),
//                                               ),
//                                     )
//                                     .toList();
//                                 searchItemSubject.sink.add(searchList);
//                               },
//                             ),
//                             spaceH4,
//                             Expanded(
//                               child: StreamBuilder<List<String>>(
//                                 stream: searchItemSubject,
//                                 builder: (context, snapshot) {
//                                   final listData = snapshot.data ?? [];
//                                   return listData.isEmpty
//                                       ? Padding(
//                                           padding: const EdgeInsets.all(16),
//                                           child: Text(S.current.danh_sach_rong),
//                                         )
//                                       : ListView.builder(
//                                           itemCount: listData.length,
//                                           itemBuilder: (context, index) {
//                                             final itemTitle =
//                                                 snapshot.data?[index] ?? '';
//                                             return Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                   color: Colors.transparent,
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                     top: 18,
//                                                     bottom: 18,
//                                                   ),
//                                                   child: Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: Text(
//                                                           itemTitle,
//                                                           style:
//                                                               tokenDetailAmount(
//                                                             color: titleColor,
//                                                             fontSize: 14,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Expanded(
//                                                         child: Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .end,
//                                                           children: [
//                                                             StreamBuilder<
//                                                                 String>(
//                                                               stream: widget
//                                                                   .cubit
//                                                                   .isCheckRadioButton,
//                                                               builder: (
//                                                                 context,
//                                                                 snapshot,
//                                                               ) {
//                                                                 return CustomRadioButtonCheck(
//                                                                   isCheckButton: snapshot
//                                                                           .data ==
//                                                                       listData[
//                                                                           index],
//                                                                   onSelectItem:
//                                                                       () {
//                                                                     print(
//                                                                         'lcccc${widget.cubit.tinhHuyenXaModel[index].id}');
//                                                                     widget
//                                                                         .cubit
//                                                                         .isCheckRadioButton
//                                                                         .sink
//                                                                         .add(
//                                                                       listData[
//                                                                           index],
//                                                                     );
//                                                                     index =
//                                                                         isCheckSelectedItem;
//                                                                     setState(
//                                                                         () {
//                                                                       if (selectedItems
//                                                                           .contains(
//                                                                         itemTitle,
//                                                                       )) {
//                                                                       } else {
//                                                                         selectedItems
//                                                                             .clear();
//                                                                         selectedItems
//                                                                             .add(
//                                                                           itemTitle,
//                                                                         );
//                                                                       }
//                                                                     });
//                                                                     widget
//                                                                         .onChange(
//                                                                       index,
//                                                                     );
//                                                                     Navigator
//                                                                         .of(
//                                                                       context,
//                                                                     ).pop();
//                                                                     searchItemSubject
//                                                                         .close();
//                                                                   },
//                                                                 );
//                                                               },
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   height: 1,
//                                                   color: cellColorborder,
//                                                 )
//                                               ],
//                                             );
//                                           },
//                                         );
//                                 },
//                               ),
//                             ),
//                             spaceH10
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Container(
//                       key: keyDiaLog,
//                       padding:
//                           const EdgeInsets.only(left: 8, top: 14, bottom: 14),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: borderColor),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: StreamBuilder<String>(
//                         stream: widget.cubit.isCheckRadioButton,
//                         initialData: widget.title,
//                         builder: (context, snapshot) {
//                           return selectedItems.isNotEmpty
//                               ? _buildTagView()
//                               : Text(
//                                   widget.title ?? S.current.danh_sach_rong,
//                                   style: tokenDetailAmount(
//                                     fontSize: 14.0.textScale(),
//                                     color: titleColor,
//                                   ),
//                                 );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//   }

  Widget _buildTagView() {
    return Wrap(
      children: _listTag(),
    );
  }

  List<Widget> _listTag() {
    final listWidget = <Widget>[];
    for (int index = 0; index < selectedItems.length; index++) {
      listWidget.add(_buildTagItem(selectedItems[index], index));
    }
    return listWidget;
  }

  Widget _buildTagItem(String content, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 9,
          child: Text(
            content,
            style: tokenDetailAmount(
              fontSize: 14.0.textScale(),
              color: titleColor,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.cubit.isCheckRadioButton.sink.add('');
              if (widget.onRemove != null) {
                widget.onRemove!();
              }
              setState(() {
                selectedItems.removeAt(index);
              });
            },
            child: SvgPicture.asset(ImageAssets.icClose),
          ),
        ),
        spaceW8
      ],
    );
  }

  List<int> selectedIndex() {
    final indexes = <int>[];
    for (final selectedItem in selectedItems) {
      indexes.add(widget.items.indexOf(selectedItem));
    }
    return indexes;
  }
}
