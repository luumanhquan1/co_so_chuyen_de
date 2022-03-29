import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tin_tuc_thoi_su/tin_tuc_thoi_su_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/bloc/tin_tuc_thoi_su_bloc.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/tablet/tin_radio_tablet.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/tablet/widgets/ban_tin_btn_tablet.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/tablet/widgets/ban_tin_item.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

enum dropDown { tinRadio, tinTrongNuoc }

class TinTucThoiSuScreenTablet extends StatefulWidget {
  final TinTucThoiSuBloc tinTucThoiSuBloc;
  final BuildContext pContext;

  const TinTucThoiSuScreenTablet({
    Key? key,
    required this.tinTucThoiSuBloc,
    required this.pContext,
  }) : super(key: key);

  @override
  State<TinTucThoiSuScreenTablet> createState() =>
      _TinTucThoiSuScreenTabletState();
}

class _TinTucThoiSuScreenTabletState extends State<TinTucThoiSuScreenTablet> {
  dropDown? valueChoose = dropDown.tinRadio;
  // late List<TinTucRadioModel> listTinTuc;

  @override
  void initState() {
    super.initState();
    widget.tinTucThoiSuBloc.listTinTuc.clear();
    widget.tinTucThoiSuBloc
        .getListTinTucRadio(1, ApiConstants.DEFAULT_PAGE_SIZE);
    // widget.tinTucThoiSuBloc.changeItem(dropDown.tinRadio);
    // widget.tinTucThoiSuBloc
    //     .getListTinTucRadio('2022/02/12 00:00:00', '2022/03/14 23:59:59');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', ''),
        stream: widget.tinTucThoiSuBloc.stateStream,
        child: SingleChildScrollView(
          child: Container(
            color: bgCalenderColor,
            padding: const EdgeInsets.fromLTRB(30, 28, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<TinTucRadioResponseModel>(
                  stream: widget.tinTucThoiSuBloc.listTinTucRadio,
                  builder: (context, snapshot) {
                    return BanTinItemTablet(
                      listTinTuc: widget.tinTucThoiSuBloc.listTinTuc,
                      clickXemThem: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TinRadioScreen(
                              pContext: widget.pContext,
                              tinTucThoiSuBloc: widget.tinTucThoiSuBloc,
                              title: S.current.tin_radio,
                              listBanTin: widget.tinTucThoiSuBloc.listTinTuc,
                            ),
                          ),
                        );
                        widget.tinTucThoiSuBloc.listTinTuc.clear();
                      },
                      title: S.current.tin_radio,
                      description: S.current.tin_radio_mieu_ta,
                      clickPLay: () {
                        showBottomSheetCustom(
                          context,
                           title: S.current.ban_tin_trua_ngay,
                          child:  BanTinBtnSheetTablet(
                            listTinTuc: widget.tinTucThoiSuBloc.listTinTuc,
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                const Divider(
                  height: 1,
                  color: bgDropDown,
                ),
                const SizedBox(
                  height: 28,
                ),
                StreamBuilder<TinTucRadioResponseModel>(
                  stream: widget.tinTucThoiSuBloc.listTinTucRadio,
                  builder: (context, snapshot) {
                    return BanTinItemTablet(
                      listTinTuc: widget.tinTucThoiSuBloc.listTinTuc,
                      clickXemThem: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TinRadioScreen(
                              title: S.current.tin_trong_nuoc,
                              listBanTin: widget.tinTucThoiSuBloc.listTinTuc,
                              pContext:widget.pContext ,
                              tinTucThoiSuBloc: widget.tinTucThoiSuBloc,
                            ),
                          ),
                        );
                      },
                      title: S.current.tin_trong_nuoc,
                      description: S.current.tin_trong_nuoc_mieu_ta,
                      clickPLay: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
