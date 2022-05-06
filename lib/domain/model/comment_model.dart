import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
@JsonSerializable()
abstract class CommentModel with _$CommentModel{


  factory CommentModel({
    String? postId,
    String? userId,
    String? commentId,
    String? data,
    String? createAt,
    String? updateAt
  }) = _CommentModel;
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

}