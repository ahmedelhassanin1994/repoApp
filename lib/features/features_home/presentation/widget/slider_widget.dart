

import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderWidget extends StatelessWidget{

  late ReposEntities reposEntities;

  SliderWidget(this.reposEntities);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     decoration: BoxDecoration(
       color: ColorManager.select,
       borderRadius: BorderRadius.circular(AppRadius.r3.w)
     ),
     margin: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w,top: AppMargin.m2.h),
     padding: EdgeInsets.only(left: AppPading.p8.w,right: AppPading.p8.w,top: AppMargin.m2.h,bottom: AppMargin.m2.h),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           child:  Image.asset(ImageAssets.ImgRepo,
             fit: BoxFit.fill,
           ),
         ),

         Container(
           margin: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w),
           child: Text(
             reposEntities.name.length > 10 ? reposEntities.name.substring(0, 10)+'' : reposEntities.name,
             maxLines: 2,
             style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),
           ),
         ),
       ],
     ),

   );
  }

}