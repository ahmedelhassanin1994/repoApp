
import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';

TextStyle _getTextStyle(double fontSize,String fontFamily,Color color,FontWeight fontWeight,final decoration){
  return TextStyle(
    fontSize: fontSize,
    fontFamily:fontFamily,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration
  );
}


// regular style
TextStyle getRegularStyle({double fontSize = FontSize.s12,required Color color,final decoration=TextDecoration.none}){
  return _getTextStyle(fontSize, FontsConstants.fonts_Family, color, FontsManager.regular,decoration);
}


// light style
TextStyle getLightStyle({double fontSize = FontSize.s12,required Color color,final decoration=TextDecoration.none}){
  return _getTextStyle(fontSize, FontsConstants.fonts_Family, color, FontsManager.light,decoration);
}

// bold style
TextStyle getBoldStyle({double fontSize = FontSize.s12,required Color color,final decoration=TextDecoration.none}){
  return _getTextStyle(fontSize, FontsConstants.fonts_Family, color, FontsManager.bold,decoration);
}

// semi Bold style
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12,required Color color,final decoration=TextDecoration.none}){
  return _getTextStyle(fontSize, FontsConstants.fonts_Family, color, FontsManager.semiBold,decoration);
}

// medium style
TextStyle getMediumStyle({double fontSize = FontSize.s12,required Color color,final decoration=TextDecoration.none}){
  return _getTextStyle(fontSize, FontsConstants.fonts_Family, color, FontsManager.medium,decoration);
}