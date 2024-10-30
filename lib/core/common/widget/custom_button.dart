import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final onTab;
  final padding;
  final margin;
  final decoration;
  final text;
  final style;
  final icon;


 const CustomButton(
      {required this.onTab,
      required this.padding,
      required this.margin,
      required this.decoration,
      required this.text,
      required this.style,
      this.icon=null});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(

        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Container(
              child: icon,
            ),
           Container(
             child:  Text(
               text,
               style: style,
             ),
           ),


          ],
        )
      ),
    );
  }
}
