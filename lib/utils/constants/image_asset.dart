import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageAssets {
  ///Svg path
  static const String icBack = '$baseImg/ic_back.svg';

  static const String icHomeFocus = '$baseImg/ic_home.svg';
  static const String icHomeUnFocus = '$baseImg/ic_home_unfocus.svg';
  static const String icChartUnFocus = '$baseImg/ic_chart.svg';
  static const String icChartFocus = '$baseImg/ic_bao_cao.svg';
  static const String icCalendarUnFocus = '$baseImg/ic_calendar.svg';
  static const String icCalendarFocus = '$baseImg/ic_calendar_focus.svg';
  static const String icMessageUnFocus = '$baseImg/ic_message.svg';
  static const String icMessageFocus = '$baseImg/ic_chat_focus.svg';
  static const String icMenuUnFocus = '$baseImg/ic_menu.svg';
  static const String icMenuFocus = '$baseImg/ic_menu_focus.svg';
  static const String icPlus = '$baseImg/ic_cong.svg';
  static const String icClose = '$baseImg/ic_close.svg';
  static const String icNext = '$baseImg/ic_next.svg';
  static const String icSinhNhat = '$baseImg/ic_sinh_nhat.svg';

  static const String icMore = '$baseImg/ic_more.svg';
  static const String icEdit = '$baseImg/ic_edit.svg';
  static const String icStarUnfocus = '$baseImg/ic_start_unfocus.svg';
  static const String icStarFocus = '$baseImg/ic_start_focus.svg';
  static const String icTag = '$baseImg/ic_tag.svg';
  static const String icAddress = '$baseImg/ic_addres.svg';
  static const String icSoKyHieu = '$baseImg/ic_so_ky_hieu.svg';
  static const String icTime = '$baseImg/ic_time.svg';
  static const String icPeople = '$baseImg/ic_people.svg';
  static const String icCamera = '$baseImg/ic_camera.svg';

  ///SvgImage
  static const String appBarBackground = '$baseImg/app_bar_background.png';
  static const String headerBackground = '$baseImg/header_background.png';
  static const String headerMenu = '$baseImg/header_menu.png';
  static const String icPlay = '$baseImg/ic_play.svg';
  static const String icMenuCalender = '$baseImg/menu_calender.svg';
  static const String icAddButtonCalender = '$baseImg/add_button_calender.svg';
  static const String icTongSoLichLamviec =
      '$baseImg/tong_so_lich_lam_viec.svg';
  static const String icLichCongTacTrongNuoc =
      '$baseImg/lich_cong_tac_trong_nuoc.svg';
  static const String icLichLamViec = '$baseImg/lich_lam_viec.svg';
  static const String icLichCongTacNuocNgoai =
      '$baseImg/lich_cong_tac_nuoc_ngoai.svg';
  static const String icLichTiepDan = '$baseImg/lich_tiep_dan.svg';
  static const String icAdminTao = '$baseImg/admin_tao.svg';
  static const String icNextDropDown = '$baseImg/ic_next_drop_down.svg';
  static const String icBackDropDown = '$baseImg/ic_back_drop_down.svg';
  static const String icDropDownButton =
      '$baseImg/ic_drop_down_button_down.svg';
  static const String icQuanLyNhiemVu = '$baseImg/ic_quan_ly_nhiem_vu.svg';
  static const String icHanhChinhCong = '$baseImg/ic_hanh_chinh_cong.svg';
  static const String icPrevAppbar = '$baseImg/prev_appbar.svg';
  static const String icAdd = '$baseImg/add.svg';
  static const String imgLogin = '$baseImg/img_login.png';
  static const String imgAcount = '$baseImg/ic_acount.svg';
  static const String imgPassword = '$baseImg/ic_password.svg';
  static const String imgViewHide = '$baseImg/ic_view_hide.svg';
  static const String imgView = '$baseImg/ic_view.svg';
  static const String imgBackGroundLogin = '$baseImg/image_login_background.svg';

  static const String icYKienNguoiDan = '$baseImg/ic_y_kien_nguoi_dan.svg';
  static const String icQuanLyVanBan = '$baseImg/ic_quan_ly_van_ban.svg';
  static const String icBaoChiMangXaHoi = '$baseImg/ic_bao_chi_mang_xa_hoi.svg';
  static const String icKetNoi = '$baseImg/ic_ket_noi.svg';
  static const String icTienIch = '$baseImg/ic_tien_ich.svg';
  static const String icChuyenPhamVi = '$baseImg/ic_chuyen_pham_vi.svg';
  static const String icCaiDatGiaoDien = '$baseImg/ic_cai_dat_giao_dien.svg';
  static const String icHoiDap = '$baseImg/ic_hoi_dap.svg';
  static const String icDoiMatKhau = '$baseImg/ic_doi_mat_khau.svg';

  static const String icImageChangePassword =
      '$baseImg/image_change_password.svg';
  static const String icImageLockReset = '$baseImg/image_lock_reset.svg';
  static const String icBaoChi='$baseImg/ic_bao_chi.svg';
  static const String icBlog='$baseImg/ic_blog.svg';
  static const String icForum='$baseImg/ic_forum.svg';
  static const String icMangXaHoi='$baseImg/ic_mang_xa_hoi.svg';
  static const String icNguonKhac='$baseImg/ic_nguon_khac.svg';
  static const String icTongTin='$baseImg/ic_tong_tin.svg';
  static const String icBaiViet='$baseImg/ic_bai_viet.svg';
  static const String icComment='$baseImg/ic_comment.svg';
  static const String icLike='$baseImg/ic_like.svg';
  static const String icShare='$baseImg/ic_share.svg';
  static const String icCalendar='$baseImg/ic_calendar.svg';
  static const String icLock='$baseImg/ic_lock.svg';
  static const String icShieldDone='$baseImg/ic_shield_done.svg';
  static const String image_lock_reset='$baseImg/image_lock_reset.svg';
  static const String ic_email='$baseImg/ic_email.svg';



  ///gif
  static const String gifKhanCap = '$baseImg/gif_khan_cap.gif';

  ///SvgImage
  static const String icStar = '$baseImg/ic_start.png';


  static SvgPicture svgAssets(
    String name, {
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
    BlendMode? blendMode,
  }) {
    final size = _svgImageSize[name];
    var w = width;
    var h = height;
    if (size != null) {
      w = width ?? size[0];
      h = height ?? size[1];
    }
    return SvgPicture.asset(
      name,
      colorBlendMode: blendMode ?? BlendMode.srcIn,
      color: color,
      width: w,
      height: h,
      fit: fit ?? BoxFit.none,
    );
  }

  static const Map<String, List<double>> _svgImageSize = {
  };
}
