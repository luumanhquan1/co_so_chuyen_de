import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:ccvc_mobile/presentation/login/ui/widgets/custom_checkbox.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
enum TypeDocumentDetailRow { checkbox, text, fileActacks, status }

class DocumentDetailRow {
  String title = '';
  dynamic value;
  TypeDocumentDetailRow type = TypeDocumentDetailRow.text;

  DocumentDetailRow(this.title, this.value, this.type);

  DocumentDetailRow.DocumentDefault(
    this.title,
    this.value,
  );
}

extension TypeDataDocument on TypeDocumentDetailRow {
  Widget getWidgetVanBan({
    required DocumentDetailRow row,
    required DetailDocumentCubit cubit,
  }) {
    switch (this) {
      case TypeDocumentDetailRow.text:
        return Text(
          row.value,
          style: textNormalCustom(
            color: textTitle,
            fontWeight: FontWeight.w400,
            fontSize: 14.0.textScale(),
          ),
        );
      case TypeDocumentDetailRow.fileActacks:
        {
          final data = row.value as File;
          return Text(
            data.path,
            style: textNormalCustom(
              color: choXuLyColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.0.textScale(),
            ),
          );
        }
      case TypeDocumentDetailRow.status: {
        final data = row.value as String;

        return data.getStatusVanBan().getStatus();
      }
      case TypeDocumentDetailRow.checkbox:

       return Row(
         children: [
           SizedBox(
             height: 20,
             width: 41,
             child: CustomCheckBox(
               title: '',
               isCheck: row.value,
               onChange: (bool check) {},
             ),
           ),
           AutoSizeText(
             row.title,
             style: textNormalCustom(
               color: titleItemEdit,
               fontSize: 14.0,
               fontWeight: FontWeight.w400,
             ),
           ),
         ],
       );
    }
  }
}

enum StatusVanBan { quahan, chuath, dangth,chovaoso }

extension StatusChiTietVanBan on StatusVanBan {
  Widget getStatus() {
    switch (this) {
      case StatusVanBan.quahan:
        return statusChiTietVanBan(
          name: S.current.qua_han, background: statusCalenderRed,);
      case StatusVanBan.chuath:
        return statusChiTietVanBan(
          name: S.current.chua_thuc_hien, background: choVaoSoColor,);
      case StatusVanBan.dangth :
        return statusChiTietVanBan(
          name: S.current.dang_thuc_hien, background: choVaoSoColor,);
      case StatusVanBan.chovaoso :
        return statusChiTietVanBan(
          name: S.current.cho_vao_so, background: choVaoSoColor,);
    }
  }
}

extension GetStatusVanBan on String {
  StatusVanBan getStatusVanBan () {
    switch(this) {
      case 'QUA_HAN' :
        return StatusVanBan.quahan;

      case 'CHUA_THUC_HIEN':
        return StatusVanBan.chuath;

      case 'DANG_THUC_HIEN' :
        return StatusVanBan.dangth;
      case 'CHO_VAO_SO' :
        return StatusVanBan.chovaoso;

      default :
        return StatusVanBan.quahan;
    }
  }
}

Widget statusChiTietVanBan({required String name, required Color background}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.textScale(),
          vertical: 4.0.textScale(),
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          name,
          style: textNormalCustom(
            color: backgroundColorApp,
            fontSize: 12.0.textScale(),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
