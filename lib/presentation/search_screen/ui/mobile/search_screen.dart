import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/fake_data.dart';
import 'package:ccvc_mobile/presentation/search_screen/bloc/search_cubit.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/bao_chi_mang_xa_hoi_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/lich_hop_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/lich_lam_viec_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/search_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/tong_hop_nv_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/tu_khoa_pho_bien_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/van_ban_widget.dart';
import 'package:ccvc_mobile/presentation/search_screen/ui/widget/y_kien_nguoi_dan_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchCubit searchCubit = SearchCubit();

  @override
  void initState() {
    super.initState();
    searchCubit.configWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          S.current.tim_kiem,
          style: textNormalCustom(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: unselectLabelColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const SearchWidget(),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                color: homeColor,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.tu_khoa_pho_bien,
                            style: textNormalCustom(
                              color: unselectLabelColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TuKhoaPhoBienWidget(listKeyWord: fakeTuKhoaThongDung),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    VanBanWidget(
                      time: 'Cá nhân - Hôm nay',
                      listDocument: FakeData.documentList,
                    ),
                    TongHopNVWidget(
                      time: 'Cá nhân - Hôm nay',
                      listData: FakeData.listNhiemView,
                    ),
                    YKienNguoiDanWidget(
                      time: 'Cá nhân - Hôm nay',
                      listData: FakeData.documentList,
                    ),
                    LichLamViecWidget(
                      time: 'Cá nhân - Hôm nay',
                      listData: FakeData.caledar,
                    ),
                    LichHopWidget(
                      time: 'Cá nhân - Hôm nay',
                      listData: FakeData.caledar,
                    ),
                    BaoChiMangXaHoiWidget(
                      time: 'Cá nhân - Hôm nay',
                      listData: FakeData.fakeDataPress,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
