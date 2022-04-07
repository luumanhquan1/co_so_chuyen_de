class NhomCVMoiModel {
  String createdBy;
  String createdOn;
  String id;
  bool isDeleted;
  String label;
  String updatedBy;
  String updatedOn;
  int? number;

  NhomCVMoiModel(
      {required this.createdBy,
      required this.createdOn,
      required this.id,
      required this.isDeleted,
      required this.label,
      required this.updatedBy,
      required this.updatedOn,
      this.number});
}
