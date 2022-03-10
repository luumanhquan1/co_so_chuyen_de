import 'package:ccvc_mobile/ket_noi_module/domain/model/ket_noi_item_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/danh_sach_chung/bloc/ket_noi_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/menu/ui/phone/ket_noi_menu.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/app_bar/base_app_bar.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/drawer_slide/drawer_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DanhSachChungScreen extends StatefulWidget {
  const DanhSachChungScreen({Key? key}) : super(key: key);

  @override
  _DanhSachChungScreenState createState() => _DanhSachChungScreenState();
}

class _DanhSachChungScreenState extends State<DanhSachChungScreen> {
  final KetNoiCubit cubit = KetNoiCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TypeKetNoiMenu>(
      stream: cubit.streamTypeKetNoiMenu,
      builder: (context, snapshot) {
        print("sss${snapshot.data}");
        return Scaffold(
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
                onPressed: () {
                  DrawerSlide.navigatorSlide(
                    context: context,
                    screen: KetNoiMenu(
                      cubit: cubit,
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  ImageAssets.ic_mennu_ykien,
                ),
              ),
            ],
          ),
          body: Container(
            color: Colors.red,
            height: 50,
          ),
        );
      },
    );
  }
}
