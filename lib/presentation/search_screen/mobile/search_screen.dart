import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/fake_data.dart';
import 'package:ccvc_mobile/presentation/search_screen/widget/search_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/tu_khoa_pho_bien_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          S.current.tim_kiem,
          style: textNormalCustom(
            fontSize: 18,
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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchWidget(),
            const SizedBox(
              height: 16,
            ),
            Text(
              S.current.tu_khoa_pho_bien,
              style: textNormalCustom(
                color: unselectLabelColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TuKhoaPhoBienWidget(listKeyWord: fakeTuKhoaThongDung)
          ],
        ),
      ),
    );
  }
}
