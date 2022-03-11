import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/tien_ich_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class HuongDanSuDungCubit extends BaseCubit<HuongDanSuDungState> {
  HuongDanSuDungCubit() : super(MainStateInitial());

  TienIchRepository get tienIchRep => Get.find();

  BehaviorSubject<List<TopicHDSD>> topicHDSDSubject = BehaviorSubject();

  Stream<List<TopicHDSD>> get getTopicHDSDStream => topicHDSDSubject.stream;

  Future<void> getTopicHDSD() async {
    final result = await tienIchRep.getTopicHDSD();
    result.when(
      success: (res) {
        topicHDSDSubject.add(res);
      },
      error: (error) {},
    );
  }
}
