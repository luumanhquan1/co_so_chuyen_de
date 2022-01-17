import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

final formatValue = NumberFormat('###,###,###.###', 'en_US');

extension StringHandle on String {
  String handleString() {
    final String result =
        '${substring(0, 7)}...${substring(length - 10, length)}';
    return result;
  }
}

extension StringMoneyFormat on String {
  String formatMoney(double money) {
    final String result = formatValue.format(money);
    return result;
  }
}

extension FormatAddress on String {
  String formatAddressWallet() {
    final String result = '${substring(0, 5)}...${substring(
      length - 4,
      length,
    )}';
    return result;
  }
}

extension FormatAddressConfirm on String {
  String formatAddressWalletConfirm() {
    final String result = '${substring(0, 10)}...${substring(
      length - 9,
      length,
    )}';
    return result;
  }
}

extension StringParse on String {
  String parseHtml() {
    final document = parse(this);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? '';
    return parsedString;
  }
}

extension CheckValidate on String {
  String? checkEmail() {
    final isCheck = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}")
        .hasMatch(this);
    if (isCheck) {
      return null;
    } else {
      return S.current.dinh_dang_email;
    }
  }

  String? checkSdt() {
    final isCheckSdt = RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(this);
    if (isCheckSdt) {
      return null;
    } else {
      return S.current.dinh_dang_sdt;
    }
  }
}
