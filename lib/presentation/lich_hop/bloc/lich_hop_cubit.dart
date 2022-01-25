import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_state.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

enum Type_Choose_Option_Day {
  DAY,
  WEEK,
  MONTH,
}
enum Type_Choose_Option_List {
  // DANH_SACH,
  DANG_LICH,
  DANG_LIST,
}

class LichHopCubit extends BaseCubit<LichHopState> {
  bool isCheckNgay = false;
  bool chooseDay = false;
  bool chooseWeed = false;
  bool chooseMonth = false;
  late BuildContext context;

  LichHopCubit() : super(LichHopStateIntial());
  List<String> listImageLichHopCuaToi = [
    ImageAssets.icLichCongTacTrongNuoc,
    ImageAssets.lichCanKlch,
    ImageAssets.lichSapToi,
    ImageAssets.icLichCongTacNuocNgoai,
  ];

  dynamic currentTime = DateFormat.yMMMEd().format(DateTime.now());

  chooseTypeList(Type_Choose_Option_List type) {
    if (type == Type_Choose_Option_List.DANG_LICH) {
      emit(const LichHopStateDangLich(Type_Choose_Option_List.DANG_LICH));
    } else if(type == Type_Choose_Option_List.DANG_LIST) {
      emit(const LichHopStateDangList(Type_Choose_Option_List.DANG_LIST));
    }
  }
    // chooseTypeDay(Type_Choose_Option_Day type) {
    //   if (type == Type_Choose_Option_Day.DAY) {
    //     emit(const LichHopStateDay(Type_Choose_Option_Day.DAY));
    //   }
    //   else if(type==Type_Choose_Option_Day.WEEK){
    //     emit(const LichHopStateDay(Type_Choose_Option_Day.WEEK));
    //   }else{
    //     emit(const LichHopStateDay(Type_Choose_Option_Day.MONTH));
    //   }
    // }
  }
