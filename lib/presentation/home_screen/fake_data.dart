import 'package:ccvc_mobile/domain/model/home/document_model.dart';
import 'package:ccvc_mobile/domain/model/home/tinh_huong_khan_cap_model.dart';

class FakeData {
  static final tinhKhanCap = <TinhHuongKhanCapModel>[
    TinhHuongKhanCapModel(
        id: '6183602f-f5fc-4cbe-9618-339658767f89',
        isLink: true,
        linkOrContent:
            'http://dongnaicdc.vn/cap-nhat-moi-nhat-tinh-hinh-dich-benh-covid-19-tai-dong-nai',
        title: 'Cập nhật mới nhất tình hình dịch bệnh COVID-19 tại Đồng Nai'),
    TinhHuongKhanCapModel(
        id: '6009d3c6-7908-42ca-8502-5139da346a98',
        isLink: true,
        linkOrContent: 'http://dongnaicdc.vn/',
        title:
            'Đồng Nai sẽ hỗ trợ gần 8.00 công dân về quê tỉnh Phú Yên trong chiều ngày 25.11'),
    TinhHuongKhanCapModel(
        id: 'b6d248b3-1120-44e3-ba97-c48e2a8f5fe2',
        isLink: true,
        linkOrContent:
            'http://dongnaicdc.vn/sang-12-11-them-247-ca-mac-trong-cong-dong-hon-95-ngan-tre-tu-15-den-duoi-18-tuoi-da-tiem-vac-xin-covid-19',
        title:
            'Sáng 12-11, thêm 247 ca mắc trong cộng đồng; hơn 95 ngàn trẻ từ 15 đến dưới 18 tuổi đã tiêm vắc xin COVID-19'),
    TinhHuongKhanCapModel(
        id: 'f7034c54-d00c-44a3-9105-f3f7d8ec1227',
        isLink: true,
        linkOrContent:
            'http://dongnaicdc.vn/ngay-11-11-co-8-162-ca-mac-covid-19-tai-56-dia-phuong-tp-hcm-nhieu-nhat-voi-gan-1-200-ca',
        title:
            'Ngày 11-11: Có 8.162 ca mắc COVID-19 tại 56 địa phương, TP.HCM nhiều nhất với gần 1.200 ca')
  ];
  static final tinhHinhXuLyDocVBDen = DocumentDashboardModel(
    soLuongChoXuLy: 5,
    soLuongDangXuLy: 0,
    soLuongDaXuLy: 17,
    soLuongChoVaoSo: 4,
  );
  static final tinhHinhXuLyDocVBDi = DocumentDashboardModel(
    soLuongChoTrinhKy: 30,
    soLuongChoXuLy: 12,
    soLuongDaXuLy: 14,
    soLuongChoCapSo: 14,
    soLuongChoBanHanh: 13
  );
}
