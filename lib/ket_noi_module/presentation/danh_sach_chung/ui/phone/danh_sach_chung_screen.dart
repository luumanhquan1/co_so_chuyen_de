import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/color.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/trong_nuoc.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/widget/item_list_chung.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/widget/item_list_trong_nuoc.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/phone/ket_noi_menu.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/bloc/tao_su_kien_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/ui/phone/tao_su_kien_screen.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/app_bar/base_app_bar.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/drawer_slide/drawer_slide.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DanhSachChungScreen extends StatefulWidget {
  const DanhSachChungScreen({Key? key}) : super(key: key);

  @override
  _DanhSachChungScreenState createState() => _DanhSachChungScreenState();
}

class _DanhSachChungScreenState extends State<DanhSachChungScreen> {
  late final KetNoiCubit cubit;
  TaoSuKienCubit taoSuKienCubit = TaoSuKienCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = KetNoiCubit();
    taoSuKienCubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: cubit.streamHeader,
      builder: (context, snap) {
        final data = snap.data ?? S.current.chung;
        return Scaffold(
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
                  DrawerSlide.navigatorSlide(
                    context: context,
                    screen: KetNoiMenu(
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
                    thenValue: (value) {},
                  );
                },
                icon: SvgPicture.asset(
                  ImageAssets.ic_mennu_ykien,
                ),
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: _content(),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: labelColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TaoSuKienKetNoi(),
                ),
              );
            },
            child: SvgPicture.asset(ImageAssets.ic_vector),
          ),
        );
      },
    );
  }

  Widget _content() {
    return cubit.sukien == S.current.ket_nois
        ? ListViewLoadMore(
            cubit: cubit,
            isListView: true,
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
            isListView: true,
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
