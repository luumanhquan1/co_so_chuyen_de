import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/list_lich_lv/list_lich_lv_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/bloc/calender_cubit.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/item_thong_bao.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/mobile/list/widget/custom_item_calender_work_mobile.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/widget/calender_provider.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_lam_viec/ui/phone/chi_tiet_lich_lam_viec_screen.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InListForm extends StatefulWidget {
  final CalenderCubit cubit;

  const InListForm({Key? key, required this.cubit}) : super(key: key);

  @override
  _InListFormState createState() => _InListFormState();
}

class _InListFormState extends State<InListForm> {
  late final CalenderCubit _cubit = widget.cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit.getDay();
    _cubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return CalenderProvider(
      cubit: _cubit,
      child: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', ''),
        stream: _cubit.stateStream,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cubit.changeItemMenuSubject.value.getHeader(
                cubit: _cubit,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: StreamBuilder<DataLichLvModel>(
                    stream: _cubit.streamListLich,
                    builder: (context, snapshot) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            _cubit.dataLichLvModel.listLichLVModel?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: CustomItemCalenderMobile(
                              title: _cubit.dataLichLvModel
                                      .listLichLVModel?[index].title ??
                                  '',
                              dateTimeFrom: DateTime.parse(
                                _cubit.dataLichLvModel.listLichLVModel?[index]
                                        .dateTimeFrom ??
                                    '',
                              ).toStringWithAMPM,
                              dateTimeTo: DateTime.parse(
                                _cubit.dataLichLvModel.listLichLVModel?[index]
                                        .dateTimeTo ??
                                    '',
                              ).toStringWithAMPM,
                              urlImage:
                                  'https://th.bing.com/th/id/R.91e66c15f578d577c2b40dcf097f6a98?rik=41oluNFG8wUvYA&pid=ImgRaw&r=0',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChiTietLichLamViecScreen(),
                                  ),
                                );
                              },
                              isTrung: _cubit.dataLichLvModel
                                      .listLichLVModel?[index].isLichLap ??
                                  true,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
