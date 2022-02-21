import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/y%20_kien_nguoi_dan/chi_tiet_yknd_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:rxdart/rxdart.dart';

import 'chi_tiet_y_kien_nguoidan_state.dart';

class ChiTietYKienNguoiDanCubit extends BaseCubit<ChiTietYKienNguoiDanState> {
  ChiTietYKienNguoiDanCubit() : super(CHiTietYKienNguoiDanStateInitial());

  final BehaviorSubject<HeaderChiTietYKNDModel> _headerChiTIet =
  BehaviorSubject<HeaderChiTietYKNDModel>();

  Stream<HeaderChiTietYKNDModel> get headerChiTIet => _headerChiTIet.stream;

  Map<String,String>mapData={};
  void getDataHeader(){
    _headerChiTIet.sink.add(fakeDataHeadler);
  }

  final fakeDataHeadler = HeaderChiTietYKNDModel(
    tieuDe:
        'Làm nhân viên văn phòng thất nghiệp gần 4 tháng nhưng chưa được nhận hỗ trợ do dịch Covid19',
    noiDung:
        'Làm nhân viên văn phòng thất nghiệp gần 4 tháng nhưng chưa được nhận hỗ trợ do dịch Covid19',
    nguonPAKN: 'App người dân',
    phanLoaiPAKN: 'Cơ chế của chính sách',
    ngayPhanAnh: '22/10/2021',
    hanXuLy: '22/10/2021',
    quyDinhLuat: 'Luật Tổ chức Chính phủ',
    taiLieuCongDan: 'file.pdf',
  );
  final fakeDataNguoiPhanAnh = NguoiPhanAnhModel(
    doiTuong:'',
    tenCaNhan: 'PAKN 2',
    cmnd: '017496898',
    diaChiEmail: 'chuyenviendonvi@gmail.com',
    soDienthoai: '0964950763',
    diaChiChiTiet: 'Khu phố 6, Phường Trung Dũng, Thành phố Biên Hòa - Đồng Nai',
  );
  List<DataHeader> getMapDataNguoiPhananh(){
    List<DataHeader>listData=[];
    listData.add( DataHeader(
        title: S.current.ten_ca_nhan_tc,
        content: fakeDataNguoiPhanAnh.tenCaNhan??''
    ),);
    listData.add( DataHeader(
        title: S.current.cmt_can_cuoc,
        content: fakeDataNguoiPhanAnh.cmnd??''
    ),);
    listData.add( DataHeader(
      title: S.current.dia_chi_mail,
      content: fakeDataNguoiPhanAnh.diaChiEmail??'',
    ),);
    listData.add( DataHeader(
      title: S.current.so_dien_thoai,
      content: fakeDataNguoiPhanAnh.soDienthoai??'',
    ),);
    listData.add( DataHeader(
      title: S.current.dia_chi_chi_tiet,
      content: fakeDataNguoiPhanAnh.diaChiChiTiet??'',
    ),);
    return listData;

  }

  List<DataHeader> getMapDataHeader(){
    List<DataHeader>listData=[];
    listData.add( DataHeader(
        title: S.current.tieu_de,
        content: fakeDataHeadler.tieuDe??''
    ),);
    listData.add( DataHeader(
        title: S.current.noidung,
        content: fakeDataHeadler.noiDung??''
    ),);
    listData.add( DataHeader(
        title: S.current.nguon_pakn,
        content: fakeDataHeadler.nguonPAKN??'',
    ),);
    listData.add( DataHeader(
        title: S.current.phan_loai_pakn,
        content: fakeDataHeadler.phanLoaiPAKN??'',
    ),);
    listData.add( DataHeader(
        title: S.current.ngay_phan_anh,
        content: fakeDataHeadler.ngayPhanAnh??'',
    ),);
    listData.add( DataHeader(
        title: S.current.han_xu_ly,
        content: fakeDataHeadler.hanXuLy??'',
    ),);
    listData.add( DataHeader(
        title: S.current.lien_quan_quy_dinh,
        content: fakeDataHeadler.quyDinhLuat??'',
    ),);
    listData.add( DataHeader(
        title: S.current.tai_lieu_dinh_kem_cong_dan,
        content: fakeDataHeadler.taiLieuCongDan??'',
    ),);
   return listData;

  }

}
