import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/webview/web_view_screen.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HotNews extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String content;
  final String url;

  const HotNews(this.image, this.title, this.date, this.content,this.url, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Image(image: NetworkImage(image), fit: BoxFit.cover,),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          child: Text(
            title,
            style: textNormalCustom(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: titleCalenderWork,).copyWith(height: 1.3),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: (){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         WebViewScreen(url: url, title: ''),
            //   ),
            // );
            print(content);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(ImageAssets.icCalendar),
            const SizedBox(
              width: 10,
            ),
            Text(
              date,
              style: textNormalCustom(
                  color: unselectedLabelColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          content,
          style: textNormalCustom(
              color: unselectedLabelColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
