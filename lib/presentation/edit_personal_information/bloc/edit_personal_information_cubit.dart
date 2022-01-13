import 'dart:io';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class EditPersonalInformationCubit
    extends BaseCubit<EditPersonalInformationState> {
  EditPersonalInformationCubit() : super(EditPersonalInformationInitial());
  BehaviorSubject<File> saveFile = BehaviorSubject();

  Stream<File> get saveFileStream => saveFile.stream;
  String ngaySinh = '';
  bool gioiTinh = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController maCanBoController = TextEditingController();
  TextEditingController thuTuController = TextEditingController();
  TextEditingController cmndController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sdtCoquanController = TextEditingController();
  TextEditingController sdtController = TextEditingController();
  TextEditingController diaChiLienHeController = TextEditingController();
  ManagerPersonalInformationModel managerPersonalInformationModel =
      ManagerPersonalInformationModel();

  void getValueController() {
    nameController.text = managerPersonalInformationModel.hoTen!.trim();
    emailController.text = managerPersonalInformationModel.email!.trim();
    sdtController.text = managerPersonalInformationModel.phoneDiDong!.trim();
  }

  Future<void> getCurrentUnit(
    ManagerPersonalInformationModel managerPersonalInformationModel,
  ) async {
    this.managerPersonalInformationModel = managerPersonalInformationModel;
    ngaySinh = managerPersonalInformationModel.ngaySinh ?? '';
    gioiTinh = managerPersonalInformationModel.gioiTinh ?? false;
  }

  Future<void> selectGTEvent(bool gioiTinh) async {
    this.gioiTinh = gioiTinh;
  }

  Future<void> selectBirthdayEvent(String birthday) async {
    ngaySinh = birthday;
  }

  Future<void> uploadImage({required File xFile}) async {
   // File file = File();

    saveFile.sink.add(xFile);
  }

  void dispose() {}
}
