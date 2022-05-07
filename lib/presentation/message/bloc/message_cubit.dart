import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/bloc/main_state.dart';
import 'package:ccvc_mobile/presentation/tabbar_screen/ui/tabbar_item.dart';
import 'package:rxdart/rxdart.dart';

class MessageCubit extends BaseCubit<MainState> {
  MessageCubit() : super(MainStateInitial());
  List<MessageSmsModel> listFakeData = [
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: '232 1 231 2312 12 31 12312 123 123 123 1',
        loaiTinNhan: 0),
    MessageSmsModel(
        id: '1',
        isMe: false,
        content: '232 1 231 2312 12 31 12312 123 123 123 1',
        loaiTinNhan: 0),
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: 'https://scontent.xx.fbcdn.net/v/t39.1997-6/48587759_2115225085456974_6104059984100720640_n.webp?_nc_cat=1&ccb=1-6&_nc_sid=0572db&_nc_ohc=IAkAcI86G_cAX_EmJTv&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=00_AT8vG7IDrn8dr16g7XwvowjOPtdlDcJT6nUK48BRr8Y9Pg&oe=627A9FD1',
        loaiTinNhan: 1),
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: '232 1 231 2312 12 31 12312 123 123 123 1',
        loaiTinNhan: 0),
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: '232 1 231 2312 12 31 12312 123 123 123 1',
        loaiTinNhan: 0),
    MessageSmsModel(
        id: '1',
        isMe: false,
        content: '232 1 231 2312 12 31 12312 123 123 123 1',
        loaiTinNhan: 0),
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: '232 1 231 2312 12 31 12312 123 123 123 1',
        loaiTinNhan: 0),
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: '232 1 231 2312 12 31 12312 123 123 123 1 kwrwek wek wpeok pwek pwekprowekr pơkp rơekopr kweporkwpe kpwek pewok pơek oewkopwekr ơperrk ewop r',
        loaiTinNhan: 0),
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: 'https://vieclamthemonline.com/wp-content/uploads/2021/10/anh-ngoc-trinh-day-hap-dan.jpg',
        loaiTinNhan: 1),
    MessageSmsModel(
        id: '1',
        isMe: false,
        content: 'https://danviet.mediacdn.vn/upload/3-2019/images/2019-08-19/Ngoc-Trinh-co-chung-minh-nguc-day-goi-cam-co-dap-tan-su-co-vong-1-5t-1566175482-width596height960.jpg',
        loaiTinNhan: 1),
    MessageSmsModel(
        id: '1',
        isMe: true,
        content: '232 1 231 2312 12 31 12312 123 123 123 1',
        loaiTinNhan: 0)
  ];
}
