import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/styles.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/trong_nuoc.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/widget/item_list_chung.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/widget/item_list_trong_nuoc.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/tab/ket_noi_menu_tablet.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/bloc/tao_su_kien_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/ui/phone/tao_su_kien_screen.dart';
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
  TaoSuKienCubit taoSuKienCubit = TaoSuKienCubit();

  @override
  void initState() {
    super.initState();
    cubit = KetNoiCubit();
    taoSuKienCubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: cubit.streamHeader,
      builder: (context, snapshot) {
        final data = snapshot.data ?? S.current.chung;
        return Scaffold(
          backgroundColor: bgWidgets,
          appBar: BaseAppBar(
            title: data,
            leadingIcon: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: SvgPicture.asset(
                ImageAssets.icBacks,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TaoSuKienKetNoi(),
                    ),
                  );
                },
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
                        taoSuKienCubit: taoSuKienCubit,
                        onChange: (value) {
                          if (mounted) setState(() {});
                          cubit.sukien = value.alias ?? '';
                        },
                        onSelect: (value) {
                          cubit.subCategory = value;
                        },
                        ontChangeTitle: (value) {
                          cubit.headerSubject.sink.add(value);
                        },
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
              if (cubit.sukien == S.current.ket_nois)
                Container(
                  padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
                  child: const SearchWidget(),
                )
              else
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 30),
                  child: Text(
                    S.current.tin_noi_bat,
                    style: titleAppbar(
                      fontSize: 20,
                    ),
                  ),
                ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                  ),
                  child: _content(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _content() {
    return cubit.sukien == S.current.ket_nois
        ? ListViewLoadMore(
            cubit: cubit,
            isListView: false,
            checkRatio: 1,
            callApi: (page) =>
                {cubit.getDataTrongNuoc(page, cubit.subCategory)},
            viewItem: (value, index) {
              try {
                return ItemListTrongNuoc(
                  model: value as ItemTrongNuocModel,
                );
              } catch (e) {
                return const SizedBox();
              }
            },
          )
        : ListViewLoadMore(
            cubit: cubit,
            isListView: false,
            checkRatio: 1,
            callApi: (page) => {
              cubit.getListCategory(
                pageIndex: page,
                pageSize: cubit.pageSize,
                idDauMucSuKien: cubit.subCategory,
                type: cubit.type,
              )
            },
            viewItem: (value, index) {
              try {
                return ItemListChung(
                  danhSachChungModel: value as DanhSachChungModel,
                  index: index ?? 0,
                );
              } catch (e) {
                return const SizedBox();
              }
            },
          );
  }
}
