import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/hoi_dap/hoi_dap.dart';
import 'package:ccvc_mobile/presentation/hoi_dap/bloc/hoi_dap_state.dart';

class HoiDapCubit extends BaseCubit<HoiDapState> {
  HoiDapCubit() : super(HoiDapStateIntial());
  HoiDap hoiDap = HoiDap();

  List<HoiDap> listHoiDap = [
    HoiDap(
        tieuDe: 'Danh sách lịch sẽ được hiển thị những loại lịch nào?',
        chuDe: 'Lịch làm việc',
        loaiHDSD: 'QA',
        danhSach: 'alo alo',
        noiDung: 'Hòa chung vào không khí đón Tết đang cận kề'),
    HoiDap(
      tieuDe: 'Danh sách lịch sẽ được hiển thị những loại lịch nào?',
      chuDe: 'Lịch làm việc',
      loaiHDSD: 'QA',
    ),
    HoiDap(
      tieuDe: 'Danh sách lịch sẽ được hiển thị những loại lịch nào?',
      chuDe: 'Lịch làm việc',
      loaiHDSD: 'QA',
    ),
    HoiDap(
      tieuDe: 'Danh sách lịch sẽ được hiển thị những loại lịch nào?',
      chuDe: 'Lịch làm việc',
      loaiHDSD: 'QA',
    ),
    HoiDap(
      tieuDe: 'Danh sách lịch sẽ được hiển thị những loại lịch nào?',
      chuDe: 'Lịch làm việc',
      loaiHDSD: 'QA',
    )
  ];

  bool isCheck = false;
  List<String> listText = ['Tất cả', 'Báo cáo', 'Lịch làm việc ', 'Họp'];
  String textContent = 'Tất cả';
  String changeOption = 'Tất cả';
}
