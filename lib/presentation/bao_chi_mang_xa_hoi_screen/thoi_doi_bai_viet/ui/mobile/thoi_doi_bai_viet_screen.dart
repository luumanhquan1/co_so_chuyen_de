import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class TheoDoiBaiVietScreen extends StatefulWidget {
  const TheoDoiBaiVietScreen({Key? key}) : super(key: key);

  @override
  _TheoDoiBaiVietScreenState createState() => _TheoDoiBaiVietScreenState();
}

class _TheoDoiBaiVietScreenState extends State<TheoDoiBaiVietScreen> {
  TextEditingController nhapLaiMatKhauController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.nhap_linK_bao_cao,
              style: textNormalCustom(
                fontSize: 14,
                color: dateColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BaseSearchBar(
              hintText: S.current.nhap_link,
            ),
          ],
        ),
      ),
    );
  }
}
