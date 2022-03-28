import 'package:ccvc_mobile/home_module/domain/model/home/WidgetType.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quan_li_widget_response.g.dart';

@JsonSerializable()
class QuanLyWidgetResponse {
  @JsonKey(name: 'data')
  List<WidgetData> listWidget;

  QuanLyWidgetResponse(this.listWidget);

  factory QuanLyWidgetResponse.fromJson(Map<String, dynamic> json) =>
      _$QuanLyWidgetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuanLyWidgetResponseToJson(this);

  List<WidgetModel> toDomain() {
     return listWidget.map((e) => e.toDomain()).toList();
  }
}

@JsonSerializable()
class WidgetData{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'component')
  String? component;

  WidgetData(this.id, this.name, this.component);

  factory WidgetData.fromJson(Map<String, dynamic> json) =>
      _$WidgetDataFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetDataToJson(this);

  WidgetModel toDomain() =>
      WidgetModel(id: id ?? '', name: name ?? '', component: component ?? '');
}
