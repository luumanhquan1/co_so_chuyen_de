import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Center(
        child: Container(
          width: 340,
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(Icons.add),
              const SizedBox(height: 20,),
              Text('Title',style: titleAppbar(),),
              const SizedBox(height: 14,),
              Text('chi tiet',style: textNormal(dateColor,14),),
              const SizedBox(height: 24,),
              Row(
                children: [
                  Expanded(
                    child: ButtonCustomBottom(isColorBlue: false,
                    title: 'thoat', onPressed: (){

                      },),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: ButtonCustomBottom(isColorBlue: true,
                      title: 'dong y', onPressed: (){
                      },),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}