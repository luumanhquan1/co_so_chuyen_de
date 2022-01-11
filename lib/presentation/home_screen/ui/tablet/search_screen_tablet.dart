import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/search_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/tu_khoa_pho_bien_widget.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreenTablet extends StatefulWidget {
  const SearchScreenTablet({Key? key}) : super(key: key);

  @override
  _SearchScreenTabletState createState() => _SearchScreenTabletState();
}

class _SearchScreenTabletState extends State<SearchScreenTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          S.current.tim_kiem,
          style: textNormalCustom(
            fontSize: 18.0.textScale(),
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: unselectLabelColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0.textScale(),
          vertical: 10.0.textScale(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchWidget(),
            SizedBox(
              height: 16.0.textScale(),
            ),
            Text(
              S.current.tu_khoa_pho_bien,
              style: textNormalCustom(
                color: unselectLabelColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.0.textScale(),
              ),
            ),
            SizedBox(
              height: 16.0.textScale(),
            ),
            TuKhoaPhoBienWidget(listKeyWord: fakeTuKhoaThongDung)
          ],
        ),
      ),
    );
  }
}
