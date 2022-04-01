
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/yknd_dash_board_item.dart';
import 'package:ccvc_mobile/domain/repository/y_kien_nguoi_dan/y_kien_nguoi_dan_repository.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/widget/bao_cao_thong_ke/bloc/bao_cao_thong_ke_state.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';


enum StatusType { CHUA_THUC_HIEN, DA_HOAN_THANH, DANG_THUC_HIEN }

class BaoCaoThongKeYKNDCubit extends BaseCubit<BaoCaoThongKeYKNDState> {
  BaoCaoThongKeYKNDCubit() : super(BaoCaoThongKeYKNDStateInitial());

  final BehaviorSubject<List<YKienNguoiDanDashBroadItem>> _listBaoCaoYKND =
  BehaviorSubject<List<YKienNguoiDanDashBroadItem>>();

  Stream<List<YKienNguoiDanDashBroadItem>> get listBaoCaoYKND =>
      _listBaoCaoYKND.stream;

  final List<String> titleBaoCaoYKND=[
    S.current.cho_tiep_nhan,
    S.current.da_xu_ly,
    S.current.dang_tai_cong_khai,
    S.current.dang_xu_ly,
    S.current.so_luong_y_kien,
  ];

  final List<String> imgBaoCaoYKND=[
    S.current.cho_tiep_nhan,
    S.current.da_xu_ly,
    S.current.dang_tai_cong_khai,
    S.current.dang_xu_ly,
    S.current.so_luong_y_kien,
  ];


  final YKienNguoiDanRepository _YKNDRepo = Get.find();
  Future<void> baoCaoYKND(
      String tuNgay,
      String denNgay,
      ) async {
     showLoading();
    final result = await _YKNDRepo.baoCaoYKienNguoiDan(
      tuNgay,
      denNgay,
    );
    showContent();
    result.when(
      success: (res) {
        List<YKienNguoiDanDashBroadItem> listBaoCao=[];
        listBaoCao.add(
          YKienNguoiDanDashBroadItem(
            img: ImageAssets.ic_tong_so_yknd,
            numberOfCalendars: res.thongKeYKNDData.soLuongYKien,
            typeName: S.current.so_y_kien_tiep_nha,
          ),
          );
        listBaoCao.add(
          YKienNguoiDanDashBroadItem(
            img: ImageAssets.ic_da_xu_ly_yknd,
            numberOfCalendars: res.thongKeYKNDData.daXuLy,
            typeName: S.current.da_xu_ly,
          ),
        );
        listBaoCao.add(
          YKienNguoiDanDashBroadItem(
            img: ImageAssets.ic_dang_xu_ly_yknd,
            numberOfCalendars: res.thongKeYKNDData.dangXuLy,
            typeName: S.current.dang_xu_ly,
          ),
        );
        listBaoCao.add(
          YKienNguoiDanDashBroadItem(
            img: ImageAssets.ic_dang_tai_cong_khai_yknd,
            numberOfCalendars: res.thongKeYKNDData.dangTaiCongKhai,
            typeName: S.current.dang_tai_cong_khai,
          ),
        );
        listBaoCao.add(
          YKienNguoiDanDashBroadItem(
            img: ImageAssets.ic_tong_so_yknd,
            numberOfCalendars: res.thongKeYKNDData.soLuongYKien,
            typeName: S.current.so_luong_y_kien,
          ),
        );
       _listBaoCaoYKND.sink.add(listBaoCao);
      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> dashBoardBaoCaoYKND(
      String tuNgay,
      String denNgay,
      ) async {
    showLoading();
    final result = await _YKNDRepo.dashBoardBaoCaoYKND(
      tuNgay,
      denNgay,
    );
    showContent();
    result.when(
      success: (res) {
        print('------------------------------ thanh cong------------------');
      },
      error: (err) {
        print('---------------------------------- that bai------------------');
        return;
      },
    );
  }


}
