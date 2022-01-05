import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinTucThoiSuScreen extends StatefulWidget {
  @override
  State<TinTucThoiSuScreen> createState() => _TinTucThoiSuScreenState();
}

class _TinTucThoiSuScreenState extends State<TinTucThoiSuScreen> {
  var valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey)
                      ),
                      child: DropdownButton(
                        elevation: 0,
                          underline: SizedBox(),
                          value: valueChoose,
                          onChanged: (value) {
                            setState(() {
                              valueChoose = value;
                            });
                          },
                          items: <String>['Tin radio', 'Nghe đọc tin']
                              .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: textNormalCustom(
                                              color: titleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ))
                              .toList()),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: indicatorColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageAssets.icPlay),
                          Text(
                            S.current.nghe_doc_tin,
                            style: textNormalCustom(
                                color: indicatorColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
