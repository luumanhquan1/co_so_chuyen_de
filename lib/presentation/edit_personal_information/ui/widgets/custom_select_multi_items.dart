import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:rxdart/subjects.dart';

// ignore: must_be_immutable
class CustomSelectItems extends StatefulWidget {
  final BuildContext context;
  final List<String> items;
  String? title;
  final Function(List<int>) onChange;
  Function(int)? onSelectItem;
  Function(int)? onRemoveItem;
  bool isCheckEnable = false;

  CustomSelectItems(
      {Key? key,
      this.onSelectItem,
      this.onRemoveItem,
      this.title,
      required this.context,
      required this.items,
      required this.onChange,
      required this.isCheckEnable})
      : super(key: key);

  @override
  _CustomSelectItemsState createState() => _CustomSelectItemsState();
}

class _CustomSelectItemsState extends State<CustomSelectItems> {
  List<String> selectedItems = [];
  List<String> searchList = [];
  bool isSearching = false;
  double sizeWitdhTag = 0;
  BehaviorSubject<List<String>> searchItemSubject = BehaviorSubject();

  void showListItem(BuildContext context) {
    searchItemSubject = BehaviorSubject.seeded(widget.items);
    showDialog(
      context: context,
      builder: (context) {
        return KeyboardDismisser(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom <= 160
                      ? 100
                      : 20,
                  horizontal: 50,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: backgroundColorApp,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 56,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: editColor,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.title ?? '',
                                    style: tokenDetailAmount(
                                      fontSize: 12.0.textScale(),
                                      color: titleColor,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AqiColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                          },
                        ),
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
                                  : ListView.separated(
                                      itemBuilder: (context, index) {
                                        final itemTitle =
                                            snapshot.data?[index] ?? '';
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (selectedItems
                                                  .contains(itemTitle)) {
                                              } else {
                                                selectedItems.clear();
                                                selectedItems.add(itemTitle);
                                              }
                                            });
                                            // widget.onChange(selectedIndex());
                                            // if (widget.onSelectItem != null) {
                                            //   widget.onSelectItem!(index);
                                            // }
                                            Navigator.of(context).pop();
                                            searchItemSubject.close();
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                            ),
                                            child: Text(
                                              itemTitle,
                                              style: TextStyle(
                                                color: borderColor,
                                                fontWeight: selectedItems
                                                        .contains(itemTitle)
                                                    ? FontWeight.w600
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          color: borderColor,
                                        );
                                      },
                                      itemCount: snapshot.data?.length ?? 0,
                                    );
                            },
                          ),
                        ),
                        spaceH10
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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
    return Text(
      content,
      style: tokenDetailAmount(
        fontSize: 12.0.textScale(),
        color: titleColor,
      ),
    );
  }

  List<int> selectedIndex() {
    final indexes = <int>[];
    for (final selectedItem in selectedItems) {
      indexes.add(widget.items.indexOf(selectedItem));
    }
    return indexes;
  }

  final GlobalKey keyDiaLog = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      sizeWitdhTag = keyDiaLog.currentContext?.size?.width ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isCheckEnable
        ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  key: keyDiaLog,
                  padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
                  decoration: BoxDecoration(
                    color: borderColor.withOpacity(0.2),
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: selectedItems.isNotEmpty
                      ? _buildTagView()
                      : Text(
                          widget.title ?? 'luc',
                          style: tokenDetailAmount(
                            fontSize: 12.0.textScale(),
                            color: titleColor,
                          ),
                        ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              // showBottomSheet(Widgets.context);
              showListItem(widget.context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  key: keyDiaLog,
                  padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: selectedItems.isNotEmpty
                      ? _buildTagView()
                      : Text(
                          widget.title ?? 'luc',
                          style: tokenDetailAmount(
                            fontSize: 12.0.textScale(),
                            color: titleColor,
                          ),
                        ),
                ),
              ],
            ),
          );
  }
}
