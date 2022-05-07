import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'post_model.freezed.dart';
//
// part 'post_model.g.dart';

// @freezed
// @JsonSerializable()
// abstract class PostModel with _$PostModel{
//
//   factory PostModel({
//    String? postId,
//     String? userId,
//     int? type,
//     String? data,
//     String? createAt,
//     String? updateAt
//   }) = _PostModel;
class PostModel{
  String? postId;
      UserModel? author;
  int? type;
      String? content;
  String? createAt;
  String? imageUrl;
      String? updateAt;


  PostModel({this.postId, this.author, this.type, this.content, this.createAt,
    this.imageUrl,
    this.updateAt}); // factory PostModel.fromJson(Map<String, dynamic> json) =>
  //     _$PostModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$PostModelToJson(this);

  factory PostModel.fromJson(Map<String, dynamic> json)  => PostModel(
    postId: json['postId'] as String?,

    type: json['type'] as int?,
    content: json['content'] as String?,
    createAt: json['createAt'] as String?,
    updateAt: json['updateAt'] as String?,
    imageUrl: json['imageUrl'] as String?
  );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.author?.userId ?? '',
  'imageUrl': instance.imageUrl,
      'type': instance.type,
      'content': instance.content,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
}