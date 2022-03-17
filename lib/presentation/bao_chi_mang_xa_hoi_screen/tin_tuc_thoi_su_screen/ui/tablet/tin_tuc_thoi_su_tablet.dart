import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tin_tuc_thoi_su/tin_tuc_thoi_su_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/bloc/tin_tuc_thoi_su_bloc.dart';
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
  late List<TinTucRadioModel> listTinTuc;

  @override
  void initState() {
    super.initState();
    // widget.tinTucThoiSuBloc.changeItem(dropDown.tinRadio);
    widget.tinTucThoiSuBloc
        .getListTinTucRadio('2022/02/12 00:00:00', '2022/03/14 23:59:59');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', ''),
        stream: widget.tinTucThoiSuBloc.stateStream,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 28,
              ),
              Text(
                S.current.tin_radio,
                style: textNormalCustom(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: titleColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                S.current.kenh_raido,
                style: textNormalCustom(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: dateColor,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
