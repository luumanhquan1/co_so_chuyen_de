import 'package:ccvc_mobile/domain/model/home/document_model.dart';
import 'package:ccvc_mobile/domain/model/home/tinh_huong_khan_cap_model.dart';
import 'package:ccvc_mobile/domain/model/home/todo_model.dart';

class FakeData {
  static final tinhKhanCap = <TinhHuongKhanCapModel>[
    TinhHuongKhanCapModel(
        id: '6183602f-f5fc-4cbe-9618-339658767f89',
        isLink: true,
        linkOrContent:
        'https://www.google.com/',
        title: 'Cập nhật mới nhất tình hình dịch bệnh COVID-19 tại Đồng Nai'),
    TinhHuongKhanCapModel(
        id: '6009d3c6-7908-42ca-8502-5139da346a98',
        isLink: true,
        linkOrContent: 'https://www.google.com/',
        title:
            'Đồng Nai sẽ hỗ trợ gần 8.00 công dân về quê tỉnh Phú Yên trong chiều ngày 25.11'),
    TinhHuongKhanCapModel(
        id: 'b6d248b3-1120-44e3-ba97-c48e2a8f5fe2',
        isLink: true,
        linkOrContent:
        'https://www.google.com/',
        title:
            'Sáng 12-11, thêm 247 ca mắc trong cộng đồng; hơn 95 ngàn trẻ từ 15 đến dưới 18 tuổi đã tiêm vắc xin COVID-19'),
    TinhHuongKhanCapModel(
        id: 'f7034c54-d00c-44a3-9105-f3f7d8ec1227',
        isLink: true,
        linkOrContent:
            'https://www.google.com/',
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
    soLuongChoBanHanh: 13,
  );
  static final listTodoWork = [
    TodoModel(
      id: "12312312312",
        important: false,
        inUsed: true,
        isDeleted: false,
        isTicked: true,
        label:
            '423 8932 48967532 9832  ư rwqe rư r hwue r r weuruwe wehruiewhru hui hewquhr uiwhe uhrewhr weh wehr ewuh riuwehriuweohr jhfuwe hueifh iuew hfeui hfeuwi fhiuewhr ijhsdfhuwieh fiufheiw iuwfh ưe798237 8832341 234 234 74 89372 9843274'),
    TodoModel(
        id: "1231221312331sad2312",
        important: true,
        inUsed: true,
        isDeleted: false,
        isTicked: false,
        label: 'gán việc3543'),
    TodoModel(
        id: "1231231212312312qưq321312",
        important: false,
        inUsed: true,
        isDeleted: false,
        isTicked: false,
        label: "23423213345"),
    TodoModel(
        id: "1231231121xzc31232312",
        important: false,
        inUsed: true,
        isDeleted: false,
        isTicked: true,
        label:
        "Việc thì nhiều nhưng làm không bao nhiêu :)"),
    TodoModel(
        id: "1231231231231dá23112",
        important: false,
        inUsed: true,
        isDeleted: false,
        isTicked: false,
        label:
        "123213"),
    TodoModel(
        id: "12312312ádasdqe31sda2",
        important: true,
        inUsed: true,
        isDeleted: false,
        isTicked: true,
        label:
        "Họp với ban Tổng Giám đốc"),

  ];
}
