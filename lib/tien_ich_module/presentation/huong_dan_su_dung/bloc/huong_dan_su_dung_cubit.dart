import 'dart:async';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_sach_title_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/tien_ich_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_state.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';

class HuongDanSuDungCubit extends BaseCubit<HuongDanSuDungState> {
  HuongDanSuDungCubit() : super(MainStateInitial());

  TienIchRepository get tienIchRep => Get.find();

  BehaviorSubject<List<TopicHDSD>> topicHDSDSubject = BehaviorSubject();

  Stream<List<TopicHDSD>> get getTopicHDSDStream => topicHDSDSubject.stream;
  List<DanhSachTitleHDSD> dataDanhSachTitleHDSD = [];

  BehaviorSubject<List<DanhSachTitleHDSD>> danhSachTitleHDSDSubject =
      BehaviorSubject.seeded([
    DanhSachTitleHDSD(
        title: 'Làm cách nào để tôi có thể xem được các báo cáo khác nhau?',
        topic:
            'Các báo cáo được hiển thị theo quyền hạn được thiết lập theo phòng ban, chức vụ của tài khoản đang đăng nhập nhằm kiểm soát vùng dữ liệu được phép sử dụng.'),
    DanhSachTitleHDSD(
        title: 'Làm cách nào để tôi có thể xem được các báo cáo khác nhau?',
        topic:
            'Các báo cáo được hiển thị theo quyền hạn được thiết lập theo phòng ban, chức vụ của tài khoản đang đăng nhập nhằm kiểm soát vùng dữ liệu được phép sử dụng.'),
    DanhSachTitleHDSD(
        title: 'Làm cách nào để tôi có thể xem được các báo cáo khác nhau?',
        topic:
            'Các báo cáo được hiển thị theo quyền hạn được thiết lập theo phòng ban, chức vụ của tài khoản đang đăng nhập nhằm kiểm soát vùng dữ liệu được phép sử dụng.'),
    DanhSachTitleHDSD(
        title: 'Làm cách nào để tôi có thể xem được các báo cáo khác nhau?',
        topic:
            'Các báo cáo được hiển thị theo quyền hạn được thiết lập theo phòng ban, chức vụ của tài khoản đang đăng nhập nhằm kiểm soát vùng dữ liệu được phép sử dụng.'),
  ]);

  Stream<List<DanhSachTitleHDSD>> get getDanhSachTitleHDSDStream =>
      danhSachTitleHDSDSubject.stream;

  Future<void> loadData() async {
    final queue = Queue(parallel: 2);
    unawaited(queue.add(() => getTopicHDSD()));
    unawaited(queue.add(() => getDanhSachHDSD()));

    await queue.onComplete;
    showContent();
    queue.dispose();
  }

  Future<void> getTopicHDSD() async {
    final result = await tienIchRep.getTopicHDSD();
    result.when(
      success: (res) {
        topicHDSDSubject.add(res);
      },
      error: (error) {},
    );
  }

  Future<void> getDanhSachHDSD() async {
    final result = await tienIchRep.getDanhSachHDSD(1, 1000, '', '');
    result.when(
      success: (res) {
        danhSachTitleHDSDSubject.add(res.pageData?.toList() ?? []);
      },
      error: (error) {},
    );
  }

  void search(String values) {
    final searchTxt = values.trim().toLowerCase().vietNameseParse();
    bool isListDanhSach(DanhSachTitleHDSD titleHDSD) {
      print(titleHDSD.title);
      return titleHDSD.title!
          .toLowerCase()
          .vietNameseParse()
          .contains(searchTxt);
    }
    final value =
        dataDanhSachTitleHDSD.where((event) => isListDanhSach(event)).toList();
    danhSachTitleHDSDSubject.add(value);
  }
}
