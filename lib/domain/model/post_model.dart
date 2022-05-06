import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

@freezed
@JsonSerializable()
abstract class PostModel with _$PostModel{

  factory PostModel({
   String? postId,
    String? userId,
    int? type,
    String? data,
    String? createAt,
    String? updateAt
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}