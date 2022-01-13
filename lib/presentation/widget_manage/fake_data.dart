import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';

class FakeData {
  static final List<WidgetModel> listUse = [
    WidgetModel(
        name: 'Tình hình xử lý văn bản',
        id: '',
        component: 'TinhHinhXuLyVanBan'),
    WidgetModel(name: 'Văn bản', id: '', component: 'VanBanWidGet'),
    WidgetModel(name: 'Tổng hợp nhiệm vụ', id: '', component: 'TongHopNhiemVu'),
    WidgetModel(
        name: 'Ý kiến người dân', id: '', component: 'YKienNguoiDanTongHop'),
    WidgetModel(name: 'Lịch làm việc', id: '', component: 'BoxLichLamViec'),
    WidgetModel(name: 'Lịch họp', id: '', component: 'BoxLichHop'),
    WidgetModel(name: 'Báo chị mạng xã hội', id: '', component: 'BaoChi'),
    WidgetModel(
        name: 'Danh sách công việc', id: '', component: 'BoxTodoList'),
    WidgetModel(
        name: 'Sự kiện trong ngày', id: '', component: 'SuKienTrongNgay'),
    WidgetModel(name: 'Sinh nhật', id: '', component: 'SinhNhat'),
  ];

  static final List<WidgetModel> listNotUse = List.generate(
      10,
      (index) => WidgetModel(
          id: 'bb', name: "Two ${index.toString()}", component: ''));
}
