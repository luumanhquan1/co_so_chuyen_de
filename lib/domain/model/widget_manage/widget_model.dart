class WidgetModel {
  String id = '';
  String name = '';

  WidgetModel({
    required this.id,
    required this.name,
  });

  WidgetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
