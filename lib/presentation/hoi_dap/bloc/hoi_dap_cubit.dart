import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/hoi_dap/hoi_dap.dart';
import 'package:ccvc_mobile/presentation/hoi_dap/bloc/hoi_dap_state.dart';

class HoiDapCubit extends BaseCubit<HoiDapState> {
  HoiDapCubit() : super(HoiDapStateIntial());
  List<HoiDap> listHoiDap = [
    HoiDap('Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        'Lịch làm việc', 'QA'),
    HoiDap('Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        'Lịch làm việc', 'QA'),
    HoiDap('Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        'Lịch làm việc', 'QA'),
    HoiDap('Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        'Lịch làm việc', 'QA'),
    HoiDap('Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        'Lịch làm việc', 'QA'),
    HoiDap('Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        'Lịch làm việc', 'QA'),
    HoiDap('Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        'Lịch làm việc', 'QA'),
  ];
}
