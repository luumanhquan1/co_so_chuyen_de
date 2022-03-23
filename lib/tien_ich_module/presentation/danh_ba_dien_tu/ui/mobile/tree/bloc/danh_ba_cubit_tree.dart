import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/ui/mobile/tree/model/TreeModel.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/widget/tree.dart';
import 'package:rxdart/rxdart.dart';

class DanhBaCubitTree {
  BehaviorSubject<Tree> listTreeDanhBaSubject = BehaviorSubject<Tree>();
  List<TreeDonViDanhBA> listLuongPhanXuLy = [
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: '',
      iD_DonVi_Goc: '',
      id: "abcBoss",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "UBND huyện",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    ),
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: "abcBoss",
      iD_DonVi_Goc: '',
      id: "abc",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "xã",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    ),
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: "abc",
      iD_DonVi_Goc: '',
      id: "c8eac934-468e-4dcd-899a-45c2fba680b4",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "UBND tỉnh",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    ),
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: "abc",
      iD_DonVi_Goc: '',
      id: "abcfhikdujsujhshjza2",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "UBND thị trấn",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    ),
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: "abc",
      iD_DonVi_Goc: '',
      id: "c8eac934-468e-4dcd-899a-45c2fba680b4sdydsfhsfdh",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "UBND tỉnh",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    ),
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: "abcBoss",
      iD_DonVi_Goc: 'abc',
      id: "abc2",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "Ubnd huyện DN",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    ),
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: "abc2",
      iD_DonVi_Goc: '',
      id: "c8eac934-468e-4dcd-899a-45c2fba680b4fsfsf",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "TT đồng nai",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    ),
    TreeDonViDanhBA(
      bitDauMoiPAKN: false,
      bit_DonViBoPhan: false,
      bit_DonViSuNghiep: false,
      bit_DonViThuocBo: false,
      bit_KieuDonVi: null,
      bit_TrangThaiDonVi: null,
      capDonVi: 2,
      duongDan_ID_DonVi:
          "0BF3B2C3-76D7-4E05-A587-9165C3624D76,3D874447-A840-4686-8BC9-3CDB6BC8BC93,C8EAC934-468E-4DCD-899A-45C2FBA680B4",
      duongDan_ID_DonVi_Cha:
          "3d874447-a840-4686-8bc9-3cdb6bc8bc93,0bf3b2c3-76d7-4e05-a587-9165c3624d76",
      email: '',
      fax: null,
      hasDonViCon: false,
      iD_DonVi_Cha: "abcBoss",
      iD_DonVi_Goc: '',
      id: "c8eac934-468e-4dcd-899a-45c2fbfdhjfdjda680b4fsfsf",
      level: 2,
      maDonVi: "LDUH205",
      maLienThong: null,
      soDienThoai: null,
      tenDonVi: "UBND thị trấn",
      tenDonViCha: "UBND huyện Long Thành",
      tenDonViGoc: '',
      thuTu: 1,
    )
  ];

  void fakedata() {
    Tree ans = Tree();
    ans.initTree(listNode: listLuongPhanXuLy);
    listTreeDanhBaSubject.add(ans);
  }

  NodeHSCV? getRoot() {
    if (listTreeDanhBaSubject.hasValue) {
      return listTreeDanhBaSubject.value.getRoot();
    }
  }

  int levelTree = 0;
  BehaviorSubject<String> tenDonVi = BehaviorSubject();
  BehaviorSubject<String> idDonVi = BehaviorSubject();

  void getValueTree({required String donVi, required String id}) {
    if (tenDonVi.value != donVi) {
      tenDonVi.sink.add(donVi);
      idDonVi.sink.add(id);
    }
  }

  void dispose() {}
}
