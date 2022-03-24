import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/bloc_danh_ba_dien_tu/bloc_danh_ba_dien_tu_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/widget/tab_danh_ba_ca_nhan_fix/phone/cell_list_ca_nhan_fix.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:rxdart/subjects.dart';
import 'package:url_launcher/url_launcher.dart';

class DanhBaCaNhanFix extends StatefulWidget {
  const DanhBaCaNhanFix({Key? key}) : super(key: key);

  @override
  _DanhBaCaNhanFixState createState() => _DanhBaCaNhanFixState();
}

class _DanhBaCaNhanFixState extends State<DanhBaCaNhanFix> {
  late DanhBaDienTuCubit cubit;
  BehaviorSubject<List<Contact>> searchItemSubject = BehaviorSubject();
  final ScrollController _scrollController = ScrollController();
  List<Contact> contacts = [];
  List<Contact> listSearch = [];

  @override
  void initState() {
    cubit = DanhBaDienTuCubit();
    super.initState();
    getPhoneData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (cubit.page < cubit.totalPage) {
          cubit.page = cubit.page + 1;
          getPhoneData();
        }
      }
    });
  }

  Future<void> getPhoneData() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );
      searchItemSubject = BehaviorSubject.seeded(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseSearchBar(
                hintText: S.current.tim_kiem_danh_ba,
                onChange: (keySearch) async {
                  listSearch = contacts
                      .where(
                        (item) => item.name.first
                            .trim()
                            .toLowerCase()
                            .vietNameseParse()
                            .contains(
                              keySearch.trim().toLowerCase().vietNameseParse(),
                            ),
                      )
                      .toList();
                  searchItemSubject.sink.add(listSearch);
                },
              ),
              spaceH20,
              Expanded(
                child: StreamBuilder<List<Contact>>(
                  stream: searchItemSubject,
                  builder: (context, snapshot) {
                    final listData = snapshot.data ?? [];
                    return listData.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: NodataWidget(),
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: listData.length,
                            itemBuilder: (context, index) {
                              final String number =
                                  (listData[index].phones.isNotEmpty)
                                      ? listData[index].phones.first.number
                                      : '';
                              return CellListCaNhanFix(
                                name: listData[index].name.first,
                                phone: number,
                                onTap: () {
                                  launch('tel: $number');
                                },
                              );
                            },
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
