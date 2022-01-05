
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/widget_manage/bloc/widget_manage_cubit.dart';
import 'package:ccvc_mobile/presentation/widget_manage/ui/widgets/widget_item.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetManageScreen extends StatefulWidget {
  const WidgetManageScreen({Key? key}) : super(key: key);

  @override
  _WidgetManageScreenState createState() => _WidgetManageScreenState();
}

class _WidgetManageScreenState extends State<WidgetManageScreen> {
  WidgetManageCubit widgetManageCubit = WidgetManageCubit();
  List<WidgetModel> listWidgetUsing = [];
  List<WidgetModel> listWidgetNotUse = [];

  @override
  void initState() {
    super.initState();
    widgetManageCubit.loadApi();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetManageProvider(
      widgetManageCubit: widgetManageCubit,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            S.current.widget_manage,
            style: const TextStyle(
              color:textTitle,
              fontSize: 18,
              fontWeight: FontWeight.w500,),
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: [
            Row(
              children: [
                Center(
                  child: TextButton(
                    child:  Text(S.current.default_word,
                      style:const TextStyle(
                        color: textDefault,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,),),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ],
          leading: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Center(
                child: Center(
                  child: SvgPicture.asset(ImageAssets.icPrevAppbar),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                  height: 45,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: backgroundWidget,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    S.current.keep_drop,
                    style:const TextStyle(color:textTitle),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  S.current.using,
                  style: const TextStyle(
                    color: itemWidgetUsing,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,),
                ),
                const SizedBox(
                  height: 16,
                ),
                StreamBuilder<List<WidgetModel>>(
                  stream: widgetManageCubit.listWidgetUsing,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? [];
                    if (data.isNotEmpty) {
                      listWidgetUsing = data;
                      return ReorderableListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        proxyDecorator: (_, index, ___) {
                          final String productName =
                              listWidgetUsing[index].name;
                          return Material(
                            color: Colors.transparent,
                            child: Center(
                              child: SizedBox(
                                height: 50,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),),),
                                  child: WidgetItem(
                                    widgetIcon: SvgPicture.asset
                                      (ImageAssets.icClose),
                                    backgroundColor:
                                    itemWidgetUsing
                                        .withOpacity(0.04),
                                    borderColor:
                                    itemWidgetUsing
                                        .withOpacity(0.3),
                                    content: productName,
                                  ),
                                ),
                              ),
                            ),);
                        },
                        itemCount: listWidgetUsing.length,
                        itemBuilder: (context, index) {
                          final String productName =
                              listWidgetUsing[index].name;
                          return Padding(
                            key: ValueKey(productName),
                            padding: const EdgeInsets.only(bottom: 20),
                            child: WidgetItem(
                              widgetIcon: SvgPicture.asset(
                                ImageAssets.icClose,),
                              clickICon: () {
                                widgetManageCubit.insertItemNotUse(
                                  listWidgetUsing[index],
                                    listWidgetUsing, listWidgetNotUse, index,);
                              },
                              backgroundColor:itemWidgetUsing
                                  .withOpacity(0.04),
                              borderColor:itemWidgetUsing
                                  .withOpacity(0.3),
                              content: productName,
                            ),
                          );
                        },
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            if (newIndex > oldIndex) {
                              newIndex = newIndex - 1;
                            }
                            final element =
                            listWidgetUsing.removeAt(oldIndex);
                            listWidgetUsing.insert(newIndex, element);
                          });
                        },);
                    } else {
                      return  Center(
                        child: Text(S.current.no_data),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  S.current.not_use,
                  style:const TextStyle(
                    color: itemWidgetNotUse,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,),
                ),
                const SizedBox(
                  height: 16,
                ),
                StreamBuilder<List<WidgetModel>>(
                  stream: widgetManageCubit.listWidgetNotUse,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? [];
                    if (data.isNotEmpty) {
                      listWidgetNotUse = data;
                      return ReorderableListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        buildDefaultDragHandles: false,
                        shrinkWrap: true,
                        itemCount: listWidgetNotUse.length,
                        itemBuilder: (context, index) {
                          final String productName =
                              listWidgetNotUse[index].name;
                          return Padding(
                            key: ValueKey(productName),
                            padding: const EdgeInsets.only(bottom: 20),
                            child: WidgetItem(
                              widgetIcon: SvgPicture.asset(
                                ImageAssets.icAdd,),
                              clickICon: () {
                                widgetManageCubit.insertItemUsing(
                                  listWidgetNotUse[index],
                                  listWidgetUsing, listWidgetNotUse, index,);
                              },
                              backgroundColor: itemWidgetNotUse
                                  .withOpacity(0.05),
                              borderColor: itemWidgetNotUse
                                  .withOpacity(0.3),
                              content: productName,
                            ),
                          );
                        },
                        // The reorder function
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            if (newIndex > oldIndex) {
                              newIndex = newIndex - 1;
                            }
                            final element =
                            listWidgetNotUse.removeAt(oldIndex);
                            listWidgetNotUse.insert(newIndex, element);
                          });
                        },);
                    } else {
                      return  Center(
                        child: Text(S.current.no_data),
                      );
                    }
                  },
                ),
              ],
            ),),
        ),
      ),
    );
  }
}

class WidgetManageProvider extends InheritedWidget {
  final WidgetManageCubit widgetManageCubit;

  const WidgetManageProvider({
    Key? key,
    required this.widgetManageCubit,
    required Widget child,
  }) : super(key: key, child: child);

  static WidgetManageProvider of(BuildContext context) {
    final WidgetManageProvider? result =
        context.dependOnInheritedWidgetOfExactType<WidgetManageProvider>();
    assert(result != null, 'No elenment');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}


