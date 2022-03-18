import 'dart:io';

import 'package:ccvc_mobile/tien_ich_module/presentation/phien_dich_tu_dong/ui/widget/language_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class PhienDichTuDongCubit {
  BehaviorSubject<LANGUAGE> languageSubject =
      BehaviorSubject.seeded(LANGUAGE.vn);

  Stream<LANGUAGE> get languageStream => languageSubject.stream;

  BehaviorSubject<int> lengthTextSubject = BehaviorSubject.seeded(0);

  Stream<int> get lengthTextStream => lengthTextSubject.stream;

  BehaviorSubject<String> textTranslateSubject = BehaviorSubject();

  Stream<String> get textTranslateStream => textTranslateSubject.stream;

  String textTranslate = 'It’s raining today';

  void translateLanguage(String text) {
    textTranslateSubject.add(text);
  }

  void swapLanguage() {
    if (languageSubject.value == LANGUAGE.vn) {
      languageSubject.add(LANGUAGE.en);
    } else {
      languageSubject.add(LANGUAGE.vn);
    }
  }

  Future<void> readFile(
    TextEditingController textEditingController,
    Function() viToEn,
    Function() enToVi,
  ) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );

    if (result != null) {
      final File file = File(result.files.single.path ?? '');

      textEditingController.text = file.readAsStringSync();
      textTranslateSubject.add(file.readAsStringSync());
      languageSubject.value == LANGUAGE.vn ? viToEn() : enToVi();
    }
  }
}
