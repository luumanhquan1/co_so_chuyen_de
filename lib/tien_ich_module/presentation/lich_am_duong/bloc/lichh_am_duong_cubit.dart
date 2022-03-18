import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/lich_am_duong.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/lich_am_duong_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/lich_am_duong/bloc/lich_am_duong_state.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/extensions/date_time_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class LichAmDuongCubit extends BaseCubit<LichAmDuongState>{
  LichAmDuongCubit():super(MainStateInitial());

 LichAmDuongRepository get lichAmDuongRep =>Get.find();
  BehaviorSubject<LichAmDuong> lichAmDuongSubject =BehaviorSubject();

  Stream<LichAmDuong>get lichAmDuongStream => lichAmDuongSubject.stream;
  String startDate = DateTime.now().formatApiDDMMYYYY;
  void callApi(){
    getLichAmDuong(startDate);
  }
  Future<void> getLichAmDuong(String date) async{
    showLoading();
    final result = await lichAmDuongRep.getLichAmDuong(date);
    result.when(
      success: (res) {
        lichAmDuongSubject.add(res);
        showContent();
      },
      error: (error) {},
    );
  }

}