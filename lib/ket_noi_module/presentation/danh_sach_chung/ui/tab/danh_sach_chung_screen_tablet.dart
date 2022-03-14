import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/styles.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/ket_noi_item_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/widget/item_list_chung.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/tab/ket_noi_menu_tablet.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/app_bar/base_app_bar.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/search_widget.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DanhSachChungScreenTablet extends StatefulWidget {
  const DanhSachChungScreenTablet({Key? key}) : super(key: key);

  @override
  _DanhSachChungScreenTabletState createState() =>
      _DanhSachChungScreenTabletState();
}

class _DanhSachChungScreenTabletState extends State<DanhSachChungScreenTablet> {
  late final KetNoiCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = KetNoiCubit();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TypeKetNoiMenu>(
        stream: cubit.streamTypeKetNoiMenu,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: bgWidgets,
            appBar: BaseAppBar(
              title:
                  snapshot.data?.getTitle() ?? TypeKetNoiMenu.SuKien.getTitle(),
              leadingIcon: IconButton(
                onPressed: () => {Navigator.pop(context)},
                icon: SvgPicture.asset(
                  ImageAssets.icBacks,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: SvgPicture.asset(
                      ImageAssets.ic_plus,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KetNoiMenuTablet(
                          cubit: cubit,
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    ImageAssets.ic_mennu_ykien,
                  ),
                ),
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (snapshot.data == TypeKetNoiMenu.Chung) Container(
                  padding: const EdgeInsets.only(top: 24, left: 30),
                  child: Text(
                    S.current.tin_noi_bat,
                    style: titleAppbar(
                      fontSize: 20,
                    ),
                  ),
                ) else SearchWidget(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: snapshot.data?.getScreenMenuTablet(cubit: cubit) ??
                        _content(),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void callApi(int page) {
    cubit.getListChungKetNoi(
      pageSize: cubit.pageSize,
      pageIndex: page,
      type: cubit.type,
    );
  }

  Widget _content() {
    return ListViewLoadMore(
      crossAxisSpacing: 28,
      checkRatio: 1.25,
      cubit: cubit,
      isListView: false,
      callApi: (page) => {callApi(page)},
      viewItem: (value, index) => ItemListChung(
        danhSachChungModel: value as DanhSachChungModel,
      ),
    );
  }
}
