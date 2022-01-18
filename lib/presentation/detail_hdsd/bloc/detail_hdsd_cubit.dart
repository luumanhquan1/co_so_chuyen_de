import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/detail_hdsd/bloc/detail_hdsd_state.dart';

class DetailHDSDCubit extends BaseCubit<DetailHDSDState> {
  DetailHDSDCubit() : super(DetailHDSDStateIntial());

  List<String> listHDSD = [
    '- Người dùng tạo ra lịch sẽ được tạo và cập nhật chương trình họp cho lịch đó',
    '- Có thể tạo nhiều phiên họp cho 1 lịch họp',
    '- Thời gian mỗi phiên họp phải nằm trong khoảng thời gian họp',
    '- Người chủ trì phiên họp có thể là bất cứ ai',
    '- Sau khi Lưu phiên họp thì có thể Sửa, Xóa, Bắt đầu phiên họp',
    '- Sau khi Bắt đầu phiên họp thì có thể Kết thúc phiên họp',
    '- Có 3 trạng thái phiên họp: Chưa diễn ra, Đang diễn ra, Đã kết thúc (Phân loại theo màu)',
    '- Người dùng chọn tự động cập nhật trạng thái phiên họp theo thời gian thì phiên họp được tự động bắt đầu/kết thúc khi tới giờ họp'
  ];
}
