import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/nghe_ban_tin/bloc/play_radio_state.dart';
import 'package:rxdart/rxdart.dart';

class PlayRadioCubit extends BaseCubit<PlayRadioState> {
  PlayRadioCubit() : super(PlayRadioStateInitial());
  final BehaviorSubject<bool> _isPlay = BehaviorSubject.seeded(true);

  Stream<bool> get streamPlay => _isPlay.stream;

   void changePlay(){
      _isPlay.sink.add(!_isPlay.value);
   }
}
