

import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



ThemeData getApplicationTheme(){

  return ThemeData(

    // main color of the app
    primaryColor:ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1, // will be used incase of disable button for example
    hintColor: ColorManager.grey,

    // ripple color
    splashColor: ColorManager.white,

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.white,
      titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16)
    ),

    buttonTheme: ButtonThemeData(
         shape: StadiumBorder(),
         disabledColor: ColorManager.grey1,
         buttonColor: ColorManager.primary,
         splashColor: ColorManager.white
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white,), backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
      )
    ),

    textTheme: TextTheme(
      displayLarge: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s22.sp),
      displayMedium: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
      displaySmall: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),
      headlineMedium: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
      headlineSmall: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
      titleLarge: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s16.sp),

      titleMedium: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s14.sp),
      titleSmall: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s16.sp),




      bodySmall: getRegularStyle(color: ColorManager.grey1,fontSize: AppSize.s14.sp),
      bodyLarge: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s15.sp),
      bodyMedium: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s15.sp),


    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPading.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey),
      // lable style
      labelStyle: getMediumStyle(color: ColorManager.darkGray),
      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),
      // enable border
      enabledBorder: OutlineInputBorder(
        borderSide:BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8),),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8),),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8),),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8),),
      ),

    )
  );
}