import '/home_module/utils/constants/app_constants.dart';

enum WidgetType {
  wordProcessState,
  document,
  summaryOfTask,
  nhiemVu,
  situationHandlingPeople,
  peopleOpinions,
  workSchedule,
  meetingSchedule,
  pressSocialNetWork,
  listWork,
  eventOfDay,
  sinhNhat,
}

class WidgetModel {
  String id = '';
  String name = '';
  String? widgetTypeId;
  String? description;
  String? code;
  int? width;
  int? height;
  int? minWidth;
  int? minHeight;
  int? maxHeight;
  int? maxWidth;
  Props? props;
  String component = '';
  bool? static;
  bool? isResizable;
  String? thumbnail;
  String? appId;
  int? order;
  bool? isShowing;
  int? x;
  int? y;
  int? i;
  bool? enable;
  bool? moved;
  int? w;
  int? h;
  int? maxH;
  int? maxW;
  int? minH;
  int? minW;
  WidgetType? widgetType;

  WidgetModel({
    required this.id,
    required this.name,
    this.widgetTypeId,
    this.description,
    this.code,
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.maxHeight,
    this.maxWidth,
    this.props,
    required this.component,
    this.static,
    this.isResizable,
    this.thumbnail,
    this.appId,
    this.order,
    this.isShowing,
    this.x,
    this.y,
    this.i,
    this.enable,
    this.moved,
    this.w,
    this.h,
    this.maxH,
    this.maxW,
    this.minH,
    this.minW,
    this.widgetType,
  }) {
    widgetType = fromEnum();
  } //

  WidgetType? fromEnum() {
    switch (component) {
      case WidgetTypeConstant.TINH_HINH_XU_LY_VAN_BAN:
        return WidgetType.wordProcessState;
      case WidgetTypeConstant.VAN_BAN:
        return WidgetType.document;
      case WidgetTypeConstant.TONG_HOP_NHIEM_VU:
        return WidgetType.summaryOfTask;
      case WidgetTypeConstant.Y_KIEN_NGUOI_DAN:
        return WidgetType.peopleOpinions;
      case WidgetTypeConstant.LICH_LAM_VIEC:
        return WidgetType.workSchedule;
      case WidgetTypeConstant.LICH_HOP:
        return WidgetType.meetingSchedule;
      case WidgetTypeConstant.BAO_CHI:
        return WidgetType.pressSocialNetWork;
      case WidgetTypeConstant.DANH_SANH_CONG_VIEC:
        return WidgetType.listWork;
      case WidgetTypeConstant.SU_KIEN_TRONG_NGAY:
        return WidgetType.eventOfDay;
      case WidgetTypeConstant.SINH_NHAT:
        return WidgetType.sinhNhat;
      case WidgetTypeConstant.TINH_HINH_XU_LY_Y_KIEN:
        return WidgetType.situationHandlingPeople;
      case WidgetTypeConstant.NHIEM_VU:
        return WidgetType.nhiemVu;
    }
  }
}

class Props {
  Props();

  Props.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
