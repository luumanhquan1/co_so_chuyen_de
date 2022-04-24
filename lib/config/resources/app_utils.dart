import 'dart:developer';

import 'package:alilogi/domain/entities/type_customer_entity.dart';
import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static void logger(String msg) {
    log('alilogi_logger: $msg');
  }

  static String formatPhoneNumber(String phoneNumber) {
    String newPhoneNumber = '';

    for (int i = 0; i < phoneNumber.length; i++) {
      newPhoneNumber += phoneNumber[i];
      if (newPhoneNumber.length % 4 == 0) {
        newPhoneNumber += ' ';
      }
    }

    return newPhoneNumber;
  }

  static String formatMoney(String money) {
    String newMoney = '';
    int isDouble = money.indexOf('.');
    if (isDouble != -1) {
      money = money.replaceRange(isDouble, money.length, '');
    }
    if (money.length > 3) {
      int head = money.length % 3;
      newMoney += money.substring(0, head);
      if (newMoney.length > 0) {
        newMoney += ',';
      }
      for (int i = head; i < money.length; i = i + 3) {
        newMoney += money.substring(i, i + 3);
        if ((i + 3) != money.length) newMoney += ',';
      }
      return newMoney;
    }

    return money;
  }

  static String convertPhoneToOrigin(String phone) {
    String phoneNumber = phone.trim();
    if (!AppUtils.isNullEmpty(phoneNumber)) {
      phoneNumber = phoneNumber.replaceFirst('(+84)', '0');
      phoneNumber = phoneNumber.replaceFirst('+84', '0');
      // phoneNumber = phoneNumber.replace('0084', '0');
      phoneNumber = phoneNumber.replaceAll(' ', '');
      // phoneNumber = phoneNumber.replace(/[^0-9]/g, '');
    }
    return phoneNumber;
  }

  static String globalPhone(String phone) {
    final globalPhone = '+84${phone.substring(1)}';
    return globalPhone;
  }

  static bool isNullEmpty(Object? o) => o == null || "" == o;

  static bool isNullEmptyOrFalse(Object? o) =>
      o == null || false == o || "" == o;

  static bool isNullEmptyFalseOrZero(Object? o) =>
      o == null || false == o || 0 == o || "" == o || "0" == o;

  static bool isNullEmptyList<T>(List<T>? t) =>
      t == null || [] == t || t.isEmpty;
}

Map<int, Color> orderStatus = {
  2: AppColors.grey,
  4: AppColors.yellow,
  5: AppColors.purple,
  7: AppColors.red,
  9: AppColors.green,
  10: AppColors.orange,
};

Map<String, Color> productStatus = {
  'Chưa đặt hàng': AppColors.purple,
  'Đã về kho Việt Nam': AppColors.indigo,
  'Đã đặt hàng': AppColors.green,
  'Hết hàng': AppColors.red,
};
Map<String, Color> transportStatus = {
  "Chưa cập nhật": AppColors.transparent,
  'Thanh toán chưa xuất kho': AppColors.yellow,
  'Thanh toán xuất kho':  AppColors.green,
};
List<TypeCustomerEntity> typeCustomersList = [
  TypeCustomerEntity(id: 1, name: 'Khách hàng vận chuyển'),
  TypeCustomerEntity(
    id: 2,
    name: 'Khách hàng Order',
  ),
  TypeCustomerEntity(id: 3, name: 'Cả 2')
];

List<String> orderType=['1688, Taobao', 'Wechat'];

hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

const String _dateYearFormat = 'dd/MM/yyyy - HH:mm';

String secondToDateTimeString({int? seconds}) {
  return DateFormat(_dateYearFormat).format(
      DateTime.fromMillisecondsSinceEpoch(seconds!)
          .add(const Duration(hours: 7)));
}

double dateTimeStringToSecond({String? dateTimeString}) {
  int milliSeconds;
  milliSeconds =
      DateFormat(_dateYearFormat).parse(dateTimeString!).millisecondsSinceEpoch;
  return milliSeconds / 1000;
}

String formatPhoneNumber(String phoneNumber) {
  String newPhoneNumber = '';

  for (int i = 0; i < phoneNumber.length; i++) {
    if (phoneNumber[i] != ' ') {
      newPhoneNumber += phoneNumber[i];
    }
    if (newPhoneNumber.length % 4 == 0) {
      newPhoneNumber += ' ';
    }
  }

  return newPhoneNumber.trim();
}

bool isNullEmpty(Object? o) => o == null || "" == o || o == "null";

bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object? o) => o == null || false == o || 0 == o || "" == o || "0" == o;

bool isNullEmptyList<T>(List<T>? t) => t == null || [] == t || t.isEmpty;

bool isNullEmptyMap<T>(Map<T, T>? t) => t == null || {} == t || t.isEmpty;
