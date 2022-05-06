import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_model.freezed.dart';
part 'like_model.g.dart';


@freezed
@JsonSerializable()
abstract class LikeModel with _$LikeModel{


  factory LikeModel({
    String? postId,
    String? userId,
    String? likeId,
    String? createAt,
    String? updateAt
  }) = _LikeModel;

  factory LikeModel.fromJson(Map<String, dynamic> json) =>
      _$LikeModelFromJson(json);

  Map<String, dynamic> toJson() => _$LikeModelToJson(this);
}