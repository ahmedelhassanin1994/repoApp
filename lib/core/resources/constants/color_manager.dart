

import 'package:flutter/cupertino.dart';

class ColorManager{


  static  Color primary=HexColor.fromHex("#FFCB05");
  static Color primary2=HexColor.fromHex("#FFCB05");
  static Color primary3=HexColor.fromHex("#E6D1D9");
  static Color primary4=HexColor.fromHex("#FCB9B2");
  static Color bt_gift=HexColor.fromHex("#C5117D");
  static Color color_arrow=HexColor.fromHex("#603872");
  static Color background_arrow=HexColor.fromHex("#707070");
  static Color color_rating=HexColor.fromHex("#FED668");







  static Color darkGray=HexColor.fromHex("#ED9728");
  static Color grey=HexColor.fromHex("#737477");
  static Color lightGrey=HexColor.fromHex("#F8F8F8");
  static Color primaryOpacity70=HexColor.fromHex("#B3ED9728");
  static Color black=HexColor.fromHex("#000000"); // red color
  static Color circle= HexColor.fromHex("#706f6f");
  static Color red= HexColor.fromHex("#CF0029");
  static Color select=HexColor.fromHex("#E6E6DC");
  static Color blue=HexColor.fromHex("#1842CC");
  static Color green=HexColor.fromHex("#22C15C");
  static Color primary_dark=HexColor.fromHex("#0F0C10");
  static Color background_chatt=HexColor.fromHex("#F5EFF8");
  static Color color_line=HexColor.fromHex("#E7EFFA");
  static Color orange= HexColor.fromHex("#FFA500");
  static Color Blue=HexColor.fromHex("#175CD3");
  static Color yellow=HexColor.fromHex("#FFFADA");


  // kOrderStatusColor
  static Color processing= HexColor.fromHex("#FFA500");
  static Color refunded= HexColor.fromHex("#FFA500");
  static Color cancelled= HexColor.fromHex("#FFA500");
  static Color completed= HexColor.fromHex("#FFA500");
  static Color failed= HexColor.fromHex("#FFA500");
  static Color pendding= HexColor.fromHex("#FFA500");
  static Color on_hold= HexColor.fromHex("#FFA500");





  // new color
  static Color darkPrimary=HexColor.fromHex("#d17d11");
  static Color grey1=HexColor.fromHex("#FCFBF9");
  static Color grey2=HexColor.fromHex("#9E9E9E");
  static Color grey3=HexColor.fromHex("#F2F4F7");
  static Color grey4=HexColor.fromHex("#E9EAEA");

  static Color white=HexColor.fromHex("#FFFFFF");
  static Color error=HexColor.fromHex("#e61f34"); // red color

}

extension HexColor on Color{

  static Color fromHex(String hexcolorstring){
    hexcolorstring=hexcolorstring.replaceAll("#", "");
    if(hexcolorstring.length==6){
      hexcolorstring="ff"+hexcolorstring;
    }

    return Color(int.parse(hexcolorstring,radix: 16));
  }
}