import 'dart:core';

import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
const String MENU_BAOCAO         ='menu_baocao';
const String MENU_LICHLAMVIEC     ='menu_lichlamviec';
const String MENU_HOP             ='menu_hop';
const String MENU_QUANLYNHIEMVU     ='menu_quanlynhiemvu';
const String MENU_HANHCHINHCONG     ='menu_hanhchinhcong';
const String MENU_YKIENNGUOIDAN    ='menu_ykiennguoidan';
const String MENU_QUANLYVANBAN      ='menu_quanlyvanban';
const String MENU_BAOCHIMANGXAHOI    ='menu_baochi_mangxahoi';
const String MENU_CCTVCAMBIEN       ='menu_cctv_cambien';
const String MENU_KETNOI            ='menu_ketnoi';
const String MENU_TUONGTACNOIBO     ='menu_tuongtacnoibo';
const String MENU_TIENICH            ='menu_tienich';
const String MENU_DANHBA           ='menu_danhba';
enum TypeIconHDSD {
  menu_baocao,
  menu_lichlamviec,
  menu_hop,
  menu_quanlynhiemvu,
  menu_hanhchinhcong,
  menu_ykiennguoidan,
  menu_quanlyvanban,
  menu_baochi_mangxahoi,
  menu_cctv_cambien,
  menu_ketnoi,
  menu_tuongtacnoibo,
  menu_tienich,
  menu_danhba,
}
extension IconTypeItem on TypeIconHDSD{
  String getIconHDSD(){
    switch(this){
      case TypeIconHDSD.menu_baocao:
        return ImageAssets.icBaoCao;
      case TypeIconHDSD.menu_lichlamviec:
        return ImageAssets.icLichLamViec;
      case TypeIconHDSD.menu_hop:
        return ImageAssets.icHop;
      case TypeIconHDSD.menu_quanlynhiemvu:
        return ImageAssets.icQuanLyNhiemVu;
      case TypeIconHDSD.menu_hanhchinhcong:
        return ImageAssets.icHanhChinhCong;
      case TypeIconHDSD.menu_ykiennguoidan:
        return ImageAssets.icYKienNguoiDan;
      case TypeIconHDSD.menu_quanlyvanban:
        return ImageAssets.icQuanLyVanBan;
      case TypeIconHDSD.menu_baochi_mangxahoi:
        return ImageAssets.icBaoChiMangXaHoi;
      case TypeIconHDSD.menu_cctv_cambien:
        return ImageAssets.icCctvCamBien;
      case TypeIconHDSD.menu_ketnoi:
        return ImageAssets.icKetNoi;
      case TypeIconHDSD.menu_tuongtacnoibo:
        return ImageAssets.icTuongTacNoiBo;
      case TypeIconHDSD.menu_tienich:
        return ImageAssets.icTienIch;
      case TypeIconHDSD.menu_danhba:
        return ImageAssets.icDanhBaDienTuHdsd;
    }
  }
}


class TopicHDSD {
  String? maTopic;
  String? icon;
  String? id;
  String? title;
  int?    order;
  bool?   inUsed;
  bool?   isDeleted;
  String? createdOn;
  String? createdBy;
  String? updatedOn;
  String? updatedBy;
  TypeIconHDSD typeIconHDSD=TypeIconHDSD.menu_danhba;

  TopicHDSD({
    this.maTopic,
    this.icon,
    this.id,
    this.title,
    this.order,
    this.inUsed,
    this.isDeleted,
    this.createdOn,
    this.createdBy,
    this.updatedOn,
    this.updatedBy,
  }){
    typeIconHDSD=toIcon();
  }
  TypeIconHDSD toIcon(){
    switch(maTopic){
      case MENU_BAOCAO:
        return TypeIconHDSD.menu_baocao;
      case MENU_LICHLAMVIEC:
        return TypeIconHDSD.menu_lichlamviec;
      case MENU_HOP:
        return TypeIconHDSD.menu_hop;
      case MENU_QUANLYNHIEMVU:
        return TypeIconHDSD.menu_quanlynhiemvu;
      case MENU_HANHCHINHCONG:
        return TypeIconHDSD.menu_hanhchinhcong;
      case MENU_YKIENNGUOIDAN:
        return TypeIconHDSD.menu_ykiennguoidan;
      case MENU_QUANLYVANBAN:
        return TypeIconHDSD.menu_quanlyvanban;
      case MENU_BAOCHIMANGXAHOI:
        return TypeIconHDSD.menu_baochi_mangxahoi;
      case MENU_CCTVCAMBIEN:
        return TypeIconHDSD.menu_cctv_cambien;
      case MENU_KETNOI:
        return TypeIconHDSD.menu_ketnoi;
      case MENU_TUONGTACNOIBO:
        return TypeIconHDSD.menu_tuongtacnoibo;
      case MENU_TIENICH:
        return TypeIconHDSD.menu_tienich;
      case MENU_DANHBA:
        return TypeIconHDSD.menu_danhba;
  }
  return TypeIconHDSD.menu_danhba;
  }

  TopicHDSD.empty();
}

class ItemTopicHDSD {
  final String url;
  final String title;

  ItemTopicHDSD({
    required this.url,
    required this.title,
  });
}
