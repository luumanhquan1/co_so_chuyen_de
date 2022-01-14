import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/hoi_dap/bloc/hoi_dap_cubit.dart';
import 'package:ccvc_mobile/presentation/hoi_dap/widget/custom_hoi_dap_widget_tablet.dart';
import 'package:ccvc_mobile/presentation/hoi_dap/widget/show_drop_drow_button_hoi_dap.dart';
import 'package:ccvc_mobile/presentation/search_screen/widget/search_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HoiDapScreenTablet extends StatefulWidget {
  const HoiDapScreenTablet({Key? key}) : super(key: key);

  @override
  _HoiDapScreenTabletState createState() => _HoiDapScreenTabletState();
}

class _HoiDapScreenTabletState extends State<HoiDapScreenTablet> {
  HoiDapCubit cubit = HoiDapCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: S.current.hoi_dap,
        leadingIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(ImageAssets.icBack),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.icAddButtonCalender),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0, right: 30.0, left: 30.0),
        child: Column(
          children: [
            SearchWidget(
              hintText: S.current.tim_kiem_hoi_dap,
            ),
            const SizedBox(
              height: 28.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.current.ban_co_the_tim_kiem_hoi_dap,
                        style: textNormalCustom(
                          fontSize: 16.0,
                          color: unselectedLabelColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          S.current.chu_de,
                          style: textNormalCustom(
                            fontSize: 16.0,
                            color: unselectedLabelColor,
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        ShowDropDownButtonHoiDap(
                          onChanged: (value) {
                            cubit.changeOption = value;
                          },
                          cubit: HoiDapCubit(),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 28.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cubit.listHoiDap.length,
                itemBuilder: (context, index) {
                  return CustomHoiDapWidgetTablet(
                    tieuDe: cubit.listHoiDap[index].tieuDe,
                    chuDe: cubit.listHoiDap[index].chuDe,
                    loaiHDSD: cubit.listHoiDap[index].loaiHDSD,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
