// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';
// import 'package:rxdart/subjects.dart';
//
// // ignore: must_be_immutable
// class CustomSelectMultiItems extends StatefulWidget {
//   final BuildContext context;
//   final List<String> items;
//   String? title;
//   final Function(List<int>) onChange;
//   Function(int)? onSelectItem;
//   Function(int)? onRemoveItem;
//
//   CustomSelectMultiItems({
//     Key? key,
//     this.onSelectItem,
//     this.onRemoveItem,
//     this.title,
//     required this.context,
//     required this.items,
//     required this.onChange,
//   }) : super(key: key);
//
//   @override
//   _CustomSelectMultiItemsState createState() => _CustomSelectMultiItemsState();
// }
//
// class _CustomSelectMultiItemsState extends State<CustomSelectMultiItems> {
//   List<String> selectedItems = [];
//   List<String> searchList = [];
//   bool isSearching = false;
//   double sizeWitdhTag = 0;
//   BehaviorSubject<List<String>> searchItemSubject = BehaviorSubject();
//
//   void showListItem(BuildContext context) {
//     searchItemSubject = BehaviorSubject.seeded(widget.items);
//     showDialog(
//         context: context,
//         builder: (context) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Scaffold(
//               resizeToAvoidBottomInset: true,
//               backgroundColor: Colors.transparent,
//               body: Padding(
//                 padding: EdgeInsets.symmetric(
//                     vertical: MediaQuery.of(context).viewInsets.bottom <= 160
//                         ? 300.h
//                         : 50.h,
//                     horizontal: 240.w),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Theme.of(context).backgroundColor,
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(8))),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Container(
//                           height: 56,
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                   bottom:
//                                       BorderSide(color: Color(0xffEDF0FD)))),
//                           padding: const EdgeInsets.only(left: 28, right: 19),
//                           child: Stack(
//                             children: [
//                               Align(
//                                 child: Text(
//                                   widget.title ?? 'Chọn đơn vị',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline4
//                                       ?.copyWith(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 0,
//                                 right: 0,
//                                 bottom: 0,
//                                 child: IconButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   icon: const Icon(
//                                     Icons.close,
//                                     color: const Color(0xffA2AEBD),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: StreamBuilder<List<String>>(
//                             stream: searchItemSubject,
//                             builder: (context, snapshot) {
//                               final listData = snapshot.data ?? [];
//                               return listData.isEmpty
//                                   ? const Padding(
//                                       padding: EdgeInsets.all(16),
//                                       child: Text('Danh sách rỗng'),
//                                     )
//                                   : ListView.separated(
//                                       itemBuilder: (context, index) {
//                                         final itemTitle =
//                                             snapshot.data?[index] ?? '';
//                                         return GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               if (selectedItems
//                                                   .contains(itemTitle)) {
//                                                 selectedItems
//                                                     .remove(itemTitle);
//                                               } else {
//                                                 selectedItems.add(itemTitle);
//                                               }
//                                             });
//                                             widget.onChange(selectedIndex());
//                                             if (widget.onSelectItem != null) {
//                                               widget.onSelectItem!(index);
//                                             }
//                                             Navigator.of(context).pop();
//                                             searchItemSubject.close();
//                                           },
//                                           child: Container(
//                                             color: Colors.transparent,
//                                             padding:
//                                                 const EdgeInsets.symmetric(
//                                                     vertical: 8),
//                                             child: Text(
//                                               itemTitle,
//                                               style: TextStyle(
//                                                 color:
//                                                     const Color(0xff586B8B),
//                                                 fontWeight: selectedItems
//                                                         .contains(itemTitle)
//                                                     ? FontWeight.w600
//                                                     : FontWeight.normal,
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       separatorBuilder: (context, index) {
//                                         return const Divider(
//                                           color: Color(0xffDBDFEF),
//                                         );
//                                       },
//                                       itemCount: snapshot.data?.length ?? 0,
//                                     );
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//   Widget _buildTagView() {
//     return Wrap(
//       runSpacing: 8,
//       spacing: 8,
//       children: _listTag(),
//     );
//   }
//
//   List<Widget> _listTag() {
//     final listWidget = <Widget>[];
//     for (int index = 0; index < selectedItems.length; index++) {
//       listWidget.add(_buildTagItem(selectedItems[index], index));
//     }
//     return listWidget;
//   }
//
//   Widget _buildTagItem(String content, int index) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xffDB353A),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//             constraints: BoxConstraints(
//               maxWidth: sizeWitdhTag - 60,
//             ),
//             child: Text(content,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline4
//                     ?.copyWith(fontSize: 16, color: Colors.white)),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedItems.removeAt(index);
//               });
//               widget.onChange(selectedIndex());
//               if (widget.onRemoveItem != null) {
//                 widget.onRemoveItem!(widget.items.indexOf(content));
//               }
//             },
//             child: const Icon(
//               Icons.close,
//               size: 18,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<int> selectedIndex() {
//     final indexes = <int>[];
//     for (final selectedItem in selectedItems) {
//       indexes.add(widget.items.indexOf(selectedItem));
//     }
//     return indexes;
//   }
//
//   final GlobalKey keyDiaLog = GlobalKey();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
//       sizeWitdhTag = keyDiaLog.currentContext?.size?.width ?? 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // showBottomSheet(Widgets.context);
//         showListItem(widget.context);
//       },
//       child: Container(
//         key: keyDiaLog,
//         padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(width: 1, color: const Color(0xffDBDFEF)),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: selectedItems.isNotEmpty
//             ? _buildTagView()
//             : Text(widget.title ?? 'chon_don_vi'),
//       ),
//     );
//   }
// }

import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/custom_check_box/custom_check_box.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_only_widget.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

class SelectOnlyExpand extends StatefulWidget {
  final bool initExpand;
  final List<String> listSelect;
  final String value;
  final String title;
  final String urlIcon;
  final bool isShowValue;
  final Widget? customValue;
  final Function(int)? onChange;

  const SelectOnlyExpand({
    Key? key,
    this.initExpand = false,
    this.listSelect = const [],
    this.value = '',
    this.isShowValue = true,
    this.title = '',
    required this.urlIcon,
    this.customValue,
    this.onChange,
  }) : super(key: key);

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<SelectOnlyExpand>
    with SingleTickerProviderStateMixin {
  final BehaviorSubject<int> selectBloc = BehaviorSubject<int>();
  List<String> valueSelect = [];
  late AnimationController? expandController;
  double sizeWitdhTag = 0;

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (widget.listSelect.isNotEmpty) {
      final index =
          widget.listSelect.indexWhere((element) => element == widget.value);
      if (index != -1) {
        valueSelect.add(widget.listSelect[index]);
        if (widget.onChange != null) {
          widget.onChange!(index);
        }
        selectBloc.sink.add(index);
      }
    }
  }

  @override
  void didUpdateWidget(covariant SelectOnlyExpand oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.listSelect.isNotEmpty) {
      final index =
          widget.listSelect.indexWhere((element) => element == widget.value);
      if (index != -1) {
        valueSelect.add(widget.listSelect[index]);
        selectBloc.sink.add(index);
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    selectBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandOnlyWidget(
      initExpand: widget.initExpand,
      isShowIcon: false,
      initController: expandController,
      header: headerWidget(),
      child: widget.listSelect.isEmpty
          ? const NodataWidget()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                widget.listSelect.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: index == 0 ? 0 : 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (valueSelect.contains(widget.listSelect[index])) {
                        valueSelect.remove(widget.listSelect[index]);
                      } else {
                        valueSelect.add(widget.listSelect[index]);
                      }
                      if (widget.onChange != null) {
                        widget.onChange!(index);
                      }
                      selectBloc.sink.add(index);
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.listSelect[index],
                              style: textNormal(titleColor, 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // CustomCheckBox(
                          //     title: '',
                          //     onChange: (isCheck) {
                          //       //  widget.themDonViCubit.selectNodeOnly(widget.node);
                          //     },
                          //     isCheck: widget.isShowValue != widget.isShowValue
                          //     // snapshot.data?.value.id == widget.node.value.id,
                          //     )

                          if (widget.isShowValue)
                            StreamBuilder<int>(
                              stream: selectBloc.stream,
                              builder: (context, snapshot) {
                                final data = snapshot.data;
                                return data == index && data != null
                                    ? CustomCheckBox(
                                        title: '',
                                        onChange: (isCheck) {
                                          //  widget.themDonViCubit.selectNodeOnly(widget.node);
                                        },
                                        isCheck: true
                                        // snapshot.data?.value.id == widget.node.value.id,
                                        )
                                    : CustomCheckBox(
                                        title: '',
                                        onChange: (isCheck) {
                                          //  widget.themDonViCubit.selectNodeOnly(widget.node);
                                        },
                                        isCheck: false
                                        // snapshot.data?.value.id == widget.node.value.id,
                                        );
                              },
                            )
                          else
                            const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget headerWidget() {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: Colors.transparent,
          child: SvgPicture.asset(
            widget.urlIcon,
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: AnimatedBuilder(
            animation: expandController!,
            builder: (context, _) => Container(
              padding: const EdgeInsets.symmetric(vertical: 9),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: expandController!.value == 0
                        ? lineColor
                        : Colors.transparent,
                  ),
                ),
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.value == null)
                    Expanded(
                      child: Text(
                        widget.title,
                        style: textNormal(titleColumn, 16),
                      ),
                    )
                  else
                    Expanded(
                      child: widget.customValue ??
                          StreamBuilder<int>(
                            stream: selectBloc.stream,
                            builder: (context, snapshot) {
                              return _buildTagView();
                            },
                          ),
                    ),
                  if (expandController!.value == 0)
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AqiColor,
                    )
                  else
                    const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: AqiColor,
                    )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTagView() {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: _listTag(),
    );
  }

  List<Widget> _listTag() {
    final listWidget = <Widget>[];
    for (int index = 0; index < valueSelect.length; index++) {
      listWidget.add(_buildTagItem(valueSelect[index], index));
    }
    return listWidget;
  }

  Widget _buildTagItem(String content, int index) {
    return Container(
      decoration: BoxDecoration(
        color: bgTabletColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor.withOpacity(0.5)),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.red,
            child: Flexible(
              child: Text(
                content,
                style: textDetailHDSD(fontSize: 14, color: textTitle),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                valueSelect.removeAt(index);
              });
              // widget.onChange(selectedIndex());
              // if (widget.onRemoveItem != null) {
              //   widget.onRemoveItem!(widget.items.indexOf(content));
              // }
            },
            child: Container(
              color: Colors.blue,
              //  padding: const EdgeInsets.only(top: 8, right: 8),
              child: SvgPicture.asset(ImageAssets.icClose),
            ),
          ),
        ],
      ),
    );
  }

  List<String> a = [];

  List<int> selectedIndex() {
    final indexes = <int>[];
    for (final selectedItem in a) {
      indexes.add(widget.listSelect.indexOf(selectedItem));
    }
    return indexes;
  }
}
