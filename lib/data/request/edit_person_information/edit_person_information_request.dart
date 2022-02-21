import 'package:json_annotation/json_annotation.dart';

part 'edit_person_information_request.g.dart';

@JsonSerializable()
class EditPersonInformationRequest {
  final String data;
  final bool isSuccess;

  EditPersonInformationRequest({required this.data, required this.isSuccess});

  factory EditPersonInformationRequest.fromJson(Map<String, dynamic> json) =>
      _$EditPersonInformationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditPersonInformationRequestToJson(this);
}
