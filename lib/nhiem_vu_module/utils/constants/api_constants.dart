class ApiConstants {
  static const DANHSACHNHIEMVU = '/qlvb/api/qlnv/nhiem-vu/get-all';
  static const DANHSACHCONGVIEC =
      '/qlvb/api/qlnv/cong-viec/danhsachcongvieccanhan';
  static const GETDASHBROASHNHIEMVU =
      '/qlvb/api/qlnv/nhiem-vu/dem-loai-nhiem-vu/donvi';
  static const GETDASHBROASHCONGVIEC =
      '/qlvb/api/qlnv/cong-viec/dem-loai-cong-viec-don-vi';
  static const GETDASHBROASHNHIEMVUCANHAN =
      '/qlvb/api/qlnv/nhiem-vu/dem-loai-nhiem-vu/canhan';
  static const GETDASHBROASHCONGVIECCANHAN =
      '/qlvb/api/qlnv/cong-viec/dem-loai-cong-viec';
  static const int DEFAULT_PAGE_SIZE = 10;
  static const int PAGE_BEGIN = 1;
  static const int NOT_SAVED_ID = -1;
  static const int TIME_OUT = 30;

  static const GET_CHI_TIET_NHIEM_VU = '/qlvb/api/qlnv/nhiem-vu/get';
  static const GET_LICH_SU_PHAN_XU_LY_NHIEM_VU =
      '/qlvb/api/qlnv/phan-xu-ly/getbynhiemvu';
  static const GET_Y_KIEN_XU_LY = '/qlvb/api/qlnv/y-kien-xu-ly/{id}?';
  static const GET_DANH_SACH_CONG_VIEC_CHI_TIET_NHIEM_VU =
      '/qlvb/api/qlnv/cong-viec/dsbynhiemvu';
}

class ImageConstants {
  static const String noImageFound =
      'https://ccvc-uat.chinhquyendientu.vn/img/no-image-found.816e59fa.png';
}
