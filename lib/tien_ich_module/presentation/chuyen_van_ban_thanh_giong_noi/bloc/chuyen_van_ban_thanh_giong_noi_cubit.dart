import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ChuyenVanBanThanhGiongNoiCubit {
  BehaviorSubject<String> textEditingSubject = BehaviorSubject();

  Future<void> readFile(
    TextEditingController textEditingController,
  ) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );

    if (result != null) {
      final File file = File(result.files.single.path ?? '');

      textEditingController.text = file.readAsStringSync();
      textEditingSubject.add(file.readAsStringSync());
    }
  }
}
