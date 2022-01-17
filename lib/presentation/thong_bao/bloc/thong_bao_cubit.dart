import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/thong_bao/thong_bao_model.dart';
import 'package:ccvc_mobile/presentation/thong_bao/bloc/thong_bao_state.dart';
import 'package:ccvc_mobile/presentation/thong_bao/fake_data.dart';
import 'package:ccvc_mobile/presentation/thong_bao/ui/thong_bao_type.dart';
import 'package:rxdart/rxdart.dart';

class ThongBaoCubit extends BaseCubit<ThongBaoState> {
  ThongBaoCubit() : super(ThongBaoStateInitial());

  BehaviorSubject<List<ThongBaoModel>> thongBaoSubject =
      BehaviorSubject<List<ThongBaoModel>>();

  Stream<List<ThongBaoModel>> get thongBaoStream => thongBaoSubject.stream;

  void getThongBao() {
    thongBaoSubject.add(fakeDataThongBao);
  }

  ThongBaoType typeContent(String title) {
    switch(title) {
      case 'Có lịch họp mới' : return ThongBaoType.LichHopMoi;
      case 'Có tin nhắn mới' : return ThongBaoType.TinNhanMoi;
      default : return ThongBaoType.TinNhanMoi;
    }
  }

  void dispose() {
    thongBaoSubject.close();
    super.close();
  }
}
