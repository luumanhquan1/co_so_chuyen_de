import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/widget/cell_list_ca_nhan.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class DanhBaCaNhan extends StatefulWidget {
  const DanhBaCaNhan({Key? key}) : super(key: key);

  @override
  _DanhBaCaNhanState createState() => _DanhBaCaNhanState();
}

class _DanhBaCaNhanState extends State<DanhBaCaNhan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              BaseSearchBar(
                hintText: S.current.tim_kiem_danh_ba,
                onChange: (value) {},
              ),
              spaceH20,
              Row(
                children: [
                  Image.asset(ImageAssets.icDanhBa),
                  spaceW16,
                  Text(
                    S.current.danh_ba_tu_may,
                    style: tokenDetailAmount(fontSize: 16, color: titleColor),
                  )
                ],
              ),
              spaceH16,
              Row(
                children: [
                  Image.asset(ImageAssets.icThemMoi),
                  spaceW16,
                  Text(
                    S.current.them_moi,
                    style: tokenDetailAmount(fontSize: 16, color: titleColor),
                  )
                ],
              ),
              spaceH30,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CellListCaNhan(
                    tieuDe: 'luc',
                    chuDe: 'aa',
                    loaiHDSD: 'sss',
                    onTapXoa: () {},
                    onTapEdit: () {},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
